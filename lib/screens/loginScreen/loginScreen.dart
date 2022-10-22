import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/components.dart';
import '../registerScreen/registerScreen.dart';
import 'cubit/loginCubit.dart';
import 'cubit/loginStates.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) => {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('login '),
            ),
            body: Form(
              key: formkey,
              child: Column(
                children: [
                  Text('Login'),
                  SizedBox(
                    height: 15,
                  ),
                  Text('login mow to chat with your team '),
                  SizedBox(
                    height: 40,
                  ),
                  defualtTextForm(
                      type: TextInputType.emailAddress,
                      controller: emailController,
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
                    obScure: LoginCubit.get(context).isSecure,
                    type: TextInputType.visiblePassword,
                    controller: passwordController,
                    lable: 'Password',
                    prefixIcon: Icons.lock_outline,
                    suffixIcon: LoginCubit.get(context).isSecure
                        ? Icons.remove_red_eye_outlined
                        : Icons.visibility_off,
                    SuffixOnPressed: () {
                      LoginCubit.get(context).changeSecure();
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
                        condition: true, // state is! LoginLoading,
                        builder: (context) => defualtMaterialButton(
                          Radius: 15,
                          text: "LOGIN",
                          Pressed: () {
                            if (formkey.currentState!.validate()) {
                              /* LoginCubit.get(context).userLogin(
                            email: emailController.text,
                            password: passwordController.text); */
                            }
                          },
                        ),
                        fallback: (context) => CircularProgressIndicator(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text("Don't Have Account"),
                      SizedBox(
                        width: 15,
                      ),
                      TextButton(
                          onPressed: () {
                            navigatorTo(context, RegisterScreen());
                          },
                          child: Text("REGISTER NOW")),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
