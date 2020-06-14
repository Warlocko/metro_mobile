import 'package:flutter/material.dart';
import 'package:metromobile/UserM.dart';
import 'package:metromobile/authenticate.dart';
import 'package:metromobile/logIn.dart';
import 'package:provider/provider.dart';
import 'package:metromobile/navbar.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserM>(context);

    if(user == null){
      return MmAuthenticate();
    }else{
      return MmNavbarStateful();
    }
  }
}
