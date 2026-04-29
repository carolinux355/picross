// This is a generated file - do not edit.
//
// Generated from configuration/LevelDifficultyComponent.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../Utils.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class LevelDifficultyComponent extends $pb.GeneratedMessage {
  factory LevelDifficultyComponent({
    $0.IntegerRange? sizeRange,
    $0.IntegerRange? difficultyRange,
  }) {
    final result = create();
    if (sizeRange != null) result.sizeRange = sizeRange;
    if (difficultyRange != null) result.difficultyRange = difficultyRange;
    return result;
  }

  LevelDifficultyComponent._();

  factory LevelDifficultyComponent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LevelDifficultyComponent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LevelDifficultyComponent',
      createEmptyInstance: create)
    ..aOM<$0.IntegerRange>(1, _omitFieldNames ? '' : 'sizeRange',
        subBuilder: $0.IntegerRange.create)
    ..aOM<$0.IntegerRange>(2, _omitFieldNames ? '' : 'difficultyRange',
        subBuilder: $0.IntegerRange.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LevelDifficultyComponent clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LevelDifficultyComponent copyWith(
          void Function(LevelDifficultyComponent) updates) =>
      super.copyWith((message) => updates(message as LevelDifficultyComponent))
          as LevelDifficultyComponent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LevelDifficultyComponent create() => LevelDifficultyComponent._();
  @$core.override
  LevelDifficultyComponent createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LevelDifficultyComponent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LevelDifficultyComponent>(create);
  static LevelDifficultyComponent? _defaultInstance;

  @$pb.TagNumber(1)
  $0.IntegerRange get sizeRange => $_getN(0);
  @$pb.TagNumber(1)
  set sizeRange($0.IntegerRange value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSizeRange() => $_has(0);
  @$pb.TagNumber(1)
  void clearSizeRange() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.IntegerRange ensureSizeRange() => $_ensure(0);

  @$pb.TagNumber(2)
  $0.IntegerRange get difficultyRange => $_getN(1);
  @$pb.TagNumber(2)
  set difficultyRange($0.IntegerRange value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasDifficultyRange() => $_has(1);
  @$pb.TagNumber(2)
  void clearDifficultyRange() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.IntegerRange ensureDifficultyRange() => $_ensure(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
