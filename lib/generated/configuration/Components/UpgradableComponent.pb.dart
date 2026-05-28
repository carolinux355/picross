// This is a generated file - do not edit.
//
// Generated from configuration/Components/UpgradableComponent.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../Grant.pb.dart' as $1;
import '../Requirement.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class UpgradableComponent extends $pb.GeneratedMessage {
  factory UpgradableComponent({
    $core.Iterable<$0.Requirement>? cost,
    $core.String? nextId,
    $core.Iterable<$1.Grant>? grants,
  }) {
    final result = create();
    if (cost != null) result.cost.addAll(cost);
    if (nextId != null) result.nextId = nextId;
    if (grants != null) result.grants.addAll(grants);
    return result;
  }

  UpgradableComponent._();

  factory UpgradableComponent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpgradableComponent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpgradableComponent',
      createEmptyInstance: create)
    ..pPM<$0.Requirement>(1, _omitFieldNames ? '' : 'cost',
        subBuilder: $0.Requirement.create)
    ..aOS(2, _omitFieldNames ? '' : 'nextId')
    ..pPM<$1.Grant>(3, _omitFieldNames ? '' : 'grants',
        subBuilder: $1.Grant.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpgradableComponent clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpgradableComponent copyWith(void Function(UpgradableComponent) updates) =>
      super.copyWith((message) => updates(message as UpgradableComponent))
          as UpgradableComponent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpgradableComponent create() => UpgradableComponent._();
  @$core.override
  UpgradableComponent createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UpgradableComponent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpgradableComponent>(create);
  static UpgradableComponent? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$0.Requirement> get cost => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get nextId => $_getSZ(1);
  @$pb.TagNumber(2)
  set nextId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNextId() => $_has(1);
  @$pb.TagNumber(2)
  void clearNextId() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<$1.Grant> get grants => $_getList(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
