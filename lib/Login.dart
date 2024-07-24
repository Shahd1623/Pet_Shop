import 'package:flutter/material.dart';
import 'package:dog_shop/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // For controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isShowPassword = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: Image.asset('assets/images/Logo1.png'),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (String? value) {
                        String emailPattern =
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                        RegExp regex = RegExp(emailPattern);
                        if (!regex.hasMatch(value ?? "")) {
                          return "Enter a valid email";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Email',
                        prefixIcon: const Icon(
                          Icons.mail,
                          color: kPrimaryColor,
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.red,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: !isShowPassword,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Password must have a value";
                        }
                        if (value.length < 4) {
                          return "Password must be at least 4 characters";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter your Password',
                        prefixIcon: const Icon(
                          Icons.password_rounded,
                          color: kPrimaryColor,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isShowPassword = !isShowPassword;
                            });
                          },
                          icon: Icon(
                            isShowPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.red,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: Divider(
                        color: kPrimaryColor,
                        thickness: 2,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        print(emailController.text); // For debugging
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(color: kPrimaryColor),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          // Handle successful login here
                          // For example, navigate to home screen
                          Navigator.pushReplacementNamed(context, '/home');
                        }
                      },
                      child: const Text(
                        'Log in',
                        style: TextStyle(color: kBgColor),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: kPrimaryColor,
                        minimumSize: const Size(double.infinity, 50),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/signup');
                          },
                          child: const Text(
                            'Sign Up',
                            style:
                                TextStyle(color: kPrimaryColor, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
