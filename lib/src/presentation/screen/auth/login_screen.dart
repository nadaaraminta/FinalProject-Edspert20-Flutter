import 'package:edspert_20/src/presentation/blocs/auth/auth_bloc.dart';
import 'package:edspert_20/src/presentation/router/routes.dart';
import 'package:edspert_20/src/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 32),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Image.asset('assets/images/login_image.png'),
                    const SizedBox(
                      height: 56,
                    ),
                    const Text(
                      'Selamat Datang',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                      ),
                    ),
                    const Text(
                      'Selamat Datang di Aplikasi Widya Edu\nAplikasi Latihan dan Konsultasi Soal',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Color(0XFF6A7483),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    BlocListener<AuthBloc, AuthState>(
                      listenWhen: (prev, current) => 
                      (prev is SignInWithGoogleState && prev.isLoading == true) &&
                      (current is SignInWithGoogleState && current.isLoading == false) ||
                      (prev is CheckIsUserRegisteredState && prev.isLoading == true) &&
                      (current is CheckIsUserRegisteredState && current.isLoading == false),
                      listener: (context, state) {
                        if (state is SignInWithGoogleState) {
                          if (!state.isLoading && state.result != null) {
                            context.read<AuthBloc>().add(CheckIsUserRegisteredEvent());
                          } else {
                            print('Login cancelled!');
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
                      child: Column(
                        children: [
                          CustomButton(
                            buttonTitle: 'Masuk dengan Google',
                            iconPath: 'assets/images/google_logo.png',
                            buttonColor: const Color(0xFFFFFFFF),
                            textColor: const Color(0XFF000000),
                            borderColor: const Color(0XFF01B1AF),
                            onTap: () {
                              context.read<AuthBloc>().add(SignInWithGoogleEvent());
                            },
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomButton(
                            buttonTitle: 'Masuk dengan Apple ID',
                            iconPath: 'assets/images/apple_logo.png',
                            buttonColor: const Color(0xFF1A1F26),
                            textColor: const Color(0XFFFFFFFF),
                            borderColor: const Color(0xFF1A1F26),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
