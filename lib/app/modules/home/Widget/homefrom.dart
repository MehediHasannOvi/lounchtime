import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lounchtime/helper/AppColors.dart';
import '../../../routes/app_pages.dart';

class HometextFrom extends StatefulWidget {
  const HometextFrom({
    Key? key,
  }) : super(key: key);

  @override
  State<HometextFrom> createState() => _HometextFromState();
}

class _HometextFromState extends State<HometextFrom> {
  final _dropdownFormKey = GlobalKey<FormState>();
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          child: Text("Munshiganj [ মুন্সীগঞ্জ ]"), value: "Munshiganj"),
      const DropdownMenuItem(
          child: Text("Narayanganj [ নারায়ণগঞ্জ ]"), value: "Narayanganj"),
      // const DropdownMenuItem(child: Text("_"), value: "_"),
    ];
    return menuItems;
  }

  String? selectedValue = null;
  String? selectedValue1 = null;
  // String selectedValue = "_";
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _dropdownFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7)),
                child: DropdownButtonFormField(
                    decoration: const InputDecoration(
                      label: Text("প্রস্থান (Departure)"),
                      labelStyle: TextStyle(color: appColors.dark2Green),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.zero,
                      ),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    dropdownColor: Colors.white,
                    validator: (value) =>
                        value == null ? "প্রস্থান নির্বাচন করুন" : null,
                    value: selectedValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue = newValue!;

                        print(newValue);
                      });
                    },
                    items: dropdownItems)),
            const SizedBox(
              height: 10,
            ),
            Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7)),
                child: DropdownButtonFormField(
                    decoration: const InputDecoration(
                      label: Text("গন্তব্য (destination)"),
                      labelStyle: TextStyle(color: appColors.dark2Green),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.zero,
                      ),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    dropdownColor: Colors.white,
                    validator: (value) =>
                        value == null ? "গন্তব্য নির্বাচন করুন" : null,
                    value: selectedValue1,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue1 = newValue!;

                        print(newValue);
                      });
                    },
                    items: dropdownItems)),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                if (_dropdownFormKey.currentState!.validate()) {
                  Get.toNamed(
                    Routes.SHOWLOUNCHTIME,
                    arguments: {"From": selectedValue},
                  );
                }
              },
              child: Container(
                height: 40,
                width: double.infinity,
                alignment: Alignment.center,
                // ignore: prefer_const_constructors
                child: Text(
                  "সময় জানুন",
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                decoration: BoxDecoration(
                    color: appColors.darkGreen,
                    borderRadius: BorderRadius.circular(5)),
              ),
            ),
          ],
        ));
  }
}
