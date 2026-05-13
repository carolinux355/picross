// This is a generated file - do not edit.
//
// Generated from Configuration/Components/WorldComponent.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class WorldComponent extends $pb.GeneratedMessage {
  factory WorldComponent({
    $core.String? lootTableId,
  }) {
    final result = create();
    if (lootTableId != null) result.lootTableId = lootTableId;
    return result;
  }

  WorldComponent._();

  factory WorldComponent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WorldComponent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WorldComponent',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'lootTableId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WorldComponent clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WorldComponent copyWith(void Function(WorldComponent) updates) =>
      super.copyWith((message) => updates(message as WorldComponent))
          as WorldComponent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WorldComponent create() => WorldComponent._();
  @$core.override
  WorldComponent createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WorldComponent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WorldComponent>(create);
  static WorldComponent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get lootTableId => $_getSZ(0);
  @$pb.TagNumber(1)
  set lootTableId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLootTableId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLootTableId() => $_clearField(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
