import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_signup_ui/reset%20password/presentation/widgets/otp_page.dart';
import 'package:login_signup_ui/utils/config.dart';
import 'package:login_signup_ui/utils/mixins.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword>
    with InputValidationMixin {
  final GlobalKey<FormState> resetKey = GlobalKey<FormState>();
  bool errorEmail = false;
  final emailController = TextEditingController();
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
                    child: CachedNetworkImage(imageUrl: Config.forgotPass),
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
                  'Forgot \nPassword?',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Config.primaryColor,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 10,
                ),
                child: Text(
                    'Don\'t worry! I happens. Please enter the address associated with your account. '),
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
                          !errorEmail
                              ? const Icon(
                                  Icons.alternate_email_outlined,
                                  color: Colors.grey,
                                  size: 20,
                                )
                              : const Padding(
                                  padding: EdgeInsets.only(bottom: 50),
                                  child: Icon(
                                    Icons.alternate_email_outlined,
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
                                keyboardType: TextInputType.emailAddress,
                                style: const TextStyle(
                                  fontSize: 13,
                                ),
                                textInputAction: TextInputAction.next,
                                controller: emailController,
                                // ignore: body_might_complete_normally_nullable
                                validator: (email) {
                                  if (isEmailValid(email!)) {
                                    setState(() {
                                      errorEmail = false;
                                    });
                                    return null;
                                  } else {
                                    setState(() {
                                      errorEmail = true;
                                    });
                                    return 'Enter valid Email';
                                  }
                                },
                                decoration: InputDecoration(
                                  contentPadding: errorEmail
                                      ? const EdgeInsets.only(bottom: 18)
                                      : const EdgeInsets.all(0.0),
                                  // suffixIcon: SizedBox(),
                                  errorStyle: const TextStyle(fontSize: 10),
                                  hintStyle: const TextStyle(
                                    fontSize: 13,
                                  ),
                                  hintText: 'Email ID',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      InkWell(
                        onTap: () {
                          if (resetKey.currentState!.validate()) {
                            log('val');
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) =>
                                    OTPPage(yourEmail: emailController.text),
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
