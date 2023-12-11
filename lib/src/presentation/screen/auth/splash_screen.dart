import 'package:edspert_20/src/presentation/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edspert_20/src/presentation/blocs/auth/auth_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(
        seconds: 3,
      ),
    ).then((value) {
      context.read<AuthBloc>().add(CheckIsSignedInWithGoogleEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (prev, current) {
        bool isResultOfCheckUserSignedInWithGoogle = (
          prev is CheckIsUserSignedInWithGoogleState &&
          prev.isLoading == true
        ) && (
          current is CheckIsUserSignedInWithGoogleState &&
          current.isLoading == false
        );
        bool isResultOfCheckUserRegistered = (
          prev is CheckIsUserRegisteredState &&
          prev.isLoading == true
        ) && (
          current is CheckIsUserRegisteredState &&
          current.isLoading == false
        );

        return isResultOfCheckUserSignedInWithGoogle || isResultOfCheckUserRegistered;
      },
      listener: (context, state) {
        if (state is CheckIsUserSignedInWithGoogleState) {
          if (!state.isLoading && state.isSignedIn) {
            context.read<AuthBloc>().add(CheckIsUserRegisteredEvent());
          } else {
            Navigator.pushReplacementNamed(context, Routes.loginScreen);
          }
        }

        if (state is CheckIsUserRegisteredState) {
          bool isRegistered = state.isRegistered;

          if (isRegistered) {
            Navigator.pushReplacementNamed(context, Routes.homeScreen);
          } else {
            Navigator.pushReplacementNamed(context, Routes.registrationFormScreen);
          }
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0XFF3A7FD5),
        body: Center(
          child: Image.asset('assets/images/logo.png'),
        ),
      ),
    );
  }
}
