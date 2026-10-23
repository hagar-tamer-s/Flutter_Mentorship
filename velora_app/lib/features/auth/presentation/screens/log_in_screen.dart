import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velora_app/core/utils/validators.dart';
import 'package:velora_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:velora_app/features/auth/presentation/cubit/auth_state.dart';
import 'package:velora_app/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:velora_app/features/auth/presentation/widgets/auth_button.dart';
import 'package:velora_app/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:velora_app/features/auth/presentation/widgets/remember_pass.dart';
import 'package:velora_app/features/auth/presentation/widgets/socials.dart';
import 'package:velora_app/features/products/presentation/cubit/product_cubit.dart';
import 'package:velora_app/main_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> key = GlobalKey();
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    return Scaffold(
      backgroundColor: Color(0xffFBF8FC),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: Center(
              child: Column(
                spacing: 10,
                children: [
                  Image.asset(
                    "assets/images/Intertwined Geometric Halo Emblem.png",
                  ),
                  Text(
                    "Velora",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                  ),

                  Text(
                    "Sign in to your luxury accessories account",
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
                            txt: "••••••••",
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
                          RememberPass(),
                          SizedBox(
                            width: double.infinity,
                            child: BlocConsumer<AuthCubit, AuthStates>(
                              listener: (context, state) {
                                if (state is AuthFailureState) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        "Invalid email or password",
                                      ),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                } else if (state is AuthSuccessState) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BlocProvider(
                                        create: (context) => ProductCubit(),
                                        child: MainScreen(),
                                      ),
                                    ),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Welcome Back"),
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
                                        context.read<AuthCubit>().login(
                                          emailController.text,
                                          passController.text,
                                        );
                                      }
                                    },
                                    txt: "Sign In",
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
                                "Don't have an account?",
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
                                      builder: (context) => BlocProvider(
                                        create: (context) => AuthCubit(),
                                        child: SignUpScreen(),
                                      ),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Create Account",
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
      ),
    );
  }
}
