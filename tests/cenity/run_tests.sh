#!/bin/sh

PASSED=0
FAILED=0

for test in tik_*; do
  RESULT=0
  echo "Running: ${test}"
  ./${test} || RESULT=1
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
