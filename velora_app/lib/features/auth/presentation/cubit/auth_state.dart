import 'package:velora_app/features/auth/data/models/messages_model.dart';
import 'package:velora_app/features/auth/data/models/tokens_model.dart';

abstract class AuthStates {}

class AuthSuccessState extends AuthStates {
  final TokensModel? tokens;
  AuthSuccessState({this.tokens});
}

class AuthFailureState extends AuthStates {
  final String errMessage;

  AuthFailureState({required this.errMessage});
}

class AuthInitialState extends AuthStates {}

class AuthLoadingState extends AuthStates {}

class AuthErrorState extends AuthStates {
  final String errorMessage;

  AuthErrorState({required this.errorMessage});
}

class OtpsendSuccess extends AuthStates {
  final MessagesModel message;
  OtpsendSuccess({required this.message});
}

class ResendOtpLoadingState extends AuthStates {}

class ResendOtpFailureState extends AuthStates {
  final String errorMessage;

  ResendOtpFailureState({required this.errorMessage});
}

class ResendOtpSuccessState extends AuthStates {
  final MessagesModel msg;
  ResendOtpSuccessState({required this.msg});
}
