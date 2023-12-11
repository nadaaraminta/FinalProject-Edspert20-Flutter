part of 'course_bloc.dart';

// Empty/Init
// Loading
// Load Success: Data List Mata Pelajaran
// Load Error: Error Message

/// Shared State
// enum LoadingState { init, loading, success, error }

// class CourseState {
//   final LoadingState getCoursesState;
//   final List<CourseDataEntity>? data;
//   final String? errorMessage;

//   CourseState({required this.getCoursesState, required this.data, required this.errorMessage});

//   CourseState copyWith({
//     LoadingState? getCoursesState,
//     List<CourseDataEntity>? data,
//     String? errorMessage,
//   }) {
//     return CourseState(
//       data: data ?? this.data,
//       errorMessage: errorMessage ?? this.errorMessage,
//       getCoursesState: getCoursesState ?? this.getCoursesState,
//     );
//   }

//   @override
//   String toString() => 'CourseState(getCoursesState: $getCoursesState, data: $data, errorMessage: $errorMessage)';
// }

// Sub Class State
class CourseState {}

class CourseInitial extends CourseState {}

/// Get Courses
class CourseLoadingState extends CourseState {}

class CourseSuccessState extends CourseState {
  final List<CourseDataEntity>? data;
  CourseSuccessState(this.data);
}

class CourseFailedState extends CourseState {
  final String errorMessage;
  CourseFailedState(this.errorMessage);
}
