import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text("my page",style: TextStyle(color:Colors.black),),
      ),
    );
  }
}
