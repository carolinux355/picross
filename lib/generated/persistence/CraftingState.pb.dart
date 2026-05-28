// This is a generated file - do not edit.
//
// Generated from persistence/CraftingState.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;
import 'package:protobuf/well_known_types/google/protobuf/timestamp.pb.dart'
    as $1;

import '../configuration/Grant.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class CraftingState extends $pb.GeneratedMessage {
  factory CraftingState({
    $core.Iterable<CraftingInstance>? craftQueue,
    $core.int? maxQueueSize,
  }) {
    final result = create();
    if (craftQueue != null) result.craftQueue.addAll(craftQueue);
    if (maxQueueSize != null) result.maxQueueSize = maxQueueSize;
    return result;
  }

  CraftingState._();

  factory CraftingState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CraftingState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CraftingState',
      createEmptyInstance: create)
    ..pPM<CraftingInstance>(1, _omitFieldNames ? '' : 'craftQueue',
        subBuilder: CraftingInstance.create)
    ..aI(2, _omitFieldNames ? '' : 'maxQueueSize')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CraftingState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CraftingState copyWith(void Function(CraftingState) updates) =>
      super.copyWith((message) => updates(message as CraftingState))
          as CraftingState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CraftingState create() => CraftingState._();
  @$core.override
  CraftingState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CraftingState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CraftingState>(create);
  static CraftingState? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<CraftingInstance> get craftQueue => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get maxQueueSize => $_getIZ(1);
  @$pb.TagNumber(2)
  set maxQueueSize($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMaxQueueSize() => $_has(1);
  @$pb.TagNumber(2)
  void clearMaxQueueSize() => $_clearField(2);
}

class CraftingInstance extends $pb.GeneratedMessage {
  factory CraftingInstance({
    $core.String? craftingRecipeId,
    $core.Iterable<$0.Grant>? grants,
    $1.Timestamp? startTime,
  }) {
    final result = create();
    if (craftingRecipeId != null) result.craftingRecipeId = craftingRecipeId;
    if (grants != null) result.grants.addAll(grants);
    if (startTime != null) result.startTime = startTime;
    return result;
  }

  CraftingInstance._();

  factory CraftingInstance.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CraftingInstance.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CraftingInstance',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'craftingRecipeId')
    ..pPM<$0.Grant>(2, _omitFieldNames ? '' : 'grants',
        subBuilder: $0.Grant.create)
    ..aOM<$1.Timestamp>(3, _omitFieldNames ? '' : 'startTime',
        subBuilder: $1.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CraftingInstance clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CraftingInstance copyWith(void Function(CraftingInstance) updates) =>
      super.copyWith((message) => updates(message as CraftingInstance))
          as CraftingInstance;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CraftingInstance create() => CraftingInstance._();
  @$core.override
  CraftingInstance createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CraftingInstance getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CraftingInstance>(create);
  static CraftingInstance? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get craftingRecipeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set craftingRecipeId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCraftingRecipeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCraftingRecipeId() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<$0.Grant> get grants => $_getList(1);

  @$pb.TagNumber(3)
  $1.Timestamp get startTime => $_getN(2);
  @$pb.TagNumber(3)
  set startTime($1.Timestamp value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasStartTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearStartTime() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.Timestamp ensureStartTime() => $_ensure(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
