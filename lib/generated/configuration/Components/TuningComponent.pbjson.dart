// This is a generated file - do not edit.
//
// Generated from configuration/Components/TuningComponent.proto.

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

@$core.Deprecated('Use tuningComponentDescriptor instead')
const TuningComponent$json = {
  '1': 'TuningComponent',
  '2': [
    {'1': 'world_ids', '3': 1, '4': 3, '5': 9, '10': 'worldIds'},
    {
      '1': 'inventory_resources',
      '3': 2,
      '4': 3,
      '5': 9,
      '10': 'inventoryResources'
    },
    {
      '1': 'player_level_curve_id',
      '3': 3,
      '4': 1,
      '5': 9,
      '10': 'playerLevelCurveId'
    },
    {'1': 'xp_resource_id', '3': 4, '4': 1, '5': 9, '10': 'xpResourceId'},
    {
      '1': 'life_refill_duration',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Duration',
      '10': 'lifeRefillDuration'
    },
    {'1': 'initial_ships', '3': 6, '4': 3, '5': 9, '10': 'initialShips'},
  ],
};

/// Descriptor for `TuningComponent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tuningComponentDescriptor = $convert.base64Decode(
    'Cg9UdW5pbmdDb21wb25lbnQSGwoJd29ybGRfaWRzGAEgAygJUgh3b3JsZElkcxIvChNpbnZlbn'
    'RvcnlfcmVzb3VyY2VzGAIgAygJUhJpbnZlbnRvcnlSZXNvdXJjZXMSMQoVcGxheWVyX2xldmVs'
    'X2N1cnZlX2lkGAMgASgJUhJwbGF5ZXJMZXZlbEN1cnZlSWQSJAoOeHBfcmVzb3VyY2VfaWQYBC'
    'ABKAlSDHhwUmVzb3VyY2VJZBJLChRsaWZlX3JlZmlsbF9kdXJhdGlvbhgFIAEoCzIZLmdvb2ds'
    'ZS5wcm90b2J1Zi5EdXJhdGlvblISbGlmZVJlZmlsbER1cmF0aW9uEiMKDWluaXRpYWxfc2hpcH'
    'MYBiADKAlSDGluaXRpYWxTaGlwcw==');
