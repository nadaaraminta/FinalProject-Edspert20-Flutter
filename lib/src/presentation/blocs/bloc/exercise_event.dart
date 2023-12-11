part of 'exercise_bloc.dart';

class ExerciseEvent {}

class ExercisesEvent extends ExerciseEvent {
  final String courseId;

  ExercisesEvent({
    required this.courseId,
  });
}
