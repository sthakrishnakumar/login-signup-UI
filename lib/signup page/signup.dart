import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_signup_ui/login%20page/login.dart';
import 'package:login_signup_ui/utils/config.dart';
import 'package:login_signup_ui/utils/mixins.dart';
import 'package:login_signup_ui/widgets/privacy_policy.dart';
import 'package:login_signup_ui/widgets/terms_conditions.dart';

class SignUpPage extends StatefulWidget with InputValidationMixin {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with InputValidationMixin {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final GlobalKey<FormState> signUPKey = GlobalKey<FormState>();

  bool errorEmail = false;
  bool errorName = false;
  bool errorPhone = false;
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
                    height: 280,
                    width: double.infinity,
                    child: CachedNetworkImage(
                      imageUrl: Config.signupPic,
                    ),
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
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Text(
                  "Sign up",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Config.primaryColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Form(
                key: signUPKey,
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
                                  padding: EdgeInsets.only(bottom: 47),
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
                              height: 47,
                              child: TextFormField(
                                style: const TextStyle(
                                  fontSize: 13,
                                ),
                                keyboardType: TextInputType.emailAddress,
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
                      SizedBox(
                        height: errorEmail && !errorName
                            ? 0
                            : !errorEmail && !errorName
                                ? 13
                                : 15,
                      ),
                      Row(
                        children: [
                          !errorName
                              ? const Icon(
                                  Icons.person,
                                  color: Colors.grey,
                                  size: 20,
                                )
                              : const Padding(
                                  padding: EdgeInsets.only(bottom: 47),
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.blue,
                                    size: 20,
                                  ),
                                ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 47,
                              child: TextFormField(
                                style: const TextStyle(
                                  fontSize: 13,
                                ),

                                textInputAction: TextInputAction.next,
                                controller: nameController,
                                textCapitalization: TextCapitalization.words,
                                // ignore: body_might_complete_normally_nullable
                                validator: (name) {
                                  if (isNameValid(name!)) {
                                    setState(() {
                                      errorName = false;
                                    });
                                    return null;
                                  } else {
                                    setState(() {
                                      errorName = true;
                                    });
                                    return 'Enter Valid Name';
                                  }
                                },
                                decoration: InputDecoration(
                                  contentPadding: errorName
                                      ? const EdgeInsets.only(bottom: 18)
                                      : const EdgeInsets.all(0.0),
                                  // suffixIcon: SizedBox(),
                                  errorStyle: const TextStyle(fontSize: 10),
                                  hintStyle: const TextStyle(
                                    fontSize: 13,
                                  ),
                                  hintText: 'Full Name',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: errorPhone && !errorName
                            ? 22
                            : errorName
                                ? 5
                                : 15,
                      ),
                      Row(
                        children: [
                          !errorPhone
                              ? const Icon(
                                  Icons.call,
                                  color: Colors.grey,
                                  size: 20,
                                )
                              : const Padding(
                                  padding: EdgeInsets.only(bottom: 47),
                                  child: Icon(
                                    Icons.call,
                                    color: Colors.blue,
                                    size: 20,
                                  ),
                                ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 47,
                              child: TextFormField(
                                maxLength: 10,

                                style: const TextStyle(
                                  fontSize: 13,
                                ),
                                keyboardType: TextInputType.phone,
                                textInputAction: TextInputAction.next,
                                controller: phoneController,
                                // ignore: body_might_complete_normally_nullable
                                validator: (phone) {
                                  if (isNameValid(phone!)) {
                                    setState(() {
                                      errorPhone = false;
                                    });
                                    return null;
                                  } else {
                                    setState(() {
                                      errorPhone = true;
                                    });
                                    return 'Enter Valid Phone';
                                  }
                                },
                                decoration: InputDecoration(
                                  counterText: '',
                                  contentPadding: errorPhone
                                      ? const EdgeInsets.only(bottom: 18)
                                      : const EdgeInsets.all(0.0),
                                  // suffixIcon: SizedBox(),
                                  errorStyle: const TextStyle(fontSize: 10),
                                  hintStyle: const TextStyle(
                                    fontSize: 13,
                                  ),
                                  hintText: 'Mobile',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'By Signing up, you\'re agree to our ',
                                style: TextStyle(
                                  letterSpacing: 0.1,
                                  color: Colors.grey,
                                  fontSize: 11,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) =>
                                          const TermsandConditions(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Terms & Conditions',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.1,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                ' and ',
                                style: TextStyle(
                                  letterSpacing: 0.1,
                                  color: Colors.grey,
                                  fontSize: 11,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) =>
                                          const PrivacyPolicy(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Privacy Policy',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.1,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          if (signUPKey.currentState!.validate()) {
                            log('val');
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => const Login(),
                              ),
                            );
                          }
                        },
                        child: Container(
                          height: 47,
                          width: double.infinity,
                          child: const Center(
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(13),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Joined Us Before?',
                    style: TextStyle(color: Colors.grey),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const SignUpPage(),
                        ),
                      );
                    },
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const Login(),
                          ),
                        );
                      },
                      child: const Text(
                        '  Login',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
