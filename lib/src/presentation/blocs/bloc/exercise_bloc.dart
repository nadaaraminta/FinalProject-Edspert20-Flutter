import 'package:edspert_20/src/domain/usecase/courses/get_exercises_by_course_usecase.dart';
import 'package:edspert_20/src/values/strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edspert_20/src/domain/entity/exercise_list_response_entity.dart';

part 'exercise_event.dart';
part 'exercise_state.dart';

class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  final GetExercisesByCourseUsecase getExercisesByCourseUsecase;
  
  ExerciseBloc(
    this.getExercisesByCourseUsecase,
  ) : super(ExerciseInitial()) {
    on<ExerciseEvent>((event, emit) async {
      if (event is ExercisesEvent) {
        emit(ExerciseLoadingState());

        final List<ExerciseDataEntity>? getExercises = await getExercisesByCourseUsecase(event.courseId);
        if (getExercises == null) {
          emit(ExerciseFailedState(Strings.somethingWentWrong));
        } else {
          emit(ExerciseSuccessState(getExercises));
        }
      }
    });
  }
}
