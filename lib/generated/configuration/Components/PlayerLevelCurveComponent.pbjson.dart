// This is a generated file - do not edit.
//
// Generated from Configuration/Components/PlayerLevelCurveComponent.proto.

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

@$core.Deprecated('Use playerLevelCurveComponentDescriptor instead')
const PlayerLevelCurveComponent$json = {
  '1': 'PlayerLevelCurveComponent',
  '2': [
    {
      '1': 'levels',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.PlayerLevelCurveComponent.LevelsEntry',
      '10': 'levels'
    },
  ],
  '3': [PlayerLevelCurveComponent_LevelsEntry$json],
};

@$core.Deprecated('Use playerLevelCurveComponentDescriptor instead')
const PlayerLevelCurveComponent_LevelsEntry$json = {
  '1': 'LevelsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {
      '1': 'value',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.PlayerLevelCurveLevel',
      '10': 'value'
    },
  ],
  '7': {'7': true},
};

/// Descriptor for `PlayerLevelCurveComponent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playerLevelCurveComponentDescriptor = $convert.base64Decode(
    'ChlQbGF5ZXJMZXZlbEN1cnZlQ29tcG9uZW50Ej4KBmxldmVscxgBIAMoCzImLlBsYXllckxldm'
    'VsQ3VydmVDb21wb25lbnQuTGV2ZWxzRW50cnlSBmxldmVscxpRCgtMZXZlbHNFbnRyeRIQCgNr'
    'ZXkYASABKAlSA2tleRIsCgV2YWx1ZRgCIAEoCzIWLlBsYXllckxldmVsQ3VydmVMZXZlbFIFdm'
    'FsdWU6AjgB');

@$core.Deprecated('Use playerLevelCurveLevelDescriptor instead')
const PlayerLevelCurveLevel$json = {
  '1': 'PlayerLevelCurveLevel',
  '2': [
    {'1': 'min_xp', '3': 1, '4': 1, '5': 5, '10': 'minXp'},
    {'1': 'rewards', '3': 2, '4': 3, '5': 11, '6': '.Grant', '10': 'rewards'},
    {'1': 'level', '3': 3, '4': 1, '5': 5, '10': 'level'},
  ],
};

/// Descriptor for `PlayerLevelCurveLevel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playerLevelCurveLevelDescriptor = $convert.base64Decode(
    'ChVQbGF5ZXJMZXZlbEN1cnZlTGV2ZWwSFQoGbWluX3hwGAEgASgFUgVtaW5YcBIgCgdyZXdhcm'
    'RzGAIgAygLMgYuR3JhbnRSB3Jld2FyZHMSFAoFbGV2ZWwYAyABKAVSBWxldmVs');
