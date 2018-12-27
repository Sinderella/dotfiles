#!/usr/bin/env python

import subprocess

p = subprocess.Popen('xrandr --query | grep " connected" | cut -d" " -f1', stdout=subprocess.PIPE, shell=True)
(output, err) = p.communicate()
p_status = p.wait()

output = output.split('\n')[:-1]
n = len(output)
output = output[::-1]

if n == 1:
    for i in range(1, 11):
        subprocess.call(['i3-msg', 'workspace {}, move workspace to output {}'.format(i, output[0])])
elif n == 2:
    for i in range(1, 6):
        subprocess.call(['i3-msg', 'workspace {}, move workspace to output {}'.format(i, output[0])])
    for i in range(6, 11):
        subprocess.call(['i3-msg', 'workspace {}, move workspace to output {}'.format(i, output[1])])
