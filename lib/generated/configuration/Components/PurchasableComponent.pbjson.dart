// This is a generated file - do not edit.
//
// Generated from configuration/Components/PurchasableComponent.proto.

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

@$core.Deprecated('Use purchasableComponentDescriptor instead')
const PurchasableComponent$json = {
  '1': 'PurchasableComponent',
  '2': [
    {
      '1': 'unlock',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.Requirement',
      '10': 'unlock'
    },
    {'1': 'cost', '3': 2, '4': 3, '5': 11, '6': '.Requirement', '10': 'cost'},
    {'1': 'grants', '3': 3, '4': 3, '5': 11, '6': '.Grant', '10': 'grants'},
  ],
};

/// Descriptor for `PurchasableComponent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List purchasableComponentDescriptor = $convert.base64Decode(
    'ChRQdXJjaGFzYWJsZUNvbXBvbmVudBIkCgZ1bmxvY2sYASADKAsyDC5SZXF1aXJlbWVudFIGdW'
    '5sb2NrEiAKBGNvc3QYAiADKAsyDC5SZXF1aXJlbWVudFIEY29zdBIeCgZncmFudHMYAyADKAsy'
    'Bi5HcmFudFIGZ3JhbnRz');
