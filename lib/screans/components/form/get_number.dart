import 'package:auth_app/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InputPhone extends StatefulWidget {
  const InputPhone({Key? key}) : super(key: key);

  @override
  State<InputPhone> createState() => _InputPhoneState();
}

class _InputPhoneState extends State<InputPhone> {
  final _formKey = GlobalKey<FormState>();
  String? _phoneNumber;

  FirebaseAuth auth = FirebaseAuth.instance;

  void onSubmit() async{
    if(_formKey.currentState!.validate()){
      context
          .read<AuthService>()
          .phoneAuthentication(context, _phoneNumber!);
      // Navigator.pushNamed(context, GetOTP.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    final _node = FocusScope.of(context);
    final size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 15),
            child: TextFormField(
              keyboardType: TextInputType.phone,
              textAlign: TextAlign.center,
              onEditingComplete: () => _node.nextFocus(),
              decoration: const InputDecoration(
                labelText: 'Phone number',
                prefixIcon: Icon(Icons.phone_outlined),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone number';
                }
                return null;
              },
              onChanged: (String? value)=> setState(() {
                _phoneNumber = value;
              }),
              onSaved: (String? value) => setState(() {
                _phoneNumber = value;
              }),
            ),
          ),
          ElevatedButton.icon(
              onPressed: onSubmit,
              icon: const Icon(Icons.send_outlined),
              label: const Text('SEND OTP')
          )
        ],
      ),
    );
  }
}
