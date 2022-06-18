import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lounchtime/app/routes/app_pages.dart';
import 'package:lounchtime/helper/AppColors.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: appColors.darkGreen,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ListTile(
          title: Text(
            "হােম",
            style: TextStyle(color: Colors.white),
          ),
          leading: Icon(
            CupertinoIcons.home,
            color: Colors.white,
          ),
        ),
        ListTile(
          onTap: () {
            Get.toNamed(Routes.TIMELIST);
          },
          title: Text(
            "সময়ের তালিকা",
            style: TextStyle(color: Colors.white),
          ),
          leading: Icon(
            CupertinoIcons.time,
            color: Colors.white,
          ),
        ),
        ListTile(
          title: Text(
            "লঞ্চর তালিকা ও রুট",
            style: TextStyle(color: Colors.white),
          ),
          leading: Icon(
            CupertinoIcons.square_list,
            color: Colors.white,
          ),
        ),
        ListTile(
          title: Text(
            "যােগাযােগ",
            style: TextStyle(color: Colors.white),
          ),
          leading: Icon(
            CupertinoIcons.mail,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 180,
        ),
        Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Version 1.0.0",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "mehedihasanovi.xyz",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Powered by ababildev",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        )),
      ]),
    );
  }
}
