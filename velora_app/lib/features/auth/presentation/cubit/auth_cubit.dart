import 'dart:developer';

import 'package:velora_app/features/auth/data/remote_data_source.dart';
import 'package:velora_app/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());
  final RemoteDataSource data = RemoteDataSource();
  Future<void> login(String email, String pass, bool isRemembered) async {
    emit(AuthLoadingState());
    await data
        .logIn(email, pass, isRemembered)
        .then(
          (val) {
            emit(AuthSuccessState(tokens: val));
          },
          onError: (error) {
            log(error.toString());
            emit(AuthFailureState(errMessage: error.toString()));
          },
        );
  }

  Future<void> signUp(
    String email,
    String pass,
    String firstName,
    String lastName,
  ) async {
    emit(AuthLoadingState());
    await data
        .signUp(email, pass, firstName, lastName)
        .then(
          (val) {
            emit(AuthSuccessState());
          },
          onError: (error) {
            log(error.toString());
            emit(AuthFailureState(errMessage: error.toString()));
          },
        );
  }

  Future<void> verifyEmail(String email, String otp) async {
    emit(AuthLoadingState());
    await data
        .verifyEmail(email, otp)
        .then(
          (val) {
            emit(AuthSuccessState());
          },
          onError: (error) {
            log(error.toString());
            emit(AuthFailureState(errMessage: error.toString()));
          },
        );
  }

  Future<void> resendOtp(String email) async {
    emit(ResendOtpLoadingState());
    await data
        .resendOTP(email)
        .then(
          (val) {
            emit(ResendOtpSuccessState(msg: val));
          },
          onError: (error) {
            log(error.toString());
            emit(ResendOtpFailureState(errorMessage: error.toString()));
          },
        );
  }
}
