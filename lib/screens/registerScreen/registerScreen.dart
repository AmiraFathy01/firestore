import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/components.dart';
import '../loginScreen/loginScreen.dart';
import 'cubit/registerCubit.dart';
import 'cubit/registerStates.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) => {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Register '),
            ),
            body: Form(
              key: RegisterCubit.get(context).form,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text('Register'),
                    SizedBox(
                      height: 15,
                    ),
                    Text('Register mow to chat with your team '),
                    SizedBox(
                      height: 40,
                    ),
                    defualtTextForm(
                        type: TextInputType.name,
                        controller: RegisterCubit.get(context).nameController,
                        lable: 'name ',
                        prefixIcon: Icons.person,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return ' you must enter your name';
                          }
                          return null;
                        }),
                    SizedBox(
                      height: 40,
                    ),
                    defualtTextForm(
                        type: TextInputType.phone,
                        controller: RegisterCubit.get(context).phoneController,
                        lable: 'phone',
                        prefixIcon: Icons.phone,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return ' you must enter your phone';
                          }
                          return null;
                        }),
                    SizedBox(
                      height: 40,
                    ),
                    defualtTextForm(
                        type: TextInputType.emailAddress,
                        controller: RegisterCubit.get(context).emailController,
                        lable: 'Email Address',
                        prefixIcon: Icons.email_outlined,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return ' you must enter your email address';
                          }
                          return null;
                        }),
                    SizedBox(
                      height: 40,
                    ),
                    defualtTextForm(
                      obScure: RegisterCubit.get(context).isSecure,
                      type: TextInputType.visiblePassword,
                      controller: RegisterCubit.get(context).passwordController,
                      lable: 'Password',
                      prefixIcon: Icons.lock_outline,
                      suffixIcon: RegisterCubit.get(context).isSecure
                          ? Icons.remove_red_eye_outlined
                          : Icons.visibility_off,
                      SuffixOnPressed: () {
                        RegisterCubit.get(context).changeSecure();
                      },
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'you must enter your password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Spacer(),
                        ConditionalBuilder(
                          condition: state is! RegisterLoadingState,
                          builder: (context) => defualtMaterialButton(
                              Radius: 15,
                              text: "Register",
                              Pressed: () {
                                RegisterCubit.get(context).userRegister(
                                  name: RegisterCubit.get(context)
                                      .nameController
                                      .text,
                                  email: RegisterCubit.get(context)
                                      .emailController
                                      .text,
                                  phone: RegisterCubit.get(context)
                                      .phoneController
                                      .text,
                                );
                              }),
                          fallback: (context) => CircularProgressIndicator(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(" Have Account Already"),
                        SizedBox(
                          width: 15,
                        ),
                        TextButton(
                            onPressed: () {
                              navigatorTo(context, LoginScreen());
                            },
                            child: Text("Login  NOW")),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
