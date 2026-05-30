// This is a generated file - do not edit.
//
// Generated from persistence/PersistedLevelState.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;
import 'package:protobuf/well_known_types/google/protobuf/duration.pb.dart'
    as $1;

import '../configuration/Grant.pb.dart' as $2;
import '../configuration/Utils.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class PersistedLevelState extends $pb.GeneratedMessage {
  factory PersistedLevelState({
    $core.Iterable<$core.int>? tiles,
    $0.ProtoVector2? size,
    $1.Duration? playTime,
    $core.Iterable<$core.int>? markedTiles,
    $core.Iterable<$core.int>? revealedTiles,
    $core.Iterable<$core.MapEntry<$core.int, PersistedLevelTileContents>>?
        tileContents,
    $core.String? worldId,
    $core.bool? isComplete,
  }) {
    final result = create();
    if (tiles != null) result.tiles.addAll(tiles);
    if (size != null) result.size = size;
    if (playTime != null) result.playTime = playTime;
    if (markedTiles != null) result.markedTiles.addAll(markedTiles);
    if (revealedTiles != null) result.revealedTiles.addAll(revealedTiles);
    if (tileContents != null) result.tileContents.addEntries(tileContents);
    if (worldId != null) result.worldId = worldId;
    if (isComplete != null) result.isComplete = isComplete;
    return result;
  }

  PersistedLevelState._();

  factory PersistedLevelState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PersistedLevelState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PersistedLevelState',
      createEmptyInstance: create)
    ..p<$core.int>(1, _omitFieldNames ? '' : 'tiles', $pb.PbFieldType.K3)
    ..aOM<$0.ProtoVector2>(2, _omitFieldNames ? '' : 'size',
        subBuilder: $0.ProtoVector2.create)
    ..aOM<$1.Duration>(3, _omitFieldNames ? '' : 'playTime',
        subBuilder: $1.Duration.create)
    ..p<$core.int>(4, _omitFieldNames ? '' : 'markedTiles', $pb.PbFieldType.K3)
    ..p<$core.int>(
        5, _omitFieldNames ? '' : 'revealedTiles', $pb.PbFieldType.K3)
    ..m<$core.int, PersistedLevelTileContents>(
        6, _omitFieldNames ? '' : 'tileContents',
        entryClassName: 'PersistedLevelState.TileContentsEntry',
        keyFieldType: $pb.PbFieldType.O3,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: PersistedLevelTileContents.create,
        valueDefaultOrMaker: PersistedLevelTileContents.getDefault)
    ..aOS(7, _omitFieldNames ? '' : 'worldId')
    ..aOB(8, _omitFieldNames ? '' : 'isComplete')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PersistedLevelState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PersistedLevelState copyWith(void Function(PersistedLevelState) updates) =>
      super.copyWith((message) => updates(message as PersistedLevelState))
          as PersistedLevelState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PersistedLevelState create() => PersistedLevelState._();
  @$core.override
  PersistedLevelState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PersistedLevelState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PersistedLevelState>(create);
  static PersistedLevelState? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.int> get tiles => $_getList(0);

  @$pb.TagNumber(2)
  $0.ProtoVector2 get size => $_getN(1);
  @$pb.TagNumber(2)
  set size($0.ProtoVector2 value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasSize() => $_has(1);
  @$pb.TagNumber(2)
  void clearSize() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.ProtoVector2 ensureSize() => $_ensure(1);

  @$pb.TagNumber(3)
  $1.Duration get playTime => $_getN(2);
  @$pb.TagNumber(3)
  set playTime($1.Duration value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasPlayTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearPlayTime() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.Duration ensurePlayTime() => $_ensure(2);

  @$pb.TagNumber(4)
  $pb.PbList<$core.int> get markedTiles => $_getList(3);

  @$pb.TagNumber(5)
  $pb.PbList<$core.int> get revealedTiles => $_getList(4);

  @$pb.TagNumber(6)
  $pb.PbMap<$core.int, PersistedLevelTileContents> get tileContents =>
      $_getMap(5);

  @$pb.TagNumber(7)
  $core.String get worldId => $_getSZ(6);
  @$pb.TagNumber(7)
  set worldId($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasWorldId() => $_has(6);
  @$pb.TagNumber(7)
  void clearWorldId() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.bool get isComplete => $_getBF(7);
  @$pb.TagNumber(8)
  set isComplete($core.bool value) => $_setBool(7, value);
  @$pb.TagNumber(8)
  $core.bool hasIsComplete() => $_has(7);
  @$pb.TagNumber(8)
  void clearIsComplete() => $_clearField(8);
}

class PersistedLevelTileContents extends $pb.GeneratedMessage {
  factory PersistedLevelTileContents({
    $core.Iterable<$2.Grant>? grants,
    $core.bool? isBomb,
  }) {
    final result = create();
    if (grants != null) result.grants.addAll(grants);
    if (isBomb != null) result.isBomb = isBomb;
    return result;
  }

  PersistedLevelTileContents._();

  factory PersistedLevelTileContents.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PersistedLevelTileContents.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PersistedLevelTileContents',
      createEmptyInstance: create)
    ..pPM<$2.Grant>(1, _omitFieldNames ? '' : 'grants',
        subBuilder: $2.Grant.create)
    ..aOB(2, _omitFieldNames ? '' : 'isBomb')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PersistedLevelTileContents clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PersistedLevelTileContents copyWith(
          void Function(PersistedLevelTileContents) updates) =>
      super.copyWith(
              (message) => updates(message as PersistedLevelTileContents))
          as PersistedLevelTileContents;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PersistedLevelTileContents create() => PersistedLevelTileContents._();
  @$core.override
  PersistedLevelTileContents createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PersistedLevelTileContents getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PersistedLevelTileContents>(create);
  static PersistedLevelTileContents? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$2.Grant> get grants => $_getList(0);

  @$pb.TagNumber(2)
  $core.bool get isBomb => $_getBF(1);
  @$pb.TagNumber(2)
  set isBomb($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIsBomb() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsBomb() => $_clearField(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
