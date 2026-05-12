// This is a generated file - do not edit.
//
// Generated from Configuration/Components/PlayerLevelCurveComponent.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../Grant.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class PlayerLevelCurveComponent extends $pb.GeneratedMessage {
  factory PlayerLevelCurveComponent({
    $core.Iterable<$core.MapEntry<$core.String, PlayerLevelCurveLevel>>? levels,
  }) {
    final result = create();
    if (levels != null) result.levels.addEntries(levels);
    return result;
  }

  PlayerLevelCurveComponent._();

  factory PlayerLevelCurveComponent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PlayerLevelCurveComponent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PlayerLevelCurveComponent',
      createEmptyInstance: create)
    ..m<$core.String, PlayerLevelCurveLevel>(1, _omitFieldNames ? '' : 'levels',
        entryClassName: 'PlayerLevelCurveComponent.LevelsEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: PlayerLevelCurveLevel.create,
        valueDefaultOrMaker: PlayerLevelCurveLevel.getDefault)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PlayerLevelCurveComponent clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PlayerLevelCurveComponent copyWith(
          void Function(PlayerLevelCurveComponent) updates) =>
      super.copyWith((message) => updates(message as PlayerLevelCurveComponent))
          as PlayerLevelCurveComponent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PlayerLevelCurveComponent create() => PlayerLevelCurveComponent._();
  @$core.override
  PlayerLevelCurveComponent createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PlayerLevelCurveComponent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PlayerLevelCurveComponent>(create);
  static PlayerLevelCurveComponent? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbMap<$core.String, PlayerLevelCurveLevel> get levels => $_getMap(0);
}

class PlayerLevelCurveLevel extends $pb.GeneratedMessage {
  factory PlayerLevelCurveLevel({
    $core.int? minXp,
    $core.Iterable<$0.Grant>? rewards,
    $core.int? level,
  }) {
    final result = create();
    if (minXp != null) result.minXp = minXp;
    if (rewards != null) result.rewards.addAll(rewards);
    if (level != null) result.level = level;
    return result;
  }

  PlayerLevelCurveLevel._();

  factory PlayerLevelCurveLevel.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PlayerLevelCurveLevel.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PlayerLevelCurveLevel',
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'minXp')
    ..pPM<$0.Grant>(2, _omitFieldNames ? '' : 'rewards',
        subBuilder: $0.Grant.create)
    ..aI(3, _omitFieldNames ? '' : 'level')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PlayerLevelCurveLevel clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PlayerLevelCurveLevel copyWith(
          void Function(PlayerLevelCurveLevel) updates) =>
      super.copyWith((message) => updates(message as PlayerLevelCurveLevel))
          as PlayerLevelCurveLevel;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PlayerLevelCurveLevel create() => PlayerLevelCurveLevel._();
  @$core.override
  PlayerLevelCurveLevel createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PlayerLevelCurveLevel getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PlayerLevelCurveLevel>(create);
  static PlayerLevelCurveLevel? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get minXp => $_getIZ(0);
  @$pb.TagNumber(1)
  set minXp($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMinXp() => $_has(0);
  @$pb.TagNumber(1)
  void clearMinXp() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<$0.Grant> get rewards => $_getList(1);

  @$pb.TagNumber(3)
  $core.int get level => $_getIZ(2);
  @$pb.TagNumber(3)
  set level($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLevel() => $_has(2);
  @$pb.TagNumber(3)
  void clearLevel() => $_clearField(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
