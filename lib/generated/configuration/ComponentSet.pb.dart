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
import 'Components/LevelDifficultyComponent.pb.dart' as $0;
import 'Components/ResourceComponent.pb.dart' as $2;
import 'Components/TuningComponent.pb.dart' as $1;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class ComponentSet extends $pb.GeneratedMessage {
  factory ComponentSet({
    $0.LevelDifficultyComponent? levelDifficulty,
    $1.TuningComponent? tuning,
    $2.ResourceComponent? resource,
    $3.AssetComponent? asset,
  }) {
    final result = create();
    if (levelDifficulty != null) result.levelDifficulty = levelDifficulty;
    if (tuning != null) result.tuning = tuning;
    if (resource != null) result.resource = resource;
    if (asset != null) result.asset = asset;
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
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
