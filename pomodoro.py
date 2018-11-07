import argparse
import math
import os
import subprocess
import sys
import time


TASK_TYPE_DICT = {
    'pomodoro': 25 * 60,
    'talk': 30 * 60,
    'p' : 25 * 60,
    'short': 5 * 60,
    's': 5 * 60,
    'long': 10 * 60,
    'l': 10 * 60,
    'd': 1}


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('type', choices=sorted(TASK_TYPE_DICT.keys()))
    parser.add_argument('task')
    args = parser.parse_args()

    log_start = time.strftime('%Y-%m-%d %H:%M', time.localtime())

    total = TASK_TYPE_DICT[args.type]
    start = time.time()
    remaining = total

    print(format_time_output(remaining))
    while math.floor(remaining) > 0:
        elapsed = time.time() - start
        remaining = total - elapsed

        sys.stdout.write('\r' + format_time_output(remaining))
        sys.stdout.flush()

        time.sleep(float(1))

    log_end = time.strftime('%Y-%m-%d %H:%M', time.localtime())

    subprocess.run(['notify-send', 'Ding!'])

    duration = 0.15
    freq = 440
    play_cli_args = [
            'play',
            '--no-show-progress',
            '--null',
            '--channels',
            '1',
            'synth',
            str(duration),
            'sine',
            str(freq)]

    play_env = os.environ.copy()
    play_env['AUDIODRIVER'] = 'alsa'

    for _ in range(3):
        subprocess.run(play_cli_args, env=play_env)

    log_file = '.worklog.csv'
    log_file_exists = os.path.isfile(log_file)
    with open(log_file, 'a') as log_file_writer:
        if not log_file_exists:
            log_file_writer.write('start,end,arg,task')

        csv_line = ','.join([log_start, log_end, args.type, args.task])
        log_file_writer.write(csv_line)


def format_time_output(t):
    clock = time.strftime('%H:%M', time.localtime())
    minutes = int(math.floor(t / 60))
    seconds = int(math.floor(t % 60))
    return '[{}] {:02d}:{:02d}'.format(clock, minutes, seconds)


if __name__ == '__main__':
    main()
