import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class SocialContainer extends StatelessWidget {
  const SocialContainer({super.key, required this.txt, required this.icon});
  final String txt;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          SvgPicture.asset(icon),
          Text(
            txt,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
