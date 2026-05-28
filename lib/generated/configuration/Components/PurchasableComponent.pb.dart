// This is a generated file - do not edit.
//
// Generated from configuration/Components/PurchasableComponent.proto.

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

class PurchasableComponent extends $pb.GeneratedMessage {
  factory PurchasableComponent({
    $core.Iterable<$0.Requirement>? unlock,
    $core.Iterable<$0.Requirement>? cost,
    $core.Iterable<$1.Grant>? grants,
  }) {
    final result = create();
    if (unlock != null) result.unlock.addAll(unlock);
    if (cost != null) result.cost.addAll(cost);
    if (grants != null) result.grants.addAll(grants);
    return result;
  }

  PurchasableComponent._();

  factory PurchasableComponent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PurchasableComponent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PurchasableComponent',
      createEmptyInstance: create)
    ..pPM<$0.Requirement>(1, _omitFieldNames ? '' : 'unlock',
        subBuilder: $0.Requirement.create)
    ..pPM<$0.Requirement>(2, _omitFieldNames ? '' : 'cost',
        subBuilder: $0.Requirement.create)
    ..pPM<$1.Grant>(3, _omitFieldNames ? '' : 'grants',
        subBuilder: $1.Grant.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PurchasableComponent clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PurchasableComponent copyWith(void Function(PurchasableComponent) updates) =>
      super.copyWith((message) => updates(message as PurchasableComponent))
          as PurchasableComponent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PurchasableComponent create() => PurchasableComponent._();
  @$core.override
  PurchasableComponent createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PurchasableComponent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PurchasableComponent>(create);
  static PurchasableComponent? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$0.Requirement> get unlock => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<$0.Requirement> get cost => $_getList(1);

  @$pb.TagNumber(3)
  $pb.PbList<$1.Grant> get grants => $_getList(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
