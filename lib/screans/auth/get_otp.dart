import 'package:auth_app/screans/components/auth_layout.dart';
import 'package:auth_app/screans/components/form/get_otp.dart';
import 'package:auth_app/screans/components/svg/auth_svg.dart';
import 'package:flutter/material.dart';

class GetOTP extends StatelessWidget {
  static const String routeName = '/get-otp';
  const GetOTP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: AuthLayout(
          child: SizedBox(
            height: size.height,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: size.height/12),
                      child: const AuthSvg(imagePath: 'assets/images/otp.svg'),
                    ),
                    const InputOTP(),
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}
