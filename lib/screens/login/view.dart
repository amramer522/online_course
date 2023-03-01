import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_course/core/helper_methods.dart';

import '../../core/input_validator.dart';
import '../../shared_widgets/app_button.dart';
import '../../shared_widgets/app_input.dart';
import '../cars/view.dart';
import '../../featurs/login/cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool secure = true;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController(text: "ali11111e11122@yahoo.com");
  final passwordController = TextEditingController(text: "12341234");

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  AppInput(
                    labelText: "Enter Your Email",
                    controller: emailController,
                    marginTop: 100,
                    validator: InputValidator.emailValidator,
                  ),
                  AppInput(
                    controller: passwordController,
                    isPassword: true,
                    labelText: "Enter Your password",
                    marginBottom: 100,
                    validator: InputValidator.passwordValidator,
                  ),
                  BlocConsumer<LoginCubit, LoginStates>(listener: (context, state) {
                    if (state is LoginSuccessState) {
                      navigateTo(page: const CarsScreen());
                    }
                  }, builder: (context, state) {
                    return AppButton(
                      text: "Login",
                      isLoading: state is LoginLoadingState,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          LoginCubit cubit = BlocProvider.of(context);
                          cubit.login(email: emailController.text, password: passwordController.text);
                        }
                      },
                    );
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
