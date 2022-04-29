import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;
  const AuthLayout({Key? key,required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
            top: -50,
            left: -size.width/6,
            child: CircleAvatar(
              backgroundColor: Colors.blue[50],
              radius: 100,
            )
        ),
        Positioned(
            top: size.height/1.2,
            right: -size.width/5,
            child: CircleAvatar(
              backgroundColor: Colors.blue[50],
              radius: 150,
            )
        ),
        child
      ],
    );
  }
}