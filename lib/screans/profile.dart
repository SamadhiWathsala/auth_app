import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  static const String routeName = '/profile';
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: size.height/25),
              child: CircleAvatar(
                radius: size.width/8,
                child: Icon(Icons.person,size: size.width/8,),
              ),
            )
          ],
        ),
      ),
    );
  }
}


