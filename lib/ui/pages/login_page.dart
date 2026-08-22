import 'package:bloc_statemanagement_demo/cubit/Login/login_bloc.dart';
import 'package:bloc_statemanagement_demo/overlay_/overlay_widget.dart';
import 'package:bloc_statemanagement_demo/ui/App_style_text.dart';
import 'package:bloc_statemanagement_demo/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isPasswordVisible = false;

  final TextEditingController emailController =
  TextEditingController();


  final TextEditingController passwordController =
  TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController.text = "emilys";
    passwordController.text = "emilyspass";
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context,state){
            if (state is LoginSuccess) {
              toastification.show(
                context: context,
                type: ToastificationType.success,
                style: ToastificationStyle.flat,
                title: const Text("Success"),
                description:  Text(
                    state.loginModel.displayFullName()
                ),
                autoCloseDuration: const Duration(
                  seconds: 3,
                ),
              );
            }
           if(state is LoginError){
             toastification.show(
               context: context,
               type: ToastificationType.error,
               style: ToastificationStyle.flatColored,
               title: const Text("Login Failed"),
               description: const Text(
                 "Invalid email or password",
               ),
               autoCloseDuration: const Duration(
                 seconds: 3,
               ),
             );
           }

          }
          ,
          builder: (context, state) {
            return Stack(
              children: [

                // =====================================
                // LOGIN UI
                // =====================================

                SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 20,
                    ),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [

                        // Logo + Company Name
                        Row(
                          children: [
                            const AppLogo(
                              height: 40,
                              width: 40,
                            ),

                            const SizedBox(width: 10),

                            AppText.bold(
                              "Hexalitics",
                              fontSize: 21,
                              color: const Color(0xFF1D61E7),
                            ),
                          ],
                        ),

                        const SizedBox(height: 42),

                        // Title
                        AppText.bold(
                          "Sign in to your\nAccount",
                          fontSize: 32,
                          color: Colors.black87,
                        ),

                        const SizedBox(height: 15),

                        // Description
                        AppText.medium(
                          "Enter your email and password to log in",
                          fontSize: 12,
                          color: Colors.grey,
                        ),

                        const SizedBox(height: 26),

                        // Email Label
                        AppText.medium(
                          "Email",
                          fontSize: 13,
                          color: Colors.black87,
                        ),

                        const SizedBox(height: 5),

                        // Email Field
                        TextField(
                          controller: emailController,
                          keyboardType:
                          TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "Enter your email",
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w500,
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color(0xFF1D61E7),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 15),

                        // Password Label
                        AppText.medium(
                          "Password",
                          fontSize: 13,
                          color: Colors.black87,
                        ),

                        const SizedBox(height: 4),

                        // Password Field
                        TextField(
                          controller: passwordController,
                          obscureText: !isPasswordVisible,
                          decoration: InputDecoration(
                            hintText: "Enter your password",
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w500,
                            ),

                            // Visibility Button
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isPasswordVisible =
                                  !isPasswordVisible;
                                });
                              },
                              icon: Icon(
                                isPasswordVisible
                                    ? Icons.visibility
                                    : Icons
                                    .visibility_off_outlined,
                                color: Colors.grey,
                              ),
                            ),

                            border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),

                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color(0xFF1D61E7),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        // Forgot Password
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              // Forgot password action
                            },
                            child: AppText.semiBold(
                              "Forgot password?",
                              fontSize: 12,
                              color:
                              const Color(0xFF1D61E7),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Login Button
                        SizedBox(
                          width: double.infinity,
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () {
                              context
                                  .read<LoginBloc>()
                                  .add(
                                LoginClickEvent(
                                  username:
                                  emailController.text,
                                  password:
                                  passwordController.text,
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                              const Color(0xFF1D61E7),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(7),
                              ),
                              elevation: 0,
                            ),
                            child: AppText.medium(
                              "Log in",
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),

                        const SizedBox(height: 25),

                        // OR
                        Row(
                          children: [
                            const Expanded(
                              child: Divider(),
                            ),

                            const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 3,
                              ),
                              child: Text(
                                "Or",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "Inter",
                                  fontWeight:
                                  FontWeight.w400,
                                ),
                              ),
                            ),

                            const Expanded(
                              child: Divider(),
                            ),
                          ],
                        ),

                        const SizedBox(height: 25),

                        // Google Button
                        SizedBox(
                          width: double.infinity,
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              elevation: 0,
                              side: const BorderSide(
                                color: Colors.grey,
                              ),
                              shape:
                              RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(7),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/google.png',
                                  width: 20,
                                  height: 20,
                                ),

                                const SizedBox(width: 10),

                                const Text(
                                  "Continue with Google",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontFamily: "Inter",
                                    fontWeight:
                                    FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 90),

                        // Sign Up
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: [
                            AppText.medium(
                              "Don't have an account?",
                              fontSize: 12,
                              color: Colors.grey,
                            ),

                            const SizedBox(width: 5),

                            InkWell(
                              onTap: () {
                                // Sign up
                              },
                              child: AppText.medium(
                                "Sign up",
                                fontSize: 12,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),

                // =====================================
                // LOADING OVERLAY
                // =====================================

                if (state is LoginLoading)
                  const LoadingWidget(),
              ],
            );
          },
        ),
      ),
    );
  }
}