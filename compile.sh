#!/bin/bash

ARCH=64
OUTPUT_FILE="fusion64.dll"

rm -rf ./obj

mkdir obj

make make_objects -j$(nproc) OUTPUT_FILE="$OUTPUT_FILE" BUILD_FOR="$BUILD_FOR"
make make_output OUTPUT_FILE="$OUTPUT_FILE" BUILD_FOR="$BUILD_FOR"

rm -rf ./obj

mv -f "$OUTPUT_FILE" "$DESTINATION"
