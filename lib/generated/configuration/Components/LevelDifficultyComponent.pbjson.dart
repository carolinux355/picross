// This is a generated file - do not edit.
//
// Generated from Configuration/Components/LevelDifficultyComponent.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports
// ignore_for_file: unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use levelDifficultyComponentDescriptor instead')
const LevelDifficultyComponent$json = {
  '1': 'LevelDifficultyComponent',
  '2': [
    {
      '1': 'size_range',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.IntegerRange',
      '10': 'sizeRange'
    },
    {
      '1': 'difficulty_range',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.IntegerRange',
      '10': 'difficultyRange'
    },
  ],
};

/// Descriptor for `LevelDifficultyComponent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List levelDifficultyComponentDescriptor = $convert.base64Decode(
    'ChhMZXZlbERpZmZpY3VsdHlDb21wb25lbnQSLAoKc2l6ZV9yYW5nZRgBIAEoCzINLkludGVnZX'
    'JSYW5nZVIJc2l6ZVJhbmdlEjgKEGRpZmZpY3VsdHlfcmFuZ2UYAiABKAsyDS5JbnRlZ2VyUmFu'
    'Z2VSD2RpZmZpY3VsdHlSYW5nZQ==');
