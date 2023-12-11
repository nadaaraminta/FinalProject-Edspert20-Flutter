part of 'exercise_bloc.dart';

class ExerciseState {}

class ExerciseInitial extends ExerciseState {}

class ExerciseLoadingState extends ExerciseState {}

class ExerciseSuccessState extends ExerciseState {
  final List<ExerciseDataEntity>? data;
  ExerciseSuccessState(this.data);
}

class ExerciseFailedState extends ExerciseState {
  final String errorMessage;
  ExerciseFailedState(this.errorMessage);
}
