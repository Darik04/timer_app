import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:timer_app/src/models/timer_model.dart';
import 'package:timer_app/src/views/add_timer_view.dart';


class MainView extends StatefulWidget {


  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {

  @override
  void initState() {
    super.initState();
    startTimer();
  }
  List<TimerModel> timers = [];
  Timer? timer;

  void startTimer(){
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        for(int i = 0; i < timers.length; i++){
          if(timers[i].seconds == 1){
            if(timers.length >= 5){
              timers[4].stopped = false;
            }
            timers.removeWhere((element) => element.id == timers[i].id);
          }else{
            if(!timers[i].stopped)
              timers[i].seconds -= 1;
          }
        }
      });
    });
  }

  void addTimer() async{
    bool? addTimer = await Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const AddTimerView()));
    var rng = Random();
    if(addTimer != null){
      setState(() {
        timers.add(TimerModel(
          id: timers.length > 0 ? timers.last.id + 1 : 1,
          seconds: rng.nextInt(30) + 10,
          stopped: timers.length >= 4
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TIMERS LIST'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int i){
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(width: 1, color: Colors.black))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Timer: ${timers[i].id}', style: TextStyle(fontSize: 16)),
                    Text(timers[i].stopped ? 'stopped' : '${timers[i].seconds} sec', style: TextStyle(fontSize: 14)),
                  ],
                ),
              );
            }, 
            separatorBuilder: (BuildContext context, int i){
              return Container();
            },  
            itemCount: timers.length
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 35),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('TOTAL: ${timers.length}', style: TextStyle(fontSize: 16)),
            FloatingActionButton(
              onPressed: addTimer,
              child: const Icon(
                Icons.add,
                color: Colors.white
              ),
            ),
          ],
        ),
      ),
    );
  }
}