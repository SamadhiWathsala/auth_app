import 'package:auth_app/screans/profile.dart';
import 'package:auth_app/services/auth_services.dart';
import 'package:auth_app/services/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

class CreateProfile extends StatefulWidget {
  static const String routeName = '/create-profile';
  const CreateProfile({Key? key}) : super(key: key);

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  StorageService _storageService = StorageService();


  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthService>().user;
    final _node = FocusScope.of(context);
    final size = MediaQuery.of(context).size;
    final ImagePicker _picker = ImagePicker();


    return Scaffold(
      appBar: AppBar(
        title: const Text('Change profile'),
      ),
      body: SizedBox(
        width: size.width,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width/30, vertical: size.height/25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Stack(
                      clipBehavior: Clip.none,
                      fit: StackFit.expand,
                      children: [
                         CircleAvatar(
                          child: user.photoURL == null ?  Icon(Icons.person,size: size.width/8,) : null ,
                          backgroundImage: user.photoURL != null ? NetworkImage(user.photoURL!) : null,
                        ),
                        Positioned(
                            bottom: -10,
                            right: -30,
                            child: RawMaterialButton(
                              onPressed: () async{
                                final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                                await _storageService.uploadProfileImage(image!.path,image.name, user);
                                // print(photoURL);
                                // user.updatePhotoURL(photoURL);
                                print('Imageeeeeeeeeeeee');
                                print(image.name);
                                print(image.path);
                                // TODO : Change profile image logic
                              },
                              elevation: 2.0,
                              fillColor: Colors.white70,
                              child: const Icon(Icons.camera_alt_outlined, color: Colors.blue,),
                              padding: const EdgeInsets.all(10.0),
                              shape: const CircleBorder(),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Form(
              key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 15),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.name,
                        onEditingComplete: () => _node.nextFocus(),
                        decoration: InputDecoration(
                          labelText: user.displayName != null ? user.displayName.toString() : 'Username',
                          prefixIcon: const Icon(Icons.person_outline_outlined),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        onChanged: (String? value)=> setState(() {
                          _name = value;
                        }),
                        onSaved: (String? value) => setState(() {
                          _name = value;
                        }),
                      ),
                    ),
                  ],
                )
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            onPressed: (){
              if(_formKey.currentState!.validate()){
                user.updateDisplayName(_name);
                Navigator.pushNamed(context, Profile.routeName);
              }
            },
            child: Text('SAVE CHANGES',style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white),)),
      ),
    );
  }
}
