// This is a generated file - do not edit.
//
// Generated from persistence/ShipState.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'UpgradeState.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class ShipState extends $pb.GeneratedMessage {
  factory ShipState({
    $core.String? id,
    $0.UpgradeState? upgradeState,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (upgradeState != null) result.upgradeState = upgradeState;
    return result;
  }

  ShipState._();

  factory ShipState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ShipState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ShipState',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOM<$0.UpgradeState>(2, _omitFieldNames ? '' : 'upgradeState',
        subBuilder: $0.UpgradeState.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ShipState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ShipState copyWith(void Function(ShipState) updates) =>
      super.copyWith((message) => updates(message as ShipState)) as ShipState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ShipState create() => ShipState._();
  @$core.override
  ShipState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ShipState getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ShipState>(create);
  static ShipState? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $0.UpgradeState get upgradeState => $_getN(1);
  @$pb.TagNumber(2)
  set upgradeState($0.UpgradeState value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasUpgradeState() => $_has(1);
  @$pb.TagNumber(2)
  void clearUpgradeState() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.UpgradeState ensureUpgradeState() => $_ensure(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
