// This is a generated file - do not edit.
//
// Generated from persistence/PlayerLivesState.proto.

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

@$core.Deprecated('Use playerLivesStateDescriptor instead')
const PlayerLivesState$json = {
  '1': 'PlayerLivesState',
  '2': [
    {'1': 'num_lives', '3': 1, '4': 1, '5': 5, '10': 'numLives'},
    {
      '1': 'last_refill_time',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'lastRefillTime'
    },
    {'1': 'max_lives', '3': 3, '4': 1, '5': 5, '10': 'maxLives'},
  ],
};

/// Descriptor for `PlayerLivesState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playerLivesStateDescriptor = $convert.base64Decode(
    'ChBQbGF5ZXJMaXZlc1N0YXRlEhsKCW51bV9saXZlcxgBIAEoBVIIbnVtTGl2ZXMSRAoQbGFzdF'
    '9yZWZpbGxfdGltZRgCIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSDmxhc3RSZWZp'
    'bGxUaW1lEhsKCW1heF9saXZlcxgDIAEoBVIIbWF4TGl2ZXM=');
