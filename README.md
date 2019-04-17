# Password-Checker-and-Process-Monitor
Part 1: Password Checker

For the first half of this project I have wrote a script that tests password strength. The input to the script will be the path to a file which contains only the password which will be tested. The password is tested against multiple regex patterns to see if the password matches any of the patterns we are looking for. I then add or subtract points from the password's "score" appropriately (the amount of points to add and subtract for each required regex check are included in the table below). My output consists of only the point total for the password contained in the file specified by the input. A password always starts with 0 points. The implementation for this is in the file pwcheck.sh.

Part 2: CPU and Memory Monitor

Imagine that you are a system administrator and you want to write a script to monitor CPU and memory usage for a given process id. You would like to write a script that: (1) generates CPU and memory usage reports and stores them in a directory; and (2) notifies you by email whenever CPU or memory usage exceeds certain thresholds that you set.

In order to get usage information on UNIX-like operating systems, you will go to the directory /proc. This directory is a virtual filesystem which does not contain “real” files; /proc contains system runtime information (e.g. system memory, process information, hardware configuration, etc). Every process created in the operating system has its own directory under /proc/{pid}, where {pid} is a process id. All information relevant to the process with ID {pid} is stored under that directory (including how long the process has been running, its CPU usage, its memory usage, etc). You will need to dive into the /proc filesystem in order to monitor CPU and memory usage for a given process.

For more information about the /proc filesystem, run the command “man proc”.
In order to list the processes running under your username, run the command: “ps -u $USER”.

The skeleton code in monitor.sh has several instructional comments to guide you through your implementation. You will also find a script called “script-consumer.sh”, which is a script that you can use to test the monitor with (it allocates a lot of memory and has a relatively high CPU usage). Note that you do not need to test the monitor with that script, but you may find it helpful.
