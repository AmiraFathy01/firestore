abstract class RegisterStates {}

class InitRegisterState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {}

class RegisterErrorState extends RegisterStates {
  final String error;
  RegisterErrorState(this.error);
}

class ChangeSecureRegisterState extends RegisterStates {}

////////////////////////////user create

class UserCreateLoadingState extends RegisterStates {}

class UserCreateSuccessState extends RegisterStates {}

class UserCreateErrorState extends RegisterStates {
  final String error;
  UserCreateErrorState(this.error);
}
