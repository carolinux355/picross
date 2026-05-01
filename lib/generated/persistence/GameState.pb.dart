// This is a generated file - do not edit.
//
// Generated from Persistence/GameState.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'InventoryState.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class GameState extends $pb.GeneratedMessage {
  factory GameState({
    $core.int? numLevelsPlayed,
    $core.int? xp,
    $0.InventoryState? inventory,
  }) {
    final result = create();
    if (numLevelsPlayed != null) result.numLevelsPlayed = numLevelsPlayed;
    if (xp != null) result.xp = xp;
    if (inventory != null) result.inventory = inventory;
    return result;
  }

  GameState._();

  factory GameState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GameState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GameState',
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'numLevelsPlayed')
    ..aI(2, _omitFieldNames ? '' : 'xp')
    ..aOM<$0.InventoryState>(3, _omitFieldNames ? '' : 'inventory',
        subBuilder: $0.InventoryState.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GameState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GameState copyWith(void Function(GameState) updates) =>
      super.copyWith((message) => updates(message as GameState)) as GameState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GameState create() => GameState._();
  @$core.override
  GameState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GameState getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GameState>(create);
  static GameState? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get numLevelsPlayed => $_getIZ(0);
  @$pb.TagNumber(1)
  set numLevelsPlayed($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasNumLevelsPlayed() => $_has(0);
  @$pb.TagNumber(1)
  void clearNumLevelsPlayed() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get xp => $_getIZ(1);
  @$pb.TagNumber(2)
  set xp($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasXp() => $_has(1);
  @$pb.TagNumber(2)
  void clearXp() => $_clearField(2);

  @$pb.TagNumber(3)
  $0.InventoryState get inventory => $_getN(2);
  @$pb.TagNumber(3)
  set inventory($0.InventoryState value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasInventory() => $_has(2);
  @$pb.TagNumber(3)
  void clearInventory() => $_clearField(3);
  @$pb.TagNumber(3)
  $0.InventoryState ensureInventory() => $_ensure(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
