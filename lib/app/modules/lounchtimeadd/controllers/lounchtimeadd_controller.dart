import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LounchtimeaddController extends GetxController {
  final TextEditingController name = TextEditingController();
  final TextEditingController location = TextEditingController();
  //TODO: Implement LounchtimeaddController
  TimeOfDay timeshow = const TimeOfDay(
    hour: 08,
    minute: 45,
  );

  timepick(dynamic context) {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      timeshow = value!;
      print(timeshow.format(context));
      update();
    });
  }

  void submittime(dynamic context) {
    FirebaseFirestore.instance.collection(location.text).doc().set({
      "Name": name.text,
      "Time": timeshow.format(context),
    }).whenComplete(() => SnackBar(content: Text("Data Submit")));
  }
}
