import 'package:bloc_statemanagement_demo/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              ListTile(
                leading: AppLogo(height: 40, width: 40),
                title: Text(
                  "Hexalitics",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              SizedBox(height: 42),
              const Text(
                "Sign in to your\nAccount",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  height: 1.1,
                ),
              ),
              SizedBox(height: 15),
              const Text(
                "Enter your email and password to log in",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              SizedBox(height: 26),
              const Text(
                "Email",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
              ),

              SizedBox(height: 10),
              const SizedBox(height: 6),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Enter your email",
                  hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
              ),
              SizedBox(height: 15),
              const Text(
                "password",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10),
              const SizedBox(height: 6),

              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.visibility_off),
                  hintText: "Enter your password",
                  hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),

                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot password ?",
                  style: TextStyle(color: Colors.blueAccent),
                ),
              ),

              SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: InkWell(
                  hoverColor: Colors.white,
                  onTap: () {},
                  child: Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      "Log in",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              Row(
                children: [
                  Expanded(child:Divider()),
                Padding(padding: EdgeInsets.symmetric(horizontal: 16,vertical: 3),
                  child: Text("Or",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                ),
                  Expanded(child:Divider()),

                ],
              ),
              SizedBox(height: 25),
              Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: InkWell(
                  hoverColor: Colors.white,
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),

                  TextButton(
                    onPressed: () {
                      // Navigate to Register page
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
