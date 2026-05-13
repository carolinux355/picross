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

class LootTableType extends $pb.ProtobufEnum {
  static const LootTableType LootTableType_Unset =
      LootTableType._(0, _omitEnumNames ? '' : 'LootTableType_Unset');
  static const LootTableType LootTableType_WeightedRoll =
      LootTableType._(1, _omitEnumNames ? '' : 'LootTableType_WeightedRoll');
  static const LootTableType LootTableType_PercentChance =
      LootTableType._(2, _omitEnumNames ? '' : 'LootTableType_PercentChance');

  static const $core.List<LootTableType> values = <LootTableType>[
    LootTableType_Unset,
    LootTableType_WeightedRoll,
    LootTableType_PercentChance,
  ];

  static final $core.List<LootTableType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static LootTableType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const LootTableType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
