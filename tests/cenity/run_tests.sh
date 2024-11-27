#!/bin/sh

PASSED=0
FAILED=0

mode=diff

for p in "$@"; do
  case "$p" in
    --mode*)
      mode=$(sed 's/^--mode=//' <<< $p)
      ;;
    *)
      echo "Unknown parameter"
      exit 1
      ;;
  esac
done

if ! [[ "$mode" =~ ^(diff|output|sidebyside)$ ]]; then
  echo "Unknown mode: $mode"
  exit 1
fi

for test in tik_*; do
  RESULT=0
  echo
  echo "############## Running: ${test} ##############"
  mode="$mode" ./${test} || RESULT=1
  echo "Test result for ${test}: $RESULT"
  if [ $RESULT == 1 ]; then
    FAILED=$((FAILED+1))
  elif [ $RESULT == 0 ]; then
    PASSED=$((PASSED+1))
  else
    echo error
  fi
done

echo "Tests passed: $PASSED"
echo "Tests failed: $FAILED"

if [ $FAILED -gt 0 ]; then
    exit 1
else
    exit 0
fi
