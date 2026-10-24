import 'package:flutter/material.dart';

class RememberPass extends StatelessWidget {
  const RememberPass({super.key, this.onChanged});
  final void Function(bool?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: true,
              onChanged: onChanged,
              activeColor: Color(0xff8b4d3f),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(3),
              ),
            ),
            Text(
              "Remember Me",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "Forget Password?",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xff8b4d3f),
            ),
          ),
        ),
      ],
    );
  }
}
