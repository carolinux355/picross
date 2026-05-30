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

class RequirementType extends $pb.ProtobufEnum {
  static const RequirementType RequirementType_Unset =
      RequirementType._(0, _omitEnumNames ? '' : 'RequirementType_Unset');
  static const RequirementType RequirementType_PlayerLevel =
      RequirementType._(1, _omitEnumNames ? '' : 'RequirementType_PlayerLevel');
  static const RequirementType RequirementType_Resource =
      RequirementType._(2, _omitEnumNames ? '' : 'RequirementType_Resource');
  static const RequirementType RequirementType_PlayerLives =
      RequirementType._(3, _omitEnumNames ? '' : 'RequirementType_PlayerLives');

  static const $core.List<RequirementType> values = <RequirementType>[
    RequirementType_Unset,
    RequirementType_PlayerLevel,
    RequirementType_Resource,
    RequirementType_PlayerLives,
  ];

  static final $core.List<RequirementType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static RequirementType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const RequirementType._(super.value, super.name);
}

class ComparisonType extends $pb.ProtobufEnum {
  static const ComparisonType ComparisonType_Invalid =
      ComparisonType._(0, _omitEnumNames ? '' : 'ComparisonType_Invalid');
  static const ComparisonType ComparisonType_GreaterThan =
      ComparisonType._(1, _omitEnumNames ? '' : 'ComparisonType_GreaterThan');
  static const ComparisonType ComparisonType_GreaterThanOrEqual =
      ComparisonType._(
          2, _omitEnumNames ? '' : 'ComparisonType_GreaterThanOrEqual');
  static const ComparisonType ComparisonType_LessThan =
      ComparisonType._(3, _omitEnumNames ? '' : 'ComparisonType_LessThan');
  static const ComparisonType ComparisonType_LessThanOrEqual = ComparisonType._(
      4, _omitEnumNames ? '' : 'ComparisonType_LessThanOrEqual');
  static const ComparisonType ComparisonType_Equal =
      ComparisonType._(5, _omitEnumNames ? '' : 'ComparisonType_Equal');

  static const $core.List<ComparisonType> values = <ComparisonType>[
    ComparisonType_Invalid,
    ComparisonType_GreaterThan,
    ComparisonType_GreaterThanOrEqual,
    ComparisonType_LessThan,
    ComparisonType_LessThanOrEqual,
    ComparisonType_Equal,
  ];

  static final $core.List<ComparisonType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 5);
  static ComparisonType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ComparisonType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
