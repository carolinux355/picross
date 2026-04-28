// This is a generated file - do not edit.
//
// Generated from configuration/TestMessage.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class TestMessage extends $pb.GeneratedMessage {
  factory TestMessage({
    $core.int? intTest,
    $core.bool? boolTest,
  }) {
    final result = create();
    if (intTest != null) result.intTest = intTest;
    if (boolTest != null) result.boolTest = boolTest;
    return result;
  }

  TestMessage._();

  factory TestMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TestMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TestMessage',
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'intTest')
    ..aOB(2, _omitFieldNames ? '' : 'boolTest')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TestMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TestMessage copyWith(void Function(TestMessage) updates) =>
      super.copyWith((message) => updates(message as TestMessage))
          as TestMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TestMessage create() => TestMessage._();
  @$core.override
  TestMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TestMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TestMessage>(create);
  static TestMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get intTest => $_getIZ(0);
  @$pb.TagNumber(1)
  set intTest($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIntTest() => $_has(0);
  @$pb.TagNumber(1)
  void clearIntTest() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get boolTest => $_getBF(1);
  @$pb.TagNumber(2)
  set boolTest($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBoolTest() => $_has(1);
  @$pb.TagNumber(2)
  void clearBoolTest() => $_clearField(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
