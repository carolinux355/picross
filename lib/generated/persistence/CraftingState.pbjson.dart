// This is a generated file - do not edit.
//
// Generated from persistence/CraftingState.proto.

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

@$core.Deprecated('Use craftingStateDescriptor instead')
const CraftingState$json = {
  '1': 'CraftingState',
  '2': [
    {
      '1': 'craft_queue',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.CraftingInstance',
      '10': 'craftQueue'
    },
    {'1': 'max_queue_size', '3': 2, '4': 1, '5': 5, '10': 'maxQueueSize'},
  ],
};

/// Descriptor for `CraftingState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List craftingStateDescriptor = $convert.base64Decode(
    'Cg1DcmFmdGluZ1N0YXRlEjIKC2NyYWZ0X3F1ZXVlGAEgAygLMhEuQ3JhZnRpbmdJbnN0YW5jZV'
    'IKY3JhZnRRdWV1ZRIkCg5tYXhfcXVldWVfc2l6ZRgCIAEoBVIMbWF4UXVldWVTaXpl');

@$core.Deprecated('Use craftingInstanceDescriptor instead')
const CraftingInstance$json = {
  '1': 'CraftingInstance',
  '2': [
    {
      '1': 'crafting_recipe_id',
      '3': 1,
      '4': 1,
      '5': 9,
      '10': 'craftingRecipeId'
    },
    {'1': 'grants', '3': 2, '4': 3, '5': 11, '6': '.Grant', '10': 'grants'},
    {
      '1': 'start_time',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'startTime'
    },
  ],
};

/// Descriptor for `CraftingInstance`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List craftingInstanceDescriptor = $convert.base64Decode(
    'ChBDcmFmdGluZ0luc3RhbmNlEiwKEmNyYWZ0aW5nX3JlY2lwZV9pZBgBIAEoCVIQY3JhZnRpbm'
    'dSZWNpcGVJZBIeCgZncmFudHMYAiADKAsyBi5HcmFudFIGZ3JhbnRzEjkKCnN0YXJ0X3RpbWUY'
    'AyABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUglzdGFydFRpbWU=');
