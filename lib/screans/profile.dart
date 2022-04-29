import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  static const String routeName = '/profile';
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Widget nameCard(String name,IconData icon){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            height: size.height/10,
            width: size.width/1.2,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(2,2),
                      blurRadius: 4,
                      color: Colors.grey
                  )
                ]
            ),
            child: ListTile(
              leading: Icon(icon),
              title: Text(name),
            )
        ),
      );
    }
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
            ),
            nameCard('User name', Icons.person_outline_outlined),
            nameCard('Phone number', Icons.phone_outlined),
            nameCard('User email', Icons.phone_outlined)
          ],
        ),
      ),
    );
  }
}


