import 'package:edspert_20/src/domain/entity/exercise_list_response_entity.dart';
import 'package:edspert_20/src/presentation/blocs/bloc/exercise_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/exercise_list_widget.dart';

class ExerciseListScreenArgs {
  final String courseId;
  final String courseName;
  ExerciseListScreenArgs({
    required this.courseId,
    required this.courseName,
  });
}

class ExerciseListScreen extends StatefulWidget {
  const ExerciseListScreen({super.key});

  @override
  State<ExerciseListScreen> createState() => _ExerciseListScreenState();
}

class _ExerciseListScreenState extends State<ExerciseListScreen> {
  String courseName = '';
  
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final dynamic args = ModalRoute.of(context)?.settings.arguments;
    if (args is ExerciseListScreenArgs) {
      courseName = args.courseName;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F7F8),
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
        title: Text(
          courseName,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Color(0XFFFFFFFF),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Pilih Paket Soal',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
              ),
              BlocBuilder<ExerciseBloc, ExerciseState>(
                buildWhen: (prev, next) =>
                  next is ExerciseLoadingState ||
                  prev is ExerciseLoadingState && next is ExerciseSuccessState ||
                  prev is ExerciseLoadingState && next is ExerciseFailedState,
                builder: (context, exerciseState) {
                  print('test ${exerciseState.runtimeType}');

                  if (exerciseState is ExerciseLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Color(0XFF3A7FD5),
                      ),
                    );
                  }
                  
                  if (exerciseState is ExerciseSuccessState) {
                    final exerciseList = exerciseState.data ?? [];

                    if (exerciseList.isNotEmpty) {
                      return GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: exerciseList.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.5,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        itemBuilder: (context, index) {
                          ExerciseDataEntity data = exerciseList[index];
                          return ExerciseListWidget(exercise: data);
                        },
                      );
                    } else if (exerciseList.isEmpty) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          top: 180,
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/tidak_ada_soal.png',
                                height: 200,
                                width: 269,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                'Yah, Paket tidak tersedia',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 24,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                'Tenang, masih banyak yang bisa kamu pelajari.\ncari lagi yuk!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Color(0XFF99A1AC),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  }
                  
                  return 
                  // Text('test');
                  const Center(
                    child: CircularProgressIndicator(
                      color: Color(0XFF3A7FD5),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
