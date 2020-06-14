import 'package:flutter/material.dart';
import 'package:metromobile/logIn.dart';
import 'package:metromobile/register.dart';

class MmAuthenticate extends StatefulWidget {
  @override
  _MmAuthenticateState createState() => _MmAuthenticateState();
}

class _MmAuthenticateState extends State<MmAuthenticate> {

  bool showSignIn = true;
  void toggleView () {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if(showSignIn){
      return MmLogInStateful(toggleView: toggleView);
    }else{
      return MmRegisterStateful(toggleView: toggleView);
    }
  }
}
