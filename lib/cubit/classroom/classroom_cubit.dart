import 'package:ap1/cubit/classroom/classroom_initial_state_cubit.dart';

import 'model/classroom_item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClassroomCubit extends Cubit<List<ClassroomItemModel>> {
  ClassroomCubit() : super(classroomInitialStateCubit);

  ClassroomItemModel getById(int id) =>
      state.firstWhere((_classroom) => _classroom.id == id);
  void add(classroom) => emit([...state, classroom]);
  void remove(classroom) =>
      emit(state.where((_classroom) => _classroom.equal(classroom)).toList());
}
