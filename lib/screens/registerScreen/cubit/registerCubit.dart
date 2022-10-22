import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore/screens/registerScreen/cubit/registerStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/registerModel/registerModel.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(InitRegisterState());

  static RegisterCubit get(context) => BlocProvider.of(context);
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  GlobalKey<FormState> form = GlobalKey<FormState>();
  final user1 = FirebaseAuth.instance.currentUser?.uid;
  bool isSecure = true;
  void changeSecure() {
    isSecure = !isSecure;
    emit(ChangeSecureRegisterState());
  }

  void userRegister({
    required String email,
//required String password,
    required String phone,
    required String name,
  }) async {
    try {
      if (form.currentState!.validate()) {
        emit(RegisterLoadingState());
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text)
            .then((value) {
          UserModel userModel = UserModel(
            email: email,
            name: name,
            uId: value.user!.uid,
            phone: phone,
          );

          FirebaseFirestore.instance
              .collection('users')
              .doc(value.user!.uid)
              .set(userModel.toMap())
              .then(
                (value) => emit(UserCreateSuccessState()),
              );
        });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(UserCreateErrorState(e.toString()));
        print('weak password ');
      } else if (e.code == 'email-already-in-use') {
        emit(UserCreateErrorState(e.toString()));
        print('email already in use  ');
      }
    } catch (e) {
      emit(UserCreateErrorState(e.toString()));
    }
  }
}
