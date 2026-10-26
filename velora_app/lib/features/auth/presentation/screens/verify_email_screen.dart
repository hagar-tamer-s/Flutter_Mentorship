import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:velora_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:velora_app/features/auth/presentation/cubit/auth_state.dart';
import 'package:velora_app/features/auth/presentation/screens/log_in_screen.dart';
import 'package:velora_app/features/auth/presentation/widgets/auth_button.dart';

import 'dart:async';

import 'package:velora_app/main_screen.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key, required this.email});
  final String email;

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  TextEditingController pinController = TextEditingController();
  Timer? _timer;
  int _start = 60;
  bool _isResendEnabled = false;
  @override
  void initState() {
    super.initState();
    startTimer(); // نشغل العداد أول ما الشاشة تفتح
  }

  void startTimer() {
    setState(() {
      _start = 60;
      _isResendEnabled = false;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          timer.cancel();
          _isResendEnabled = true; // نفعل زرار الإعادة لما الوقت يخلص
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    pinController.dispose();
    super.dispose();
  }

  String otp = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFBF8FC),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                spacing: 25,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xffE9F2FD),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 5,
                      children: [
                        Icon(
                          Icons.lock_outline,
                          size: 15,
                          color: Color(0xff56768D),
                        ),
                        Text(
                          "VELORA CURATED VAULT",
                          style: TextStyle(
                            color: Color(0xff56768D),
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Image.asset("assets/images/Primary Rounded Hub.png"),
                  Text(
                    "Verify Email",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "We have sent a 6-digit verification code to",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff625652),
                    ),
                  ),
                  Text(
                    widget.email,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  Pinput(
                    controller: pinController,
                    length: 6,
                    defaultPinTheme: PinTheme(
                      width: 50,
                      height: 50,
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xffE0A899)),
                      ),
                    ),

                    focusedPinTheme: PinTheme(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xff8b4d3f),
                          width: 2,
                        ),
                      ),
                    ),
                    onCompleted: (pin) {
                      otp = pin;
                      log(otp);
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Didn't receive code? ",
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xff625652),
                        ),
                      ),
                      _isResendEnabled
                          ? BlocConsumer<AuthCubit, AuthStates>(
                              listener: (context, state) {
                                if (state is ResendOtpFailureState) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(state.errorMessage),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                } else if (state is ResendOtpSuccessState) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LogInScreen(),
                                    ),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("OTP is sent successfully"),
                                      backgroundColor: Colors.green,
                                    ),
                                  );
                                }
                              },
                              builder: (context, state) {
                                if (state is ResendOtpLoadingState) {
                                  return Center(
                                    child: CircularProgressIndicator(
                                      color: Color(0xffE0A899),
                                    ),
                                  );
                                } else {
                                  return TextButton(
                                    onPressed: () {
                                      context.read<AuthCubit>().resendOtp(
                                        widget.email,
                                      );
                                      startTimer();
                                    },
                                    child: const Text(
                                      "Resend",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff8b4d3f),
                                      ),
                                    ),
                                  );
                                }
                              },
                            )
                          : Text(
                              "Resend in 0:${_start < 10 ? '0$_start' : _start}",
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                            ),
                    ],
                  ),
                  BlocConsumer<AuthCubit, AuthStates>(
                    builder: (context, state) {
                      if (state is AuthLoadingState) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: Color(0xffE0A899),
                          ),
                        );
                      } else {
                        return SizedBox(
                          width: double.infinity,
                          child: AuthButton(
                            txt: "Verify & Proceed",
                            onPressed: () {
                              context.read<AuthCubit>().verifyEmail(
                                widget.email,
                                otp,
                              );
                            },
                          ),
                        );
                      }
                    },
                    listener: (context, state) {
                      if (state is AuthFailureState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Invalid OTP"),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else if (state is AuthSuccessState) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => MainScreen()),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Your email is verified"),
                            backgroundColor: Colors.green,
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
