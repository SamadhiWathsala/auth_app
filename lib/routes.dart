import 'package:auth_app/screans/auth/get_otp.dart';
import 'package:auth_app/screans/create_profile.dart';
import 'package:auth_app/screans/profile.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  GetOTP.routeName: (context) => const GetOTP(),
  CreateProfile.routeName: (context) => const CreateProfile(),
  Profile.routeName: (context) => const Profile(),
  CreateProfile.routeName: (context) => const CreateProfile()
};