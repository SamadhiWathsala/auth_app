import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthSvg extends StatelessWidget {
  final String imagePath;
  const AuthSvg(
      {Key? key,required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          width: double.infinity,
        ),
        SizedBox(
          height: size.height * 0.3,
          width: size.width * 0.8,
          child: SvgPicture.asset(imagePath),
        ),
      ],
    );
  }
}