#!/bin/bash

set -e

gnome-screenshot -f /tmp/screenshot.png "$@"
xclip -i -selection clipboard -target image/png </tmp/screenshot.png
