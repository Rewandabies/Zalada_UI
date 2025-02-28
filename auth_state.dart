part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginState extends AuthState {}

final class ForgetPasswordState extends AuthState {}

final class OtpState extends AuthState {}

final class RegisterSuccessState extends AuthState {}
