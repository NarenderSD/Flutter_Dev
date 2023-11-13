import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';
import 'main.dart';
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool newuser=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check_if_already_login();
  }
  void check_if_already_login() async {
    var  logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);

    print(newuser);
    if (newuser == false) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomeScreen(),), (route) => false);
    }
    else{
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MyLoginPage(),), (route) => false);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
