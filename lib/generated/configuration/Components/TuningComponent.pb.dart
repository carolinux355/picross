// This is a generated file - do not edit.
//
// Generated from Configuration/Components/TuningComponent.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;
import 'package:protobuf/well_known_types/google/protobuf/duration.pb.dart'
    as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class TuningComponent extends $pb.GeneratedMessage {
  factory TuningComponent({
    $core.Iterable<$core.String>? worldIds,
    $core.Iterable<$core.String>? inventoryResources,
    $core.String? playerLevelCurveId,
    $core.String? xpResourceId,
    $0.Duration? lifeRefillDuration,
  }) {
    final result = create();
    if (worldIds != null) result.worldIds.addAll(worldIds);
    if (inventoryResources != null)
      result.inventoryResources.addAll(inventoryResources);
    if (playerLevelCurveId != null)
      result.playerLevelCurveId = playerLevelCurveId;
    if (xpResourceId != null) result.xpResourceId = xpResourceId;
    if (lifeRefillDuration != null)
      result.lifeRefillDuration = lifeRefillDuration;
    return result;
  }

  TuningComponent._();

  factory TuningComponent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TuningComponent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TuningComponent',
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'worldIds')
    ..pPS(2, _omitFieldNames ? '' : 'inventoryResources')
    ..aOS(3, _omitFieldNames ? '' : 'playerLevelCurveId')
    ..aOS(4, _omitFieldNames ? '' : 'xpResourceId')
    ..aOM<$0.Duration>(5, _omitFieldNames ? '' : 'lifeRefillDuration',
        subBuilder: $0.Duration.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TuningComponent clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TuningComponent copyWith(void Function(TuningComponent) updates) =>
      super.copyWith((message) => updates(message as TuningComponent))
          as TuningComponent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TuningComponent create() => TuningComponent._();
  @$core.override
  TuningComponent createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TuningComponent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TuningComponent>(create);
  static TuningComponent? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get worldIds => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get inventoryResources => $_getList(1);

  @$pb.TagNumber(3)
  $core.String get playerLevelCurveId => $_getSZ(2);
  @$pb.TagNumber(3)
  set playerLevelCurveId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPlayerLevelCurveId() => $_has(2);
  @$pb.TagNumber(3)
  void clearPlayerLevelCurveId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get xpResourceId => $_getSZ(3);
  @$pb.TagNumber(4)
  set xpResourceId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasXpResourceId() => $_has(3);
  @$pb.TagNumber(4)
  void clearXpResourceId() => $_clearField(4);

  @$pb.TagNumber(5)
  $0.Duration get lifeRefillDuration => $_getN(4);
  @$pb.TagNumber(5)
  set lifeRefillDuration($0.Duration value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasLifeRefillDuration() => $_has(4);
  @$pb.TagNumber(5)
  void clearLifeRefillDuration() => $_clearField(5);
  @$pb.TagNumber(5)
  $0.Duration ensureLifeRefillDuration() => $_ensure(4);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
