// This is a generated file - do not edit.
//
// Generated from persistence/GameState.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'CraftingState.pb.dart' as $4;
import 'InventoryState.pb.dart' as $1;
import 'PersistedLevelState.pb.dart' as $5;
import 'PlayerLivesState.pb.dart' as $2;
import 'ShipState.pb.dart' as $3;
import 'XpState.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class GameState extends $pb.GeneratedMessage {
  factory GameState({
    $core.int? numLevelsPlayed,
    $0.XpState? xp,
    $1.InventoryState? inventory,
    $core.int? playerLevel,
    $2.PlayerLivesState? playerLives,
    $3.ShipState? ship,
    $4.CraftingState? crafting,
    $5.PersistedLevelState? persistedLevelState,
  }) {
    final result = create();
    if (numLevelsPlayed != null) result.numLevelsPlayed = numLevelsPlayed;
    if (xp != null) result.xp = xp;
    if (inventory != null) result.inventory = inventory;
    if (playerLevel != null) result.playerLevel = playerLevel;
    if (playerLives != null) result.playerLives = playerLives;
    if (ship != null) result.ship = ship;
    if (crafting != null) result.crafting = crafting;
    if (persistedLevelState != null)
      result.persistedLevelState = persistedLevelState;
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
    ..aOM<$0.XpState>(2, _omitFieldNames ? '' : 'xp',
        subBuilder: $0.XpState.create)
    ..aOM<$1.InventoryState>(3, _omitFieldNames ? '' : 'inventory',
        subBuilder: $1.InventoryState.create)
    ..aI(4, _omitFieldNames ? '' : 'playerLevel')
    ..aOM<$2.PlayerLivesState>(5, _omitFieldNames ? '' : 'playerLives',
        subBuilder: $2.PlayerLivesState.create)
    ..aOM<$3.ShipState>(6, _omitFieldNames ? '' : 'ship',
        subBuilder: $3.ShipState.create)
    ..aOM<$4.CraftingState>(7, _omitFieldNames ? '' : 'crafting',
        subBuilder: $4.CraftingState.create)
    ..aOM<$5.PersistedLevelState>(
        8, _omitFieldNames ? '' : 'persistedLevelState',
        subBuilder: $5.PersistedLevelState.create)
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
  $0.XpState get xp => $_getN(1);
  @$pb.TagNumber(2)
  set xp($0.XpState value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasXp() => $_has(1);
  @$pb.TagNumber(2)
  void clearXp() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.XpState ensureXp() => $_ensure(1);

  @$pb.TagNumber(3)
  $1.InventoryState get inventory => $_getN(2);
  @$pb.TagNumber(3)
  set inventory($1.InventoryState value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasInventory() => $_has(2);
  @$pb.TagNumber(3)
  void clearInventory() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.InventoryState ensureInventory() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.int get playerLevel => $_getIZ(3);
  @$pb.TagNumber(4)
  set playerLevel($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPlayerLevel() => $_has(3);
  @$pb.TagNumber(4)
  void clearPlayerLevel() => $_clearField(4);

  @$pb.TagNumber(5)
  $2.PlayerLivesState get playerLives => $_getN(4);
  @$pb.TagNumber(5)
  set playerLives($2.PlayerLivesState value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasPlayerLives() => $_has(4);
  @$pb.TagNumber(5)
  void clearPlayerLives() => $_clearField(5);
  @$pb.TagNumber(5)
  $2.PlayerLivesState ensurePlayerLives() => $_ensure(4);

  @$pb.TagNumber(6)
  $3.ShipState get ship => $_getN(5);
  @$pb.TagNumber(6)
  set ship($3.ShipState value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasShip() => $_has(5);
  @$pb.TagNumber(6)
  void clearShip() => $_clearField(6);
  @$pb.TagNumber(6)
  $3.ShipState ensureShip() => $_ensure(5);

  @$pb.TagNumber(7)
  $4.CraftingState get crafting => $_getN(6);
  @$pb.TagNumber(7)
  set crafting($4.CraftingState value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasCrafting() => $_has(6);
  @$pb.TagNumber(7)
  void clearCrafting() => $_clearField(7);
  @$pb.TagNumber(7)
  $4.CraftingState ensureCrafting() => $_ensure(6);

  @$pb.TagNumber(8)
  $5.PersistedLevelState get persistedLevelState => $_getN(7);
  @$pb.TagNumber(8)
  set persistedLevelState($5.PersistedLevelState value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasPersistedLevelState() => $_has(7);
  @$pb.TagNumber(8)
  void clearPersistedLevelState() => $_clearField(8);
  @$pb.TagNumber(8)
  $5.PersistedLevelState ensurePersistedLevelState() => $_ensure(7);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
