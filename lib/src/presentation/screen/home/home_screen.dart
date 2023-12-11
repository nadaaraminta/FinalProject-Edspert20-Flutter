import 'package:edspert_20/src/presentation/screen/courses/course_list/course_list_screen.dart';
import 'package:edspert_20/src/presentation/screen/courses/widgets/course_list_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edspert_20/src/values/strings.dart';

import 'package:edspert_20/src/presentation/blocs/auth/auth_bloc.dart';
import 'package:edspert_20/src/presentation/blocs/banner/banner_bloc.dart';
import 'package:edspert_20/src/presentation/blocs/course/course_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void didChangeDependencies() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<CourseBloc>().add(CoursesEvent(majorName: 'IPA'));
      context.read<BannerBloc>().add(BannersEvent());
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
          )
        ],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.read<AuthBloc>().getCurrentSignedInEmail() ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
            const Text(
              'Selamat Datang',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 147,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0XFF3A7FD5),
                ),
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 26,
                ),
                child: Row(
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Mau kerjain\nlatihan soal\napa hari ini?',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Color(0XFFFFFFFF),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Image.asset('assets/images/banner_1.png'),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    Strings.pilihPelajaran,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const CourseListScreen();
                          },
                        ),
                      );
                    },
                    child: const Text(
                      'Lihat Semua',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                        color: Color(0XFF3A7FD5),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              BlocBuilder<CourseBloc, CourseState>(
                builder: (context, state) {
                  if (kDebugMode) {
                    print(state.runtimeType);
                  }
                  
                  if (state is CourseLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Color(0XFF3A7FD5),
                      ),
                    );
                  }

                  if (state is CourseSuccessState) {
                    final courseList = state.data ?? [];

                    return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 3,
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 8,
                      ),
                      itemBuilder: (context, index) {
                        return CourseListWidget(
                          course: courseList[index],
                        );
                      },
                    );
                  }

                  return const Center(
                    child: CircularProgressIndicator(
                      color: Color(0XFF3A7FD5),
                    ),
                  );
                  // return const SizedBox.shrink();
                },
              ),
              const SizedBox(
                height: 27,
              ),
              const Text(
                'Terbaru',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              BlocBuilder<BannerBloc, BannerState>(
                builder: (context, state) {
                  if (kDebugMode) {
                    print(state.runtimeType);
                  }

                  if (state is BannerLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Color(0XFF3A7FD5),
                      ),
                    );
                  }

                  if (state is BannerSuccessState) {
                    final bannerList = state.banners;

                    return SizedBox(
                      height: 146,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: bannerList.length,
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 8,
                        ),
                        itemBuilder: (context, index) {
                          final banner = bannerList[index];

                          return ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: SizedBox(
                              width: 284,
                              height: 186,
                              child: Image.network(
                                banner.eventImage,
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
                          );
                        },
                      ),
                      
                      // BannerBuilder(
                      //   bannerList: state.banners,
                      // ),
                    );
                  }

                  if (state is BannerFailedState) {
                    return Column(
                      children: [
                        Center(
                          child: Text(
                            state.errorMessage,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            context.read<BannerBloc>().add(
                              BannersEvent(),
                            );
                          },
                          icon: const Icon(Icons.refresh),
                        ),
                      ],
                    );
                  }

                  return const Center(
                    child: CircularProgressIndicator(
                      color: Color(0XFF3A7FD5),
                    ),
                  );
                  // return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
