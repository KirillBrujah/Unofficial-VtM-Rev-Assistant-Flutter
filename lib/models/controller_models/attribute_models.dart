import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vtm_assistant/models/models.dart';
import 'package:vtm_assistant/utils/enums.dart';

part 'attribute_models.freezed.dart';

@freezed
class AttributeModel with _$AttributeModel {
  const AttributeModel._();

  const factory AttributeModel({
    required int id,
    required String name,
    @Default(0) int value,
    required AttributeTypes type,
  }) = _AttributeControllerModel;

  factory AttributeModel.fromIsarAttribute(Attribute isarAttribute) =>
      AttributeModel(
        id: isarAttribute.id,
        name: isarAttribute.name,
        type: isarAttribute.type,
      );

  factory AttributeModel.fromIsarCharacterAttribute(
          CharacterAttribute isarCharacterAttribute) =>
      AttributeModel(
        id: isarCharacterAttribute.attribute.value!.id,
        name: isarCharacterAttribute.attribute.value!.name,
        type: isarCharacterAttribute.attribute.value!.type,
        value: isarCharacterAttribute.value,
      );

  bool get isPhysical => type == AttributeTypes.physical;

  bool get isSocial => type == AttributeTypes.social;

  bool get isMental => type == AttributeTypes.mental;
}
