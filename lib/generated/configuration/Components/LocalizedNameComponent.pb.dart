// This is a generated file - do not edit.
//
// Generated from configuration/Components/LocalizedNameComponent.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class LocalizedNameComponent extends $pb.GeneratedMessage {
  factory LocalizedNameComponent({
    $core.String? name,
    $core.String? namePlural,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (namePlural != null) result.namePlural = namePlural;
    return result;
  }

  LocalizedNameComponent._();

  factory LocalizedNameComponent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LocalizedNameComponent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LocalizedNameComponent',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'namePlural')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LocalizedNameComponent clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LocalizedNameComponent copyWith(
          void Function(LocalizedNameComponent) updates) =>
      super.copyWith((message) => updates(message as LocalizedNameComponent))
          as LocalizedNameComponent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LocalizedNameComponent create() => LocalizedNameComponent._();
  @$core.override
  LocalizedNameComponent createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LocalizedNameComponent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LocalizedNameComponent>(create);
  static LocalizedNameComponent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get namePlural => $_getSZ(1);
  @$pb.TagNumber(2)
  set namePlural($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNamePlural() => $_has(1);
  @$pb.TagNumber(2)
  void clearNamePlural() => $_clearField(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
