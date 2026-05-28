// This is a generated file - do not edit.
//
// Generated from persistence/UpgradeState.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class UpgradeState extends $pb.GeneratedMessage {
  factory UpgradeState({
    $core.String? currentId,
  }) {
    final result = create();
    if (currentId != null) result.currentId = currentId;
    return result;
  }

  UpgradeState._();

  factory UpgradeState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpgradeState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpgradeState',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'currentId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpgradeState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpgradeState copyWith(void Function(UpgradeState) updates) =>
      super.copyWith((message) => updates(message as UpgradeState))
          as UpgradeState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpgradeState create() => UpgradeState._();
  @$core.override
  UpgradeState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UpgradeState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpgradeState>(create);
  static UpgradeState? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get currentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set currentId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCurrentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCurrentId() => $_clearField(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
