// This is a generated file - do not edit.
//
// Generated from Configuration/Grant.proto.

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

@$core.Deprecated('Use grantTypeDescriptor instead')
const GrantType$json = {
  '1': 'GrantType',
  '2': [
    {'1': 'GrantType_Unset', '2': 0},
    {'1': 'GrantType_Resource', '2': 1},
  ],
};

/// Descriptor for `GrantType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List grantTypeDescriptor = $convert.base64Decode(
    'CglHcmFudFR5cGUSEwoPR3JhbnRUeXBlX1Vuc2V0EAASFgoSR3JhbnRUeXBlX1Jlc291cmNlEA'
    'E=');

@$core.Deprecated('Use grantDescriptor instead')
const Grant$json = {
  '1': 'Grant',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.GrantType', '10': 'type'},
    {'1': 'id', '3': 2, '4': 1, '5': 9, '10': 'id'},
    {'1': 'amount', '3': 3, '4': 1, '5': 5, '10': 'amount'},
  ],
};

/// Descriptor for `Grant`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List grantDescriptor = $convert.base64Decode(
    'CgVHcmFudBIeCgR0eXBlGAEgASgOMgouR3JhbnRUeXBlUgR0eXBlEg4KAmlkGAIgASgJUgJpZB'
    'IWCgZhbW91bnQYAyABKAVSBmFtb3VudA==');
