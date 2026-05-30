// This is a generated file - do not edit.
//
// Generated from configuration/Requirement.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports
// ignore_for_file: unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use requirementTypeDescriptor instead')
const RequirementType$json = {
  '1': 'RequirementType',
  '2': [
    {'1': 'RequirementType_Unset', '2': 0},
    {'1': 'RequirementType_PlayerLevel', '2': 1},
    {'1': 'RequirementType_Resource', '2': 2},
    {'1': 'RequirementType_PlayerLives', '2': 3},
  ],
};

/// Descriptor for `RequirementType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List requirementTypeDescriptor = $convert.base64Decode(
    'Cg9SZXF1aXJlbWVudFR5cGUSGQoVUmVxdWlyZW1lbnRUeXBlX1Vuc2V0EAASHwobUmVxdWlyZW'
    '1lbnRUeXBlX1BsYXllckxldmVsEAESHAoYUmVxdWlyZW1lbnRUeXBlX1Jlc291cmNlEAISHwob'
    'UmVxdWlyZW1lbnRUeXBlX1BsYXllckxpdmVzEAM=');

@$core.Deprecated('Use comparisonTypeDescriptor instead')
const ComparisonType$json = {
  '1': 'ComparisonType',
  '2': [
    {'1': 'ComparisonType_Invalid', '2': 0},
    {'1': 'ComparisonType_GreaterThan', '2': 1},
    {'1': 'ComparisonType_GreaterThanOrEqual', '2': 2},
    {'1': 'ComparisonType_LessThan', '2': 3},
    {'1': 'ComparisonType_LessThanOrEqual', '2': 4},
    {'1': 'ComparisonType_Equal', '2': 5},
  ],
};

/// Descriptor for `ComparisonType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List comparisonTypeDescriptor = $convert.base64Decode(
    'Cg5Db21wYXJpc29uVHlwZRIaChZDb21wYXJpc29uVHlwZV9JbnZhbGlkEAASHgoaQ29tcGFyaX'
    'NvblR5cGVfR3JlYXRlclRoYW4QARIlCiFDb21wYXJpc29uVHlwZV9HcmVhdGVyVGhhbk9yRXF1'
    'YWwQAhIbChdDb21wYXJpc29uVHlwZV9MZXNzVGhhbhADEiIKHkNvbXBhcmlzb25UeXBlX0xlc3'
    'NUaGFuT3JFcXVhbBAEEhgKFENvbXBhcmlzb25UeXBlX0VxdWFsEAU=');

@$core.Deprecated('Use requirementDescriptor instead')
const Requirement$json = {
  '1': 'Requirement',
  '2': [
    {
      '1': 'type',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.RequirementType',
      '10': 'type'
    },
    {'1': 'id', '3': 2, '4': 1, '5': 9, '10': 'id'},
    {'1': 'amount', '3': 3, '4': 1, '5': 5, '10': 'amount'},
    {
      '1': 'comparison',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.ComparisonType',
      '10': 'comparison'
    },
  ],
};

/// Descriptor for `Requirement`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requirementDescriptor = $convert.base64Decode(
    'CgtSZXF1aXJlbWVudBIkCgR0eXBlGAEgASgOMhAuUmVxdWlyZW1lbnRUeXBlUgR0eXBlEg4KAm'
    'lkGAIgASgJUgJpZBIWCgZhbW91bnQYAyABKAVSBmFtb3VudBIvCgpjb21wYXJpc29uGAQgASgO'
    'Mg8uQ29tcGFyaXNvblR5cGVSCmNvbXBhcmlzb24=');
