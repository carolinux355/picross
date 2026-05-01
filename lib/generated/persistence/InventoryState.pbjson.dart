// This is a generated file - do not edit.
//
// Generated from Persistence/InventoryState.proto.

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

@$core.Deprecated('Use inventoryStateDescriptor instead')
const InventoryState$json = {
  '1': 'InventoryState',
  '2': [
    {
      '1': 'resources',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.InventoryState.ResourcesEntry',
      '10': 'resources'
    },
  ],
  '3': [InventoryState_ResourcesEntry$json],
};

@$core.Deprecated('Use inventoryStateDescriptor instead')
const InventoryState_ResourcesEntry$json = {
  '1': 'ResourcesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 5, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `InventoryState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List inventoryStateDescriptor = $convert.base64Decode(
    'Cg5JbnZlbnRvcnlTdGF0ZRI8CglyZXNvdXJjZXMYASADKAsyHi5JbnZlbnRvcnlTdGF0ZS5SZX'
    'NvdXJjZXNFbnRyeVIJcmVzb3VyY2VzGjwKDlJlc291cmNlc0VudHJ5EhAKA2tleRgBIAEoCVID'
    'a2V5EhQKBXZhbHVlGAIgASgFUgV2YWx1ZToCOAE=');
