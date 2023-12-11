import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:edspert_20/src/domain/entity/course_list_response_entity.dart';
import 'package:edspert_20/src/values/colors.dart';
import 'package:edspert_20/src/values/margins.dart';
import 'package:edspert_20/src/presentation/blocs/course/course_bloc.dart';
import '../widgets/course_list_widget.dart';

class CourseListScreen extends StatefulWidget {
  const CourseListScreen({super.key});

  @override
  State<CourseListScreen> createState() => _CourseListScreenState();
}

class _CourseListScreenState extends State<CourseListScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<CourseBloc>().add(
        CoursesEvent(
          majorName: 'IPA',
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseBloc, CourseState>(
      buildWhen: (prev, next) =>
        next is CourseLoadingState ||
        prev is CourseLoadingState && next is CourseSuccessState ||
        prev is CourseLoadingState && next is CourseFailedState,
      builder: (context, courseState) {
        Widget body = const SizedBox();

        if (courseState is CourseLoadingState) {
          body = const Center(
            child: CircularProgressIndicator(
              color: Color(0XFF3A7FD5),
            ),
          );
        }

        if (courseState is CourseSuccessState) {
          body = ListView.separated(
            padding: Margins.paddingPage,
            itemCount: courseState.data!.length,
            separatorBuilder: (context, index) => const SizedBox(height: 15),
            itemBuilder: (context, index) {
              CourseDataEntity data = courseState.data![index];
              return CourseListWidget(
                course: data,
              );
            },
          );
        }

        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppBar(
            backgroundColor: const Color(0XFF3A7FD5),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              }, 
              icon: const Icon(
                Icons.arrow_back,
                color: Color(0XFFFFFFFF),
              ),
            ),
            title: const Text(
              'Pilih Pelajaran',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: Color(0XFFFFFFFF),
              ),
            ),
          ),
          body: body,
        );
      },
    );
  }
}
