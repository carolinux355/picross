#!/bin/zsh

echo "Compiling protobuf to generated dart"

protoc --dart_out=../lib/generated ./**/*.proto --plugin=protoc-gen-dart=$HOME/.pub-cache/bin/protoc-gen-dart

echo "Compilation complete"

exit 0
