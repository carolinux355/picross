// This is a generated file - do not edit.
//
// Generated from persistence/PersistedLevelState.proto.

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

@$core.Deprecated('Use persistedLevelStateDescriptor instead')
const PersistedLevelState$json = {
  '1': 'PersistedLevelState',
  '2': [
    {'1': 'tiles', '3': 1, '4': 3, '5': 5, '10': 'tiles'},
    {'1': 'size', '3': 2, '4': 1, '5': 11, '6': '.ProtoVector2', '10': 'size'},
    {'1': 'difficulty', '3': 3, '4': 1, '5': 5, '10': 'difficulty'},
    {'1': 'marked_tiles', '3': 4, '4': 3, '5': 5, '10': 'markedTiles'},
    {'1': 'revealed_tiles', '3': 5, '4': 3, '5': 5, '10': 'revealedTiles'},
    {
      '1': 'tile_contents',
      '3': 6,
      '4': 3,
      '5': 11,
      '6': '.PersistedLevelState.TileContentsEntry',
      '10': 'tileContents'
    },
    {'1': 'world_id', '3': 7, '4': 1, '5': 9, '10': 'worldId'},
    {'1': 'is_complete', '3': 8, '4': 1, '5': 8, '10': 'isComplete'},
  ],
  '3': [PersistedLevelState_TileContentsEntry$json],
};

@$core.Deprecated('Use persistedLevelStateDescriptor instead')
const PersistedLevelState_TileContentsEntry$json = {
  '1': 'TileContentsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 5, '10': 'key'},
    {
      '1': 'value',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.PersistedLevelTileContents',
      '10': 'value'
    },
  ],
  '7': {'7': true},
};

/// Descriptor for `PersistedLevelState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List persistedLevelStateDescriptor = $convert.base64Decode(
    'ChNQZXJzaXN0ZWRMZXZlbFN0YXRlEhQKBXRpbGVzGAEgAygFUgV0aWxlcxIhCgRzaXplGAIgAS'
    'gLMg0uUHJvdG9WZWN0b3IyUgRzaXplEh4KCmRpZmZpY3VsdHkYAyABKAVSCmRpZmZpY3VsdHkS'
    'IQoMbWFya2VkX3RpbGVzGAQgAygFUgttYXJrZWRUaWxlcxIlCg5yZXZlYWxlZF90aWxlcxgFIA'
    'MoBVINcmV2ZWFsZWRUaWxlcxJLCg10aWxlX2NvbnRlbnRzGAYgAygLMiYuUGVyc2lzdGVkTGV2'
    'ZWxTdGF0ZS5UaWxlQ29udGVudHNFbnRyeVIMdGlsZUNvbnRlbnRzEhkKCHdvcmxkX2lkGAcgAS'
    'gJUgd3b3JsZElkEh8KC2lzX2NvbXBsZXRlGAggASgIUgppc0NvbXBsZXRlGlwKEVRpbGVDb250'
    'ZW50c0VudHJ5EhAKA2tleRgBIAEoBVIDa2V5EjEKBXZhbHVlGAIgASgLMhsuUGVyc2lzdGVkTG'
    'V2ZWxUaWxlQ29udGVudHNSBXZhbHVlOgI4AQ==');

@$core.Deprecated('Use persistedLevelTileContentsDescriptor instead')
const PersistedLevelTileContents$json = {
  '1': 'PersistedLevelTileContents',
  '2': [
    {'1': 'grants', '3': 1, '4': 3, '5': 11, '6': '.Grant', '10': 'grants'},
    {'1': 'is_bomb', '3': 2, '4': 1, '5': 8, '10': 'isBomb'},
  ],
};

/// Descriptor for `PersistedLevelTileContents`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List persistedLevelTileContentsDescriptor =
    $convert.base64Decode(
        'ChpQZXJzaXN0ZWRMZXZlbFRpbGVDb250ZW50cxIeCgZncmFudHMYASADKAsyBi5HcmFudFIGZ3'
        'JhbnRzEhcKB2lzX2JvbWIYAiABKAhSBmlzQm9tYg==');
