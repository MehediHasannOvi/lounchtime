import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerView extends StatelessWidget {
  const ShimmerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.builder(
          itemCount: 15,
          itemBuilder: (contex, index) {
            return Shimmer.fromColors(
                child: const ShimmerLayout(),
                baseColor: Colors.grey.withOpacity(0.5),
                highlightColor: Colors.white);
          }),
    );
  }
}
class ShimmerLayout extends StatelessWidget {
  const ShimmerLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
                                  child: ListTile(
                                    title: Container(height: 10,width: double.infinity,),
                                    trailing: Container(height: 10,width: double.infinity,),
                                  ),
                                );
  }
}