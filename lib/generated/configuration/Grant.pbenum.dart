// This is a generated file - do not edit.
//
// Generated from Configuration/Grant.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class GrantType extends $pb.ProtobufEnum {
  static const GrantType GrantType_Unset =
      GrantType._(0, _omitEnumNames ? '' : 'GrantType_Unset');
  static const GrantType GrantType_Resource =
      GrantType._(1, _omitEnumNames ? '' : 'GrantType_Resource');

  static const $core.List<GrantType> values = <GrantType>[
    GrantType_Unset,
    GrantType_Resource,
  ];

  static final $core.List<GrantType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static GrantType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const GrantType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
