import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            padding: const EdgeInsets.only(
              top: 40,
              right: 180,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.grey,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 400,
              left: 90,
            ),
            child: Text('Privacy Policy Page'),
          ),
        ],
      ),
    );
  }
}
