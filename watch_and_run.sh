#!/usr/bin/env bash

while inotifywait -r -e close_write lib test; do
  mix $@
done

