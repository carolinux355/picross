// This is a generated file - do not edit.
//
// Generated from configuration/Components/FeatureComponent.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../Requirement.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class FeatureComponent extends $pb.GeneratedMessage {
  factory FeatureComponent({
    $core.Iterable<$0.Requirement>? unlock,
  }) {
    final result = create();
    if (unlock != null) result.unlock.addAll(unlock);
    return result;
  }

  FeatureComponent._();

  factory FeatureComponent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FeatureComponent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FeatureComponent',
      createEmptyInstance: create)
    ..pPM<$0.Requirement>(1, _omitFieldNames ? '' : 'unlock',
        subBuilder: $0.Requirement.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FeatureComponent clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FeatureComponent copyWith(void Function(FeatureComponent) updates) =>
      super.copyWith((message) => updates(message as FeatureComponent))
          as FeatureComponent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FeatureComponent create() => FeatureComponent._();
  @$core.override
  FeatureComponent createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FeatureComponent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FeatureComponent>(create);
  static FeatureComponent? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$0.Requirement> get unlock => $_getList(0);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
