// This is a generated file - do not edit.
//
// Generated from persistence/GameState.proto.

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
    {'1': 'xp', '3': 2, '4': 1, '5': 11, '6': '.XpState', '10': 'xp'},
    {
      '1': 'inventory',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.InventoryState',
      '10': 'inventory'
    },
    {'1': 'player_level', '3': 4, '4': 1, '5': 5, '10': 'playerLevel'},
    {
      '1': 'player_lives',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.PlayerLivesState',
      '10': 'playerLives'
    },
    {'1': 'ship', '3': 6, '4': 1, '5': 11, '6': '.ShipState', '10': 'ship'},
    {
      '1': 'crafting',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.CraftingState',
      '10': 'crafting'
    },
    {
      '1': 'persisted_level_state',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.PersistedLevelState',
      '10': 'persistedLevelState'
    },
  ],
};

/// Descriptor for `GameState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gameStateDescriptor = $convert.base64Decode(
    'CglHYW1lU3RhdGUSKgoRbnVtX2xldmVsc19wbGF5ZWQYASABKAVSD251bUxldmVsc1BsYXllZB'
    'IYCgJ4cBgCIAEoCzIILlhwU3RhdGVSAnhwEi0KCWludmVudG9yeRgDIAEoCzIPLkludmVudG9y'
    'eVN0YXRlUglpbnZlbnRvcnkSIQoMcGxheWVyX2xldmVsGAQgASgFUgtwbGF5ZXJMZXZlbBI0Cg'
    'xwbGF5ZXJfbGl2ZXMYBSABKAsyES5QbGF5ZXJMaXZlc1N0YXRlUgtwbGF5ZXJMaXZlcxIeCgRz'
    'aGlwGAYgASgLMgouU2hpcFN0YXRlUgRzaGlwEioKCGNyYWZ0aW5nGAcgASgLMg4uQ3JhZnRpbm'
    'dTdGF0ZVIIY3JhZnRpbmcSSAoVcGVyc2lzdGVkX2xldmVsX3N0YXRlGAggASgLMhQuUGVyc2lz'
    'dGVkTGV2ZWxTdGF0ZVITcGVyc2lzdGVkTGV2ZWxTdGF0ZQ==');
