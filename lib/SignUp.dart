import 'package:dog_shop/Home.dart';
import 'package:dog_shop/Services/autherentication.dart';
import 'package:dog_shop/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:dog_shop/constants.dart';

void main() {
  runApp(MaterialApp(
    title: 'Sign Up Page',
    home: SignUpPage(),
  ));
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //for controller
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isShowPassword = false;
  bool isLoading = false;

  void signUpUser() async {
    String res = await AuthServices().signUpUser(
      username: usernameController.text,
      email: emailController.text,
      password: passwordController.text,
      confirmPassword: confirmPasswordController.text,
    );
    //if signup is success, user has been created and navigate to the next screen
    //otherwise show the error message
    if (res == "Success") {
      isLoading = true;
      setState(() {});
      //navigate to the next screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      setState(() {
        isLoading = false;
      });
      //show the error
      showSnackBar(context, res);
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: kBgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: Image.asset('assets/images/Logo1.png'),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        hintText: 'Username',
                        prefixIcon: const Icon(
                          Icons.person,
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
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
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
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: !isShowPassword,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: const Icon(
                          Icons.lock,
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
                      controller: confirmPasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: !isShowPassword,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value != passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        prefixIcon: const Icon(
                          Icons.lock,
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
                    SizedBox(
                      width: double.infinity,
                      child: Divider(
                        color: kPrimaryColor,
                        thickness: 2,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          signUpUser();
                          Navigator.pushReplacementNamed(context, '/home');
                        }
                      },
                      child: const Text(
                        'Sign Up',
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
