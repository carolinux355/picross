// This is a generated file - do not edit.
//
// Generated from Persistence/InventoryState.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class InventoryState extends $pb.GeneratedMessage {
  factory InventoryState({
    $core.Iterable<$core.MapEntry<$core.String, $core.int>>? resources,
  }) {
    final result = create();
    if (resources != null) result.resources.addEntries(resources);
    return result;
  }

  InventoryState._();

  factory InventoryState.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InventoryState.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InventoryState',
      createEmptyInstance: create)
    ..m<$core.String, $core.int>(1, _omitFieldNames ? '' : 'resources',
        entryClassName: 'InventoryState.ResourcesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InventoryState clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InventoryState copyWith(void Function(InventoryState) updates) =>
      super.copyWith((message) => updates(message as InventoryState))
          as InventoryState;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InventoryState create() => InventoryState._();
  @$core.override
  InventoryState createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InventoryState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InventoryState>(create);
  static InventoryState? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbMap<$core.String, $core.int> get resources => $_getMap(0);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
