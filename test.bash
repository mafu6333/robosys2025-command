#!/bin/bash
set -eu

out=$(printf "a\nb\n" | ./linenumber)
[ "$out" = $'1 a\n2 b' ] || exit 1

