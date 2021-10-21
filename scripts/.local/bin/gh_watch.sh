#! /bin/bash

set -e

if gh run watch --exit-status ; then
    nvr -cc ':lua require("notify")("Pipeline succeded")'
else
    nvr -cc ':lua require("notify")("Pipeline failed.", "error")'
fi
