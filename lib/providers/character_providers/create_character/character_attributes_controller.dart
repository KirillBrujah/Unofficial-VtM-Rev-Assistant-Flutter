import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vtm_assistant/models/models.dart';
import 'package:vtm_assistant/providers/providers.dart';

part 'character_attributes_controller.g.dart';

@riverpod
class CharacterAttributesController extends _$CharacterAttributesController {
  @override
  FutureOr<List<AttributeModel>> build() async {
    final isar = await ref.watch(isarInstanceProvider.future);

    final isarAttributes = await isar.attributes.where().findAll();

    return isarAttributes
        .map((attribute) => AttributeModel.fromIsarAttribute(attribute))
        .toList();
  }

  void setValue(int id, int value) {
    final list = state.value!;
    final index = list.indexWhere((element) => element.id == id);
    final oldValue = list[index].value;

    state = AsyncValue.data(
      List.of(list)
        ..[index] = list[index]
            .copyWith(value: (oldValue == 1 && value == 1) ? 0 : value),
    );
  }
}
