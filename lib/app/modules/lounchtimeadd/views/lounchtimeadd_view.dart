import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/lounchtimeadd_controller.dart';

class LounchtimeaddView extends GetView<LounchtimeaddController> {
  const LounchtimeaddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "সময়ের তালিকা ",
            style: TextStyle(color: const Color(0xFF000000)),
          ),
          centerTitle: true,
        ),
        body: Container(
          margin: const EdgeInsets.all(20),
          child: ListView(
            children: [
              TextFormField(
                controller: controller.name,
                decoration: const InputDecoration(hintText: "Lounch Name"),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                controller.timeshow.format(context).toString(),
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controller.location,
                decoration: const InputDecoration(hintText: "Location Name"),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  print("object");
                  // controller.timepick(context);
                },
                child: const Text(
                  "Time Get",
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {
                  controller.submittime(context);
                  print("Button press");
                },
                child: const Text("Submit"),
              )
            ],
          ),
        ));
  }
}
