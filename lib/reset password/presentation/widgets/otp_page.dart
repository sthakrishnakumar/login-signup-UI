import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_signup_ui/reset%20password/presentation/widgets/reset_password.dart';
import 'package:login_signup_ui/utils/config.dart';
import 'package:login_signup_ui/utils/mixins.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({Key? key, required this.yourEmail}) : super(key: key);
  final String yourEmail;
  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> with InputValidationMixin {
  final GlobalKey<FormState> otpKey = GlobalKey<FormState>();
  bool otpError = false;
  final otpController = TextEditingController();
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
                    child: CachedNetworkImage(imageUrl: Config.otp),
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
                  'Enter OTP',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Config.primaryColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 10,
                ),
                child:
                    Text('An 6 digit OTP has been sent to ${widget.yourEmail}'),
              ),
              const SizedBox(
                height: 50,
              ),
              Form(
                key: otpKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          !otpError
                              ? const Icon(
                                  Icons.phone_android_outlined,
                                  color: Colors.grey,
                                  size: 20,
                                )
                              : const Padding(
                                  padding: EdgeInsets.only(bottom: 50),
                                  child: Icon(
                                    Icons.phone_android_outlined,
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
                                maxLength: 6,
                                keyboardType: TextInputType.phone,
                                style: const TextStyle(
                                  fontSize: 13,
                                ),
                                textInputAction: TextInputAction.next,
                                controller: otpController,
                                // ignore: body_might_complete_normally_nullable
                                validator: (otp) {
                                  if (isOTPValid(otp!)) {
                                    setState(() {
                                      otpError = false;
                                    });
                                    return null;
                                  } else {
                                    setState(() {
                                      otpError = true;
                                    });
                                    return 'Enter 6 digit OTP';
                                  }
                                },
                                decoration: InputDecoration(
                                  counterText: '',
                                  contentPadding: otpError
                                      ? const EdgeInsets.only(bottom: 18)
                                      : const EdgeInsets.all(0.0),
                                  // suffixIcon: SizedBox(),
                                  errorStyle: const TextStyle(fontSize: 10),
                                  hintStyle: const TextStyle(
                                    fontSize: 13,
                                  ),
                                  hintText: 'Enter OTP',
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
                          if (otpKey.currentState!.validate()) {
                            log('val');
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => const ResetPassword(),
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
