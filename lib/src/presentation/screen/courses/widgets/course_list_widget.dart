import 'package:edspert_20/src/presentation/blocs/course/course_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entity/course_list_response_entity.dart';
import '../../../router/routes.dart';
import '../exercise_list/exercise_list_screen.dart';

class CourseListWidget extends StatelessWidget {
  const CourseListWidget({
    super.key,
    required this.course,
  });

  final CourseDataEntity course;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseBloc, CourseState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(
              Routes.exerciseListScreen,
              arguments: ExerciseListScreenArgs(
                courseId: course.courseId,
                courseName: course.courseName,
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 21,
              horizontal: 18,
            ),
            child: Row(
              children: [
                Container(
                  width: 53,
                  height: 53,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF9F9F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(13),
                  child: Image.network(
                    course.urlCover,
                    width: 28,
                    height: 28,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Text(
                        'No Img',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        course.courseName,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        '${course.jumlahDone}/${course.jumlahMateri} '
                        'Paket latihan soal',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(
                        height: 11,
                      ),
                      LinearProgressIndicator(
                        value: course.jumlahDone /
                            (course.jumlahMateri == 0
                                ? 1
                                : course.jumlahMateri),
                        color: const Color(0XFF3A7FD5),
                        backgroundColor: const Color(0XFFF0F0F0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
