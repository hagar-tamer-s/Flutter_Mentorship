import 'package:flutter/material.dart';
import 'package:velora_app/features/auth/presentation/screens/log_in_screen.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xffFBF8FC),
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0,
      elevation: 0,
      leading: Image.asset(
        "assets/images/Intertwined Geometric Halo Emblem.png",
        height: 50,
        width: 50,
      ),

      title: Text(
        "VELORA",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
      ),
      actions: [
        // FlutterToggle(
        //   cornerRadius: 25,
        //   radiusStyle: true,
        //   borderWidth: 5,
        //   borderColor: [Color(0xffF6F2F7)],
        //   minWidth: 50,
        //   minHeight: 30,
        //   totalSwitches: 2,
        //   icons: [Icons.light_mode_outlined, Icons.dark_mode_outlined],
        //   activeBgColor: [Colors.white],
        //   activeFgColor: Colors.black,
        //   inactiveFgColor: Color(0xff514440),
        //   inactiveBgColor: Color(0xffF6F2F7),
        // ),
        // SizedBox(width: 7),
        // FlutterToggle(
        //   borderWidth: 5,
        //   borderColor: [Color(0xffF6F2F7)],
        //   radiusStyle: true,
        //   cornerRadius: 25,
        //   minWidth: 50,
        //   minHeight: 33,
        //   totalSwitches: 2,
        //   labels: ["EN", "عربي"],
        //   activeBgColor: [Colors.white],
        //   activeFgColor: Colors.black,
        //   inactiveFgColor: Color(0xff514440),
        //   inactiveBgColor: Color(0xffF6F2F7),
        // ),
        IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LogInScreen()),
            );
          },
          icon: Icon(Icons.logout_outlined),
        ),
      ],
    );
  }
}
