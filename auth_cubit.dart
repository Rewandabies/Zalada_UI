import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(LoginState());
  void showForgetPassword() => emit(ForgetPasswordState());

  void showOtp() => emit(OtpState());
  void showRegisterSuccess() => emit(RegisterSuccessState());
  void showLogin() => emit(LoginState());


}
