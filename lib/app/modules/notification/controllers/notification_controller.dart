import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationController extends GetxController {
  //TODO: Implement NotificationController

  Future getNotification() async {
    FirebaseFirestore.instance.collection("Notification").doc().snapshots();
  }
}
