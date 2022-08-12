import 'package:flutter/material.dart';

class AddTimerView extends StatelessWidget {
  const AddTimerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NEW TIMER'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
          child: InkWell(
            onTap: (){
              Navigator.pop(context, true);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 25),
              color: Colors.red,
              alignment: Alignment.center,
              child: Text('Start Random Timer', style: TextStyle(color: Colors.white),)
            ),
          )
        ),
      )
    );
  }
}