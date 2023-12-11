import 'package:dio/dio.dart';
import 'package:edspert_20/src/data/datasource/remote/exercise_remote_datasource.dart';
import 'package:edspert_20/src/data/repository/exercise_repository_impl.dart';
import 'package:edspert_20/src/domain/repository/exercise_repository.dart';
import 'package:edspert_20/src/presentation/blocs/bloc/exercise_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edspert_20/firebase_options.dart';
import 'package:edspert_20/src/data/datasource/remote/authentication_remote_datasource.dart';
import 'package:edspert_20/src/data/datasource/remote/profile_remote_datasource.dart';
import 'package:edspert_20/src/data/repository/authentication_repository_impl.dart';
import 'package:edspert_20/src/data/repository/profile_repository_impl.dart';
import 'package:edspert_20/src/domain/usecase/auth_usecases/usecases.dart';
import 'package:edspert_20/src/domain/usecase/profile/get_profile_usecase.dart';
import 'package:edspert_20/src/domain/usecase/profile/update_profile_usecase.dart';
import 'package:edspert_20/src/presentation/blocs/profile/profile_bloc.dart';
import 'package:edspert_20/src/presentation/screen/profile/edit_profile_screen.dart';

import 'src/data/datasource/remote/banner_remote_datasource.dart';
import 'src/data/datasource/remote/course_remote_datasource.dart';
import 'src/data/repository/banner_repository_impl.dart';
import 'src/data/repository/course_repository_impl.dart';
import 'src/domain/repository/course_repository.dart';
import 'src/domain/usecase/courses/get_courses_usecase.dart';
import 'src/domain/usecase/courses/get_exercises_by_course_usecase.dart';
import 'src/domain/usecase/banner/get_banners_usecase.dart';
import 'src/presentation/blocs/auth/auth_bloc.dart';
import 'src/presentation/blocs/banner/banner_bloc.dart';
import 'src/presentation/blocs/course/course_bloc.dart';
import 'src/presentation/blocs/home_nav/home_nav_cubit.dart';
import 'package:edspert_20/src/presentation/router/routes.dart';
import 'package:edspert_20/src/presentation/screen/auth/login_screen.dart';
import 'package:edspert_20/src/presentation/screen/auth/registration_form_screen.dart';
import 'package:edspert_20/src/presentation/screen/auth/splash_screen.dart';
import 'package:edspert_20/src/presentation/screen/courses/course_list/course_list_screen.dart';
import 'package:edspert_20/src/presentation/screen/courses/exercise_list/exercise_list_screen.dart';
import 'package:edspert_20/src/presentation/screen/home/home_navigation_screen.dart';
import 'src/values/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize Firebase
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            CourseRepository repo = CourseRepositoryImpl(
              remoteDatasource: CourseRemoteDatasource(client: Dio()),
            );
            return CourseBloc(
              GetCoursesUsecase(repository: repo),
              // GetExercisesByCourseUsecase(repository: repo),
            );
          },
        ),
        BlocProvider(
          create: (context) {
            ExerciseRepository repo = ExerciseRepositoryImpl(
              remoteDatasource: ExerciseRemoteDatasource(client: Dio()),
            );
            return ExerciseBloc(
              GetExercisesByCourseUsecase(repository: repo)
            );
          },
        ),
        BlocProvider(
          create: (context) => HomeNavCubit(),
        ),
        BlocProvider(
          create: (context) => AuthBloc(
              SignInWithGoogleUsecase(
                repository: AuthRepositoryImpl(
                  remoteDatasource: AuthRemoteDatasource(client: Dio()),
                ),
              ),
              IsUserRegisteredUsecase(
                repository: AuthRepositoryImpl(
                  remoteDatasource: AuthRemoteDatasource(client: Dio()),
                ),
              ),
              IsSignedInWithGoogleUsecase(
                repository: AuthRepositoryImpl(
                  remoteDatasource: AuthRemoteDatasource(client: Dio()),
                ),
              ),
              GetCurrentSignedInEmailUsecase(
                repository: AuthRepositoryImpl(
                  remoteDatasource: AuthRemoteDatasource(client: Dio()),
                ),
              )),
        ),
        BlocProvider(
          create: (context) => ProfileBloc(
            GetProfileUsecase(
              repository: ProfileRepositoryImpl(
                authRemoteDatasource: AuthRemoteDatasource(client: Dio()),
                profileRemoteDatasource: ProfileRemoteDatasource(client: Dio()),
              ),
            ),
            UpdateProfileUsecase(
              repository: ProfileRepositoryImpl(
                authRemoteDatasource: AuthRemoteDatasource(client: Dio()),
                profileRemoteDatasource: ProfileRemoteDatasource(client: Dio()),
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => BannerBloc(
            getBannersUsecase: GetBannersUsecase(
              repository: BannerRepositoryImpl(
                remoteDatasource: BannerRemoteDatasource(
                  client: Dio(),
                ),
              ),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Edspert 20',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple).copyWith(),
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.bluePrimary,
          ),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          Routes.splashScreen: (context) => const SplashScreen(),
          Routes.loginScreen: (context) => const LoginScreen(),
          Routes.registrationFormScreen: (context) => const RegistrationFormScreen(),
          Routes.homeScreen: (context) => HomeNavigationScreen(),
          Routes.courseListScreen: (context) => const CourseListScreen(),
          Routes.exerciseListScreen: (context) => const ExerciseListScreen(),
          Routes.editProfile: (context) => const EditProfileScreen(),
        },
      ),
    );
  }
}
