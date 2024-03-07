#!/usr/bin/python

import subprocess, os, argparse

parser = argparse.ArgumentParser()
parser.add_argument("--picom", help="start picom compositor", action="store_true")
parser.add_argument("--optimus", help="start optimus-manager-qt", action="store_true")
args = parser.parse_args()

# start picom compositor if it is installed
if args.picom and os.path.isfile("/usr/bin/picom"):
    subprocess.run("picom -b", shell = True, executable = "/bin/bash")

# start optimus-manager-qt if it is installed
if args.optimus and os.path.isfile("/usr/bin/optimus-manager-qt"):
    subprocess.run("optimus-manager-qt", shell = True, executable = "/bin/bash")

