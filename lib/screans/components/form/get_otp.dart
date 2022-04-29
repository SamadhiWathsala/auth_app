import 'package:auth_app/screans/profile.dart';
import 'package:flutter/material.dart';

class InputOTP extends StatefulWidget {
  const InputOTP({Key? key}) : super(key: key);

  @override
  State<InputOTP> createState() => _InputOTPState();
}

class _InputOTPState extends State<InputOTP> {
  final _formKey = GlobalKey<FormState>();
  String? _otp;

  void onSubmit() async{
    if(_formKey.currentState!.validate()){
      Navigator.pushNamed(context, Profile.routeName);
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
              textAlign: TextAlign.center,
              onEditingComplete: () => _node.nextFocus(),
              decoration: const InputDecoration(
                labelText: 'Enter OTP',
                prefixIcon: Icon(Icons.password_outlined),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone number';
                }
                return null;
              },
              onChanged: (String? value)=> setState(() {
                _otp = value;
              }),
              onSaved: (String? value) => setState(() {
                _otp = value;
              }),
            ),
          ),
          ElevatedButton.icon(
              onPressed: onSubmit,
              icon: const Icon(Icons.done_outline),
              label: const Text('Ok')
          )
        ],
      ),
    );
  }
}
