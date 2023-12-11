part of 'course_bloc.dart';

class CourseEvent {}

class CoursesEvent extends CourseEvent {
  final String majorName;

  CoursesEvent({
    required this.majorName,
  });
}
