// This is a generated file - do not edit.
//
// Generated from configuration/Components/CraftingRecipeComponent.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;
import 'package:protobuf/well_known_types/google/protobuf/duration.pb.dart'
    as $2;

import '../Grant.pb.dart' as $1;
import '../Requirement.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class CraftingRecipeComponent extends $pb.GeneratedMessage {
  factory CraftingRecipeComponent({
    $core.Iterable<$0.Requirement>? cost,
    $core.Iterable<$1.Grant>? output,
    $2.Duration? duration,
  }) {
    final result = create();
    if (cost != null) result.cost.addAll(cost);
    if (output != null) result.output.addAll(output);
    if (duration != null) result.duration = duration;
    return result;
  }

  CraftingRecipeComponent._();

  factory CraftingRecipeComponent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CraftingRecipeComponent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CraftingRecipeComponent',
      createEmptyInstance: create)
    ..pPM<$0.Requirement>(1, _omitFieldNames ? '' : 'cost',
        subBuilder: $0.Requirement.create)
    ..pPM<$1.Grant>(2, _omitFieldNames ? '' : 'output',
        subBuilder: $1.Grant.create)
    ..aOM<$2.Duration>(3, _omitFieldNames ? '' : 'duration',
        subBuilder: $2.Duration.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CraftingRecipeComponent clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CraftingRecipeComponent copyWith(
          void Function(CraftingRecipeComponent) updates) =>
      super.copyWith((message) => updates(message as CraftingRecipeComponent))
          as CraftingRecipeComponent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CraftingRecipeComponent create() => CraftingRecipeComponent._();
  @$core.override
  CraftingRecipeComponent createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CraftingRecipeComponent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CraftingRecipeComponent>(create);
  static CraftingRecipeComponent? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$0.Requirement> get cost => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<$1.Grant> get output => $_getList(1);

  @$pb.TagNumber(3)
  $2.Duration get duration => $_getN(2);
  @$pb.TagNumber(3)
  set duration($2.Duration value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasDuration() => $_has(2);
  @$pb.TagNumber(3)
  void clearDuration() => $_clearField(3);
  @$pb.TagNumber(3)
  $2.Duration ensureDuration() => $_ensure(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
