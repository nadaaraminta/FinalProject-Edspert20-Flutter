import 'package:edspert_20/src/values/strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edspert_20/src/domain/usecase/courses/get_courses_usecase.dart';

import 'package:edspert_20/src/domain/entity/course_list_response_entity.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final GetCoursesUsecase getCoursesUsecase;

  CourseBloc(
    this.getCoursesUsecase,
  ) : super(CourseInitial()) {
    on<CourseEvent>((event, emit) async {
      if (event is CoursesEvent) {
        emit(CourseLoadingState());

        final List<CourseDataEntity>? getCourses = await getCoursesUsecase(event.majorName);
        if (getCourses == null) {
          emit(CourseFailedState(Strings.somethingWentWrong));
        } else {
          emit(CourseSuccessState(getCourses));
        }
      }
    });
  }
}
