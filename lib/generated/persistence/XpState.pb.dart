// This is a generated file - do not edit.
//
// Generated from persistence/XpState.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class XpState extends $pb.GeneratedMessage {
  factory XpState({
    $core.int? xp,
    $core.int? pendingXp,
  }) {
    final result = create();
    if (xp != null) result.xp = xp;
    if (pendingXp != null) result.pendingXp = pendingXp;
    return result;
  }

  XpState._();

  factory XpState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory XpState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'XpState',
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'xp')
    ..aI(2, _omitFieldNames ? '' : 'pendingXp')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  XpState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  XpState copyWith(void Function(XpState) updates) =>
      super.copyWith((message) => updates(message as XpState)) as XpState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static XpState create() => XpState._();
  @$core.override
  XpState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static XpState getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<XpState>(create);
  static XpState? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get xp => $_getIZ(0);
  @$pb.TagNumber(1)
  set xp($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasXp() => $_has(0);
  @$pb.TagNumber(1)
  void clearXp() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get pendingXp => $_getIZ(1);
  @$pb.TagNumber(2)
  set pendingXp($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPendingXp() => $_has(1);
  @$pb.TagNumber(2)
  void clearPendingXp() => $_clearField(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
