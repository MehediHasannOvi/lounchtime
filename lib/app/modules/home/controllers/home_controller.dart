// ignore_for_file: unnecessary_overrides
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final TextEditingController go = TextEditingController();
  final TextEditingController to = TextEditingController();

  final String GOTO = "Munshiganj";

  final nowtime = DateTime.now().hour;

  Timelist(dynamic context) => go.text == GOTO
      ? StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection(
                "Munshiganj",
              )
              .where('day', isGreaterThanOrEqualTo: nowtime.toString())
              .snapshots(),
          builder: (context, snapshot) {
            final getdata = snapshot.data?.docs;
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                  itemCount: getdata?.length,
                  itemBuilder: (contex, index) {
                    return getdata!.length == null
                        ? Center(
                            child: Text("Not Data Fount "),
                          )
                        : Card(
                            child: ListTile(
                              title: Text(getdata[index]["Name"]),
                              trailing: Text(getdata[index]["Time"]),
                            ),
                          );
                  });
            }
          },
        )
      : StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("Narayanganj")
              .where('day', isGreaterThanOrEqualTo: nowtime.toString())
              .snapshots(),
          builder: (context, snapshot) {
            final getdata = snapshot.data?.docs;
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                  itemCount: getdata?.length,
                  itemBuilder: (contex, index) {
                    return getdata!.length == null
                        ? Center(
                            child: Text("Not Data Fount "),
                          )
                        : Card(
                            child: ListTile(
                              title: Text(getdata[index]["Name"]),
                              trailing: Text(getdata[index]["Time"]),
                            ),
                          );
                  });
            }
          });

  // Stream<QuerySnapshot> showruslt() {
  //   if (go.text == GOTO) {
  //     FirebaseFirestore.instance.collection("Munshiganj").snapshots();
  //     print("mun");
  //   } else {
  //     FirebaseFirestore.instance.collection("Narayangonj").snapshots();
  //     print("ngonj");
  //   }
  //   return showruslt();
  // }

  // Stream<int> generateNumbers = (() async* {
  //   await Future<void>.delayed(Duration(milliseconds: 2));

  //   for (int i = 1; i <= 5; i++) {
  //     await Future<void>.delayed(Duration(milliseconds: 1));
  //     yield i;
  //   }
  // })();
}
