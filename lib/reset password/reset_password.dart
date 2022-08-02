import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_signup_ui/login%20page/login.dart';
import 'package:login_signup_ui/utils/config.dart';
import 'package:login_signup_ui/utils/mixins.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword>
    with InputValidationMixin {
  bool passwordError = false;
  bool confirmPasswordError = false;
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> resetKey = GlobalKey<FormState>();

  bool newPassVisible = true;
  bool confirmPassVisible = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: CachedNetworkImage(imageUrl: Config.resetPass),
                  ),
                  Positioned(
                    left: 15,
                    top: 10,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Reset \nPassword',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Config.primaryColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Form(
                key: resetKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          !passwordError
                              ? const Padding(
                                  padding: EdgeInsets.only(bottom: 6),
                                  child: Icon(
                                    Icons.key,
                                    color: Colors.grey,
                                    size: 20,
                                  ),
                                )
                              : const Padding(
                                  padding: EdgeInsets.only(bottom: 48),
                                  child: Icon(
                                    Icons.key,
                                    color: Colors.blue,
                                    size: 20,
                                  ),
                                ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 50,
                              child: TextFormField(
                                obscureText: newPassVisible,
                                keyboardType: TextInputType.emailAddress,
                                style: const TextStyle(
                                  fontSize: 13,
                                ),
                                textInputAction: TextInputAction.next,
                                controller: passwordController,
                                // ignore: body_might_complete_normally_nullable
                                validator: (password) {
                                  if (isPasswordValid(password!)) {
                                    setState(() {
                                      passwordError = false;
                                    });
                                    return null;
                                  } else {
                                    setState(() {
                                      passwordError = true;
                                    });
                                    return 'Enter atleast 8 characters';
                                  }
                                },
                                decoration: InputDecoration(
                                  suffixIcon: Padding(
                                    padding: !passwordError
                                        ? const EdgeInsets.only(bottom: 10)
                                        : const EdgeInsets.only(bottom: 22),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          newPassVisible = !newPassVisible;
                                        });
                                      },
                                      child: newPassVisible
                                          ? const Icon(
                                              Icons.visibility,
                                              size: 20,
                                            )
                                          : const Icon(
                                              Icons.visibility_off,
                                              size: 20,
                                            ),
                                    ),
                                  ),
                                  errorStyle: const TextStyle(fontSize: 10),
                                  hintStyle: const TextStyle(
                                    fontSize: 13,
                                  ),
                                  hintText: 'Enter New Password',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          !confirmPasswordError
                              ? const Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Icon(
                                    Icons.key,
                                    size: 20,
                                    color: Colors.grey,
                                  ),
                                )
                              : const Padding(
                                  padding: EdgeInsets.only(bottom: 40),
                                  child: Icon(
                                    Icons.key,
                                    size: 20,
                                    color: Colors.blue,
                                  ),
                                ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 50,
                              child: TextFormField(
                                obscureText: confirmPassVisible,
                                keyboardType: TextInputType.emailAddress,
                                style: const TextStyle(
                                  fontSize: 13,
                                ),
                                textInputAction: TextInputAction.next,
                                controller: confirmPasswordController,
                                // ignore: body_might_complete_normally_nullable
                                validator: (password) {
                                  if (passwordController.text.isNotEmpty &&
                                      passwordController.text ==
                                          confirmPasswordController.text) {
                                    setState(() {
                                      confirmPasswordError = false;
                                    });
                                    return null;
                                  } else {
                                    setState(() {
                                      confirmPasswordError = true;
                                    });
                                    return 'Please Enter Same Password';
                                  }
                                },
                                decoration: InputDecoration(
                                  suffixIcon: Padding(
                                    padding: confirmPasswordError
                                        ? const EdgeInsets.only(bottom: 15)
                                        : const EdgeInsets.only(bottom: 10),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          confirmPassVisible =
                                              !confirmPassVisible;
                                        });
                                      },
                                      child: confirmPassVisible
                                          ? const Icon(
                                              Icons.visibility,
                                              size: 20,
                                            )
                                          : const Icon(
                                              Icons.visibility_off,
                                              size: 20,
                                            ),
                                    ),
                                  ),
                                  contentPadding: confirmPasswordError
                                      ? const EdgeInsets.only(top: 18)
                                      : const EdgeInsets.only(top: 10),
                                  errorStyle: const TextStyle(fontSize: 10),
                                  hintStyle: const TextStyle(
                                    fontSize: 13,
                                  ),
                                  hintText: 'Confirm New Password',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          if (resetKey.currentState!.validate()) {
                            log('val');
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Password Changed Succesfully'),
                                backgroundColor: Colors.green,
                                duration: Duration(milliseconds: 800),
                              ),
                            );
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );
                          }
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          child: const Center(
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
