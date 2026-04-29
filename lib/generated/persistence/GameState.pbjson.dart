// This is a generated file - do not edit.
//
// Generated from Persistence/GameState.proto.

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

@$core.Deprecated('Use gameStateDescriptor instead')
const GameState$json = {
  '1': 'GameState',
  '2': [
    {'1': 'num_levels_played', '3': 1, '4': 1, '5': 5, '10': 'numLevelsPlayed'},
    {'1': 'xp', '3': 2, '4': 1, '5': 5, '10': 'xp'},
  ],
};

/// Descriptor for `GameState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gameStateDescriptor = $convert.base64Decode(
    'CglHYW1lU3RhdGUSKgoRbnVtX2xldmVsc19wbGF5ZWQYASABKAVSD251bUxldmVsc1BsYXllZB'
    'IOCgJ4cBgCIAEoBVICeHA=');
