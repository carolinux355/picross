// This is a generated file - do not edit.
//
// Generated from Configuration/ComponentSet.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'Components/AssetComponent.pb.dart' as $3;
import 'Components/FeatureComponent.pb.dart' as $5;
import 'Components/LevelDifficultyComponent.pb.dart' as $0;
import 'Components/LootTableComponent.pb.dart' as $6;
import 'Components/PlayerLevelCurveComponent.pb.dart' as $4;
import 'Components/ResourceComponent.pb.dart' as $2;
import 'Components/TuningComponent.pb.dart' as $1;
import 'Components/UpgradableComponent.pb.dart' as $8;
import 'Components/WorldComponent.pb.dart' as $7;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class ComponentSet extends $pb.GeneratedMessage {
  factory ComponentSet({
    $0.LevelDifficultyComponent? levelDifficulty,
    $1.TuningComponent? tuning,
    $2.ResourceComponent? resource,
    $3.AssetComponent? asset,
    $4.PlayerLevelCurveComponent? playerLevelCurve,
    $5.FeatureComponent? feature,
    $6.LootTableComponent? lootTable,
    $7.WorldComponent? world,
    $8.UpgradableComponent? upgradable,
  }) {
    final result = create();
    if (levelDifficulty != null) result.levelDifficulty = levelDifficulty;
    if (tuning != null) result.tuning = tuning;
    if (resource != null) result.resource = resource;
    if (asset != null) result.asset = asset;
    if (playerLevelCurve != null) result.playerLevelCurve = playerLevelCurve;
    if (feature != null) result.feature = feature;
    if (lootTable != null) result.lootTable = lootTable;
    if (world != null) result.world = world;
    if (upgradable != null) result.upgradable = upgradable;
    return result;
  }

  ComponentSet._();

  factory ComponentSet.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ComponentSet.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ComponentSet',
      createEmptyInstance: create)
    ..aOM<$0.LevelDifficultyComponent>(
        1, _omitFieldNames ? '' : 'levelDifficulty',
        subBuilder: $0.LevelDifficultyComponent.create)
    ..aOM<$1.TuningComponent>(2, _omitFieldNames ? '' : 'tuning',
        subBuilder: $1.TuningComponent.create)
    ..aOM<$2.ResourceComponent>(3, _omitFieldNames ? '' : 'resource',
        subBuilder: $2.ResourceComponent.create)
    ..aOM<$3.AssetComponent>(4, _omitFieldNames ? '' : 'asset',
        subBuilder: $3.AssetComponent.create)
    ..aOM<$4.PlayerLevelCurveComponent>(
        5, _omitFieldNames ? '' : 'playerLevelCurve',
        subBuilder: $4.PlayerLevelCurveComponent.create)
    ..aOM<$5.FeatureComponent>(6, _omitFieldNames ? '' : 'feature',
        subBuilder: $5.FeatureComponent.create)
    ..aOM<$6.LootTableComponent>(7, _omitFieldNames ? '' : 'lootTable',
        subBuilder: $6.LootTableComponent.create)
    ..aOM<$7.WorldComponent>(8, _omitFieldNames ? '' : 'world',
        subBuilder: $7.WorldComponent.create)
    ..aOM<$8.UpgradableComponent>(9, _omitFieldNames ? '' : 'upgradable',
        subBuilder: $8.UpgradableComponent.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ComponentSet clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ComponentSet copyWith(void Function(ComponentSet) updates) =>
      super.copyWith((message) => updates(message as ComponentSet))
          as ComponentSet;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ComponentSet create() => ComponentSet._();
  @$core.override
  ComponentSet createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ComponentSet getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ComponentSet>(create);
  static ComponentSet? _defaultInstance;

  @$pb.TagNumber(1)
  $0.LevelDifficultyComponent get levelDifficulty => $_getN(0);
  @$pb.TagNumber(1)
  set levelDifficulty($0.LevelDifficultyComponent value) =>
      $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasLevelDifficulty() => $_has(0);
  @$pb.TagNumber(1)
  void clearLevelDifficulty() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.LevelDifficultyComponent ensureLevelDifficulty() => $_ensure(0);

  @$pb.TagNumber(2)
  $1.TuningComponent get tuning => $_getN(1);
  @$pb.TagNumber(2)
  set tuning($1.TuningComponent value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasTuning() => $_has(1);
  @$pb.TagNumber(2)
  void clearTuning() => $_clearField(2);
  @$pb.TagNumber(2)
  $1.TuningComponent ensureTuning() => $_ensure(1);

  @$pb.TagNumber(3)
  $2.ResourceComponent get resource => $_getN(2);
  @$pb.TagNumber(3)
  set resource($2.ResourceComponent value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasResource() => $_has(2);
  @$pb.TagNumber(3)
  void clearResource() => $_clearField(3);
  @$pb.TagNumber(3)
  $2.ResourceComponent ensureResource() => $_ensure(2);

  @$pb.TagNumber(4)
  $3.AssetComponent get asset => $_getN(3);
  @$pb.TagNumber(4)
  set asset($3.AssetComponent value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasAsset() => $_has(3);
  @$pb.TagNumber(4)
  void clearAsset() => $_clearField(4);
  @$pb.TagNumber(4)
  $3.AssetComponent ensureAsset() => $_ensure(3);

  @$pb.TagNumber(5)
  $4.PlayerLevelCurveComponent get playerLevelCurve => $_getN(4);
  @$pb.TagNumber(5)
  set playerLevelCurve($4.PlayerLevelCurveComponent value) =>
      $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasPlayerLevelCurve() => $_has(4);
  @$pb.TagNumber(5)
  void clearPlayerLevelCurve() => $_clearField(5);
  @$pb.TagNumber(5)
  $4.PlayerLevelCurveComponent ensurePlayerLevelCurve() => $_ensure(4);

  @$pb.TagNumber(6)
  $5.FeatureComponent get feature => $_getN(5);
  @$pb.TagNumber(6)
  set feature($5.FeatureComponent value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasFeature() => $_has(5);
  @$pb.TagNumber(6)
  void clearFeature() => $_clearField(6);
  @$pb.TagNumber(6)
  $5.FeatureComponent ensureFeature() => $_ensure(5);

  @$pb.TagNumber(7)
  $6.LootTableComponent get lootTable => $_getN(6);
  @$pb.TagNumber(7)
  set lootTable($6.LootTableComponent value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasLootTable() => $_has(6);
  @$pb.TagNumber(7)
  void clearLootTable() => $_clearField(7);
  @$pb.TagNumber(7)
  $6.LootTableComponent ensureLootTable() => $_ensure(6);

  @$pb.TagNumber(8)
  $7.WorldComponent get world => $_getN(7);
  @$pb.TagNumber(8)
  set world($7.WorldComponent value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasWorld() => $_has(7);
  @$pb.TagNumber(8)
  void clearWorld() => $_clearField(8);
  @$pb.TagNumber(8)
  $7.WorldComponent ensureWorld() => $_ensure(7);

  @$pb.TagNumber(9)
  $8.UpgradableComponent get upgradable => $_getN(8);
  @$pb.TagNumber(9)
  set upgradable($8.UpgradableComponent value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasUpgradable() => $_has(8);
  @$pb.TagNumber(9)
  void clearUpgradable() => $_clearField(9);
  @$pb.TagNumber(9)
  $8.UpgradableComponent ensureUpgradable() => $_ensure(8);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
