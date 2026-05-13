// This is a generated file - do not edit.
//
// Generated from Persistence/PlayerLivesState.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;
import 'package:protobuf/well_known_types/google/protobuf/timestamp.pb.dart'
    as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class PlayerLivesState extends $pb.GeneratedMessage {
  factory PlayerLivesState({
    $core.int? numLives,
    $0.Timestamp? lastRefillTime,
    $core.int? maxLives,
  }) {
    final result = create();
    if (numLives != null) result.numLives = numLives;
    if (lastRefillTime != null) result.lastRefillTime = lastRefillTime;
    if (maxLives != null) result.maxLives = maxLives;
    return result;
  }

  PlayerLivesState._();

  factory PlayerLivesState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PlayerLivesState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PlayerLivesState',
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'numLives')
    ..aOM<$0.Timestamp>(2, _omitFieldNames ? '' : 'lastRefillTime',
        subBuilder: $0.Timestamp.create)
    ..aI(3, _omitFieldNames ? '' : 'maxLives')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PlayerLivesState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PlayerLivesState copyWith(void Function(PlayerLivesState) updates) =>
      super.copyWith((message) => updates(message as PlayerLivesState))
          as PlayerLivesState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PlayerLivesState create() => PlayerLivesState._();
  @$core.override
  PlayerLivesState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PlayerLivesState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PlayerLivesState>(create);
  static PlayerLivesState? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get numLives => $_getIZ(0);
  @$pb.TagNumber(1)
  set numLives($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasNumLives() => $_has(0);
  @$pb.TagNumber(1)
  void clearNumLives() => $_clearField(1);

  @$pb.TagNumber(2)
  $0.Timestamp get lastRefillTime => $_getN(1);
  @$pb.TagNumber(2)
  set lastRefillTime($0.Timestamp value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasLastRefillTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastRefillTime() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.Timestamp ensureLastRefillTime() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get maxLives => $_getIZ(2);
  @$pb.TagNumber(3)
  set maxLives($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMaxLives() => $_has(2);
  @$pb.TagNumber(3)
  void clearMaxLives() => $_clearField(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
