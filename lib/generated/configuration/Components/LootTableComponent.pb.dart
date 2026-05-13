// This is a generated file - do not edit.
//
// Generated from Configuration/Components/LootTableComponent.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../Grant.pb.dart' as $0;
import 'LootTableComponent.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'LootTableComponent.pbenum.dart';

class LootTableComponent extends $pb.GeneratedMessage {
  factory LootTableComponent({
    $core.Iterable<LootTableRoll>? rolls,
  }) {
    final result = create();
    if (rolls != null) result.rolls.addAll(rolls);
    return result;
  }

  LootTableComponent._();

  factory LootTableComponent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LootTableComponent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LootTableComponent',
      createEmptyInstance: create)
    ..pPM<LootTableRoll>(1, _omitFieldNames ? '' : 'rolls',
        subBuilder: LootTableRoll.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LootTableComponent clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LootTableComponent copyWith(void Function(LootTableComponent) updates) =>
      super.copyWith((message) => updates(message as LootTableComponent))
          as LootTableComponent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LootTableComponent create() => LootTableComponent._();
  @$core.override
  LootTableComponent createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LootTableComponent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LootTableComponent>(create);
  static LootTableComponent? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<LootTableRoll> get rolls => $_getList(0);
}

class LootTableRoll extends $pb.GeneratedMessage {
  factory LootTableRoll({
    LootTableType? type,
    $core.Iterable<LootTableOutcome>? outcomes,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (outcomes != null) result.outcomes.addAll(outcomes);
    return result;
  }

  LootTableRoll._();

  factory LootTableRoll.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LootTableRoll.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LootTableRoll',
      createEmptyInstance: create)
    ..aE<LootTableType>(1, _omitFieldNames ? '' : 'type',
        enumValues: LootTableType.values)
    ..pPM<LootTableOutcome>(2, _omitFieldNames ? '' : 'outcomes',
        subBuilder: LootTableOutcome.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LootTableRoll clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LootTableRoll copyWith(void Function(LootTableRoll) updates) =>
      super.copyWith((message) => updates(message as LootTableRoll))
          as LootTableRoll;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LootTableRoll create() => LootTableRoll._();
  @$core.override
  LootTableRoll createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LootTableRoll getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LootTableRoll>(create);
  static LootTableRoll? _defaultInstance;

  @$pb.TagNumber(1)
  LootTableType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(LootTableType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<LootTableOutcome> get outcomes => $_getList(1);
}

class LootTableOutcome extends $pb.GeneratedMessage {
  factory LootTableOutcome({
    $core.Iterable<$0.Grant>? grants,
    $core.int? weight,
    $core.double? percentChance,
  }) {
    final result = create();
    if (grants != null) result.grants.addAll(grants);
    if (weight != null) result.weight = weight;
    if (percentChance != null) result.percentChance = percentChance;
    return result;
  }

  LootTableOutcome._();

  factory LootTableOutcome.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LootTableOutcome.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LootTableOutcome',
      createEmptyInstance: create)
    ..pPM<$0.Grant>(1, _omitFieldNames ? '' : 'grants',
        subBuilder: $0.Grant.create)
    ..aI(2, _omitFieldNames ? '' : 'weight')
    ..aD(3, _omitFieldNames ? '' : 'percentChance',
        fieldType: $pb.PbFieldType.OF)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LootTableOutcome clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LootTableOutcome copyWith(void Function(LootTableOutcome) updates) =>
      super.copyWith((message) => updates(message as LootTableOutcome))
          as LootTableOutcome;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LootTableOutcome create() => LootTableOutcome._();
  @$core.override
  LootTableOutcome createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LootTableOutcome getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LootTableOutcome>(create);
  static LootTableOutcome? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$0.Grant> get grants => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get weight => $_getIZ(1);
  @$pb.TagNumber(2)
  set weight($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasWeight() => $_has(1);
  @$pb.TagNumber(2)
  void clearWeight() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get percentChance => $_getN(2);
  @$pb.TagNumber(3)
  set percentChance($core.double value) => $_setFloat(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPercentChance() => $_has(2);
  @$pb.TagNumber(3)
  void clearPercentChance() => $_clearField(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
