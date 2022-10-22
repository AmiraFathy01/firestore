import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'loginStates.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(InitLoginStates());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isSecure = true;
  void changeSecure() {
    isSecure = !isSecure;
    emit(changeSecureStates());
  }
}
