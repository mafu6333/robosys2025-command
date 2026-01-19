#!/bin/bash
# SPDX-FileCopyrightText: 2026 Fumiyori Manaka
# SPDX-License-Identifier: BSD-3-Clause

set -eu

# basic
out="$(printf "1+2\n3*4\n10/2\n" | ./calcpipe)"
[ "$out" = $'3\n12\n5.0' ] || { echo "basic failed"; exit 1; }

# ignore blank/comment
out="$(printf "\n# c\n2+3\n" | ./calcpipe)"
[ "$out" = "5" ] || { echo "comment/blank failed"; exit 1; }

# error line number + exit code
set +e
err="$(printf "1+2\nabc\n3+4\n" | ./calcpipe 2>&1 1>/dev/null)"
code=$?
set -e
echo "$err" | grep -q "line 2" || { echo "line number missing"; exit 1; }
[ $code -eq 1 ] || { echo "exit code should be 1"; exit 1; }

# deny dangerous things
set +e
printf "__import__('os').system('echo pwn')\n" | ./calcpipe >/dev/null 2>/dev/null
code=$?
set -e
[ $code -eq 1 ] || { echo "danger should fail"; exit 1; }

echo "OK"
