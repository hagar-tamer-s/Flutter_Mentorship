import 'package:flutter/material.dart';

import 'package:velora_app/features/auth/presentation/widgets/hor_divider.dart';
import 'package:velora_app/features/auth/presentation/widgets/social_container.dart';

class Socials extends StatelessWidget {
  const Socials({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: HorDivider()),
            Text(
              "  OR CONTINUE WITH  ",
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: Color(0xff847A78),
              ),
            ),
            Expanded(child: HorDivider()),
          ],
        ),
        Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SocialContainer(txt: "Apple", icon: "assets/icons/apple.svg"),
            SocialContainer(txt: "Google", icon: "assets/icons/google.svg"),
          ],
        ),
      ],
    );
  }
}
