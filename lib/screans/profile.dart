import 'package:auth_app/screans/create_profile.dart';
import 'package:auth_app/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  static const String routeName = '/profile';
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthService>().user;
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
        actions: [
          IconButton(
              onPressed: (){
                context.read<AuthService>().signOut(context);
              },
              icon: const Icon(Icons.logout_outlined)
          ),
        ],
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
            Expanded(
              child: ListView(
                children: [
                  nameCard(
                      user.displayName == null ? 'Set your name' : user.displayName.toString(),
                      Icons.person_outline_outlined,),
                  nameCard(user.phoneNumber.toString(), Icons.phone_outlined),
                  // nameCard(user.email== null ? 'Set your email' : user.email.toString(), Icons.email_outlined)
                ],
              ),
            ),

          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            onPressed: (){
              Navigator.pushNamed(context, CreateProfile.routeName);
            },
            child: Text('CHANGE PROFILE',style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white),)),
      ),
    );
  }
}


