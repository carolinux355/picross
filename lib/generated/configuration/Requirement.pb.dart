// This is a generated file - do not edit.
//
// Generated from configuration/Requirement.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'Requirement.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'Requirement.pbenum.dart';

class Requirement extends $pb.GeneratedMessage {
  factory Requirement({
    RequirementType? type,
    $core.String? id,
    $core.int? amount,
    ComparisonType? comparison,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (id != null) result.id = id;
    if (amount != null) result.amount = amount;
    if (comparison != null) result.comparison = comparison;
    return result;
  }

  Requirement._();

  factory Requirement.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Requirement.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Requirement',
      createEmptyInstance: create)
    ..aE<RequirementType>(1, _omitFieldNames ? '' : 'type',
        enumValues: RequirementType.values)
    ..aOS(2, _omitFieldNames ? '' : 'id')
    ..aI(3, _omitFieldNames ? '' : 'amount')
    ..aE<ComparisonType>(4, _omitFieldNames ? '' : 'comparison',
        enumValues: ComparisonType.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Requirement clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Requirement copyWith(void Function(Requirement) updates) =>
      super.copyWith((message) => updates(message as Requirement))
          as Requirement;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Requirement create() => Requirement._();
  @$core.override
  Requirement createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Requirement getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Requirement>(create);
  static Requirement? _defaultInstance;

  @$pb.TagNumber(1)
  RequirementType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(RequirementType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get id => $_getSZ(1);
  @$pb.TagNumber(2)
  set id($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get amount => $_getIZ(2);
  @$pb.TagNumber(3)
  set amount($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => $_clearField(3);

  @$pb.TagNumber(4)
  ComparisonType get comparison => $_getN(3);
  @$pb.TagNumber(4)
  set comparison(ComparisonType value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasComparison() => $_has(3);
  @$pb.TagNumber(4)
  void clearComparison() => $_clearField(4);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
