import 'package:find_me/core/utils/app_color.dart';
import 'package:find_me/core/utils/text_style.dart';
import 'package:find_me/core/utils/utils_methods.dart';
import 'package:flutter/material.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({super.key});

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: primaryPadding,
        child: Column(
          children: [
            Text("Complete Your Profile", style: TitleHelper.h4),
            SizedBox(height: height * .02),
            Text(
                "Don’t worry only you can see your personal data . No one else will be able to see it.",
                style: SubTitleHelper.h11,
                textAlign: TextAlign.center),
            SizedBox(height: height * .05),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(width: 10, color: AppColors.light),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 0),
                        blurRadius: 10,
                        color: AppColors.lightGrey3)
                  ]),
              child: const CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(
                    "https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3569&q=80"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
