import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:online_course/core/helper_methods.dart';

import '../../core/input_validator.dart';
import '../../shared_widgets/app_button.dart';
import '../../shared_widgets/app_input.dart';
import '../cars/view.dart';
import '../../featurs/register/cubit.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool secure = true;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController(text: "amrbakr123456@yahoo.com");
  final phoneController = TextEditingController(text: "0100000000000");
  final nameController = TextEditingController(text: "Amr Bakr");
  final passwordController = TextEditingController(text: "123456789");
  String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  StatefulBuilder(builder: (context, state) {
                    return GestureDetector(
                      onTap: () async {
                        final file = await ImagePicker.platform.getImage(source: ImageSource.camera,imageQuality: 70);
                        if (file != null) {
                          // user take image
                          imageUrl = file.path;
                          setState(() {});
                          print(imageUrl);
                        } else {
                          print("user cancle");
                        }
                      },
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: imageUrl != null ? FileImage(File(imageUrl!)) : null,
                      ),
                    );
                  }),
                  SizedBox(
                    height: 30,
                  ),
                  AppInput(
                    controller: phoneController,
                    labelText: "Enter Your Phone",
                    // validator: InputValidator.passwordValidator,
                  ),
                  AppInput(
                    controller: nameController,
                    labelText: "Enter Your Name",
                    // validator: InputValidator.passwordValidator,
                  ),
                  AppInput(
                    labelText: "Enter Your Email",
                    controller: emailController,
                    validator: InputValidator.emailValidator,
                  ),
                  AppInput(
                    controller: passwordController,
                    isPassword: true,
                    labelText: "Enter Your password",
                    marginBottom: 100,
                    validator: InputValidator.passwordValidator,
                  ),
                  BlocConsumer<RegisterCubit, RegisterStates>(listener: (context, state) {
                    if (state is RegisterSuccessState) {
                      navigateTo(page: const CarsScreen());
                    }
                  }, builder: (context, state) {
                    return AppButton(
                      text: "Register",
                      isLoading: state is RegisterLoadingState,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          RegisterCubit cubit = BlocProvider.of(context);
                          if (imageUrl == null) {
                            showToast("Select Image First", type: MessageType.warning);
                          } else {
                            cubit.register(
                                email: emailController.text,
                                password: passwordController.text,
                                phone: phoneController.text,
                                name: nameController.text,
                                imageUrl: imageUrl!);
                          }
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
