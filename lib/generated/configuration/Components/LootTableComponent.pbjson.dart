// This is a generated file - do not edit.
//
// Generated from configuration/Components/LootTableComponent.proto.

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

@$core.Deprecated('Use lootTableTypeDescriptor instead')
const LootTableType$json = {
  '1': 'LootTableType',
  '2': [
    {'1': 'LootTableType_Unset', '2': 0},
    {'1': 'LootTableType_WeightedRoll', '2': 1},
    {'1': 'LootTableType_PercentChance', '2': 2},
  ],
};

/// Descriptor for `LootTableType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List lootTableTypeDescriptor = $convert.base64Decode(
    'Cg1Mb290VGFibGVUeXBlEhcKE0xvb3RUYWJsZVR5cGVfVW5zZXQQABIeChpMb290VGFibGVUeX'
    'BlX1dlaWdodGVkUm9sbBABEh8KG0xvb3RUYWJsZVR5cGVfUGVyY2VudENoYW5jZRAC');

@$core.Deprecated('Use lootTableComponentDescriptor instead')
const LootTableComponent$json = {
  '1': 'LootTableComponent',
  '2': [
    {
      '1': 'rolls',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.LootTableRoll',
      '10': 'rolls'
    },
  ],
};

/// Descriptor for `LootTableComponent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List lootTableComponentDescriptor = $convert.base64Decode(
    'ChJMb290VGFibGVDb21wb25lbnQSJAoFcm9sbHMYASADKAsyDi5Mb290VGFibGVSb2xsUgVyb2'
    'xscw==');

@$core.Deprecated('Use lootTableRollDescriptor instead')
const LootTableRoll$json = {
  '1': 'LootTableRoll',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.LootTableType', '10': 'type'},
    {
      '1': 'outcomes',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.LootTableOutcome',
      '10': 'outcomes'
    },
  ],
};

/// Descriptor for `LootTableRoll`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List lootTableRollDescriptor = $convert.base64Decode(
    'Cg1Mb290VGFibGVSb2xsEiIKBHR5cGUYASABKA4yDi5Mb290VGFibGVUeXBlUgR0eXBlEi0KCG'
    '91dGNvbWVzGAIgAygLMhEuTG9vdFRhYmxlT3V0Y29tZVIIb3V0Y29tZXM=');

@$core.Deprecated('Use lootTableOutcomeDescriptor instead')
const LootTableOutcome$json = {
  '1': 'LootTableOutcome',
  '2': [
    {'1': 'grants', '3': 1, '4': 3, '5': 11, '6': '.Grant', '10': 'grants'},
    {'1': 'weight', '3': 2, '4': 1, '5': 5, '10': 'weight'},
    {'1': 'percent_chance', '3': 3, '4': 1, '5': 2, '10': 'percentChance'},
  ],
};

/// Descriptor for `LootTableOutcome`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List lootTableOutcomeDescriptor = $convert.base64Decode(
    'ChBMb290VGFibGVPdXRjb21lEh4KBmdyYW50cxgBIAMoCzIGLkdyYW50UgZncmFudHMSFgoGd2'
    'VpZ2h0GAIgASgFUgZ3ZWlnaHQSJQoOcGVyY2VudF9jaGFuY2UYAyABKAJSDXBlcmNlbnRDaGFu'
    'Y2U=');
