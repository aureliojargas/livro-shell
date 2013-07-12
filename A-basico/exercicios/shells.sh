#!/bin/bash
cat /etc/passwd | cut -d : -f 7 | sort | uniq

