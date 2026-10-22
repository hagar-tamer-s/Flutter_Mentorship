import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velora_app/core/utils/validators.dart';
import 'package:velora_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:velora_app/features/auth/presentation/cubit/auth_state.dart';
import 'package:velora_app/features/auth/presentation/screens/log_in_screen.dart';
import 'package:velora_app/features/auth/presentation/screens/verify_email_screen.dart';
import 'package:velora_app/features/auth/presentation/widgets/auth_button.dart';
import 'package:velora_app/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:velora_app/features/auth/presentation/widgets/socials.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> key = GlobalKey();
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    TextEditingController confirmPassController = TextEditingController();
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    return Scaffold(
      backgroundColor: Color(0xffFBF8FC),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'LogInScreen');
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create Account",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                ),

                Text(
                  "Join Velora for curated premium accessories",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0XFF514440),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Form(
                    key: key,
                    child: Column(
                      spacing: 13,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          spacing: 15,
                          children: [
                            Expanded(
                              child: AuthTextField(
                                validator: (p0) {
                                  return Validator.validateUserName(
                                    firstNameController.text,
                                  );
                                },
                                label: "First Name",
                                txt: "sophia",
                                controller: firstNameController,
                              ),
                            ),
                            Expanded(
                              child: AuthTextField(
                                validator: (p0) {
                                  return Validator.validateUserName(
                                    lastNameController.text,
                                  );
                                },

                                label: "Last Name",
                                txt: "laurent",
                                controller: lastNameController,
                              ),
                            ),
                          ],
                        ),
                        AuthTextField(
                          validator: (p0) {
                            return Validator.validateEmail(
                              emailController.text,
                            );
                          },
                          label: "Email Address",
                          txt: "sophia.laurent@velora.luxury",
                          controller: emailController,
                          pre: Icon(
                            Icons.email_outlined,
                            color: Color(0xff867D7A),
                          ),
                        ),

                        AuthTextField(
                          validator: (p0) {
                            return Validator.validatePassword(
                              passController.text,
                            );
                          },
                          label: "Password",
                          txt: "Min. 8 characters",
                          pre: Icon(
                            Icons.lock_outline,
                            color: Color(0xff867D7A),
                          ),
                          icon: Icon(
                            Icons.visibility_outlined,
                            color: Color(0xff867D7A),
                          ),
                          controller: passController,
                        ),
                        AuthTextField(
                          validator: (p0) {
                            return Validator.validatePassword(
                              confirmPassController.text,
                            );
                          },
                          label: "Confirm Password",
                          txt: "Re-enter your password",
                          pre: Icon(
                            Icons.lock_reset_outlined,
                            color: Color(0xff867D7A),
                          ),
                          icon: Icon(
                            Icons.visibility_outlined,
                            color: Color(0xff867D7A),
                          ),
                          controller: confirmPassController,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: BlocConsumer<AuthCubit, AuthStates>(
                            listener: (context, state) {
                              if (state is AuthFailureState) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Invalid Credintials"),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              } else if (state is AuthSuccessState) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BlocProvider(
                                      create: (context) => AuthCubit(),
                                      child: VerifyEmailScreen(
                                        email: emailController.text,
                                      ),
                                    ),
                                  ),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("You signed up successfully"),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                              }
                            },
                            builder: (context, state) {
                              if (state is AuthLoadingState) {
                                return Center(
                                  child: CircularProgressIndicator(
                                    color: Color(0xffE0A899),
                                  ),
                                );
                              } else {
                                return AuthButton(
                                  onPressed: () {
                                    if (key.currentState!.validate()) {
                                      context.read<AuthCubit>().signUp(
                                        emailController.text,
                                        passController.text,
                                        firstNameController.text,
                                        lastNameController.text,
                                      );
                                    }
                                  },
                                  txt: "Sign Up",
                                );
                              }
                            },
                          ),
                        ),
                        Socials(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account?",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff6B605D),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LogInScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
