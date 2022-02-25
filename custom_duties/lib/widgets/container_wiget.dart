import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey[300],
      ),
      child: Column(children: [
        const SizedBox(
          height: 30,
        ),
        Image.asset(
          'assets/box.jpg',
          height: 150,
          width: 150,
        ),
        //const SizedBox(height: 10,),
        const Text(
          'Write a word and search',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'related word',
          style: TextStyle(fontSize: 18),
        )
      ]),
    );
  }
}
