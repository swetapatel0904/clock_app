import 'dart:math';

import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int hour =0;
  int second = 0;
  int minute = 0;
  int date = 0;
  int month = 0;
  int year = 0;
  bool digital = false;
  bool analog= false;
  bool strap=false;
  String am = " ";

  @override
  void initState() {
    super.initState();
    getTime();
  }
  void getTime()
  {
    hour = DateTime.now().hour;
    if (hour > 12) {
      hour = hour - 12;
      am = "PM";
    } else {
      am = "AM";
    }
    hour=DateTime.now().hour;
    minute=DateTime.now().minute;
    second=DateTime.now().second;
    date=DateTime.now().day;
    month=DateTime.now().month;
    year=DateTime.now().year;
     Future.delayed(const Duration(seconds:1),()=>getTime(),);
     setState(() {

     });
  }
  Widget divider(
      {
        required int s1,
        required int timev,
        required double thik,
        required Color colors,
        required double ind,
        required double end,
       }
       )
  {
    return Transform.rotate(
      angle:2 * pi * s1 / timev,
      child: Transform.rotate(
        angle: pi/2,
        child: Divider(
          thickness: thik,
          endIndent: MediaQuery.sizeOf(context).width * end,
          indent: MediaQuery.sizeOf(context).width * ind,
          color: colors,
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("ClockApp  🇮🇳",style: TextStyle(
            color: Colors.white,
          )
          ),
          centerTitle: true,
        ),
        body: Stack(
        children: [
        Center(
              child: Visibility(
                visible:digital,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.alarm,color: Colors.teal,size: 25),
                          SizedBox(width: 35,),
                          Icon(Icons.mobile_friendly,color: Colors.teal,size: 25),
                          SizedBox(width: 35,),
                          Icon(Icons.shutter_speed,color: Colors.teal,size: 25),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("$hour:$minute:$second",
                          style:const TextStyle(
                        color: Colors.teal,
                        fontSize: 35
                      )
                      ),
                      Text("$am",style:const TextStyle(
                        color: Colors.teal,
                      fontSize: 25),
                      ),
                      Text("$date/$month/$year",
                        style: const TextStyle(
                        fontSize: 19,
                         color: Colors.teal,
                      ),
                      )

                    ],
                  ),
              ),
            ),
      Visibility(
        visible:analog,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.all(10),
                child: Stack(
                  alignment: Alignment.center,
                  children: List.generate(
                      60,
                          (index) => Container(
                            child: Stack(
                          children: [
                            Transform.rotate(
                              angle: (pi * 2) * index / 60,
                              child: Transform.rotate(
                                angle: pi / 2,
                                child: Divider(
                                  thickness: 2,
                                  endIndent: index % 5 == 0
                                      ? MediaQuery.sizeOf(context)
                                      .width *
                                      0.87
                                      : MediaQuery.sizeOf(context)
                                      .width *
                                      0.90,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                  ),
                ),
              ),
            ),
            divider(
                s1: hour,
                timev: 12,
                thik: 5,
                colors: Colors.blue.withOpacity(1),
                ind: 0.35,
                end: 0.48,
                ),
            divider(
                s1: minute,
                timev: 60,
                thik: 4,
                colors: Colors.red.withOpacity(1),
                ind: 0.30,
                end: 0.48,
                ),
            divider(
                colors: Colors.orange.withOpacity(1),
                s1: second,
                timev: 60,
                thik: 3,
                ind: 0.25,
                end: 0.48,
                ),


          ],
        ),
      ),


        Visibility(
        visible:strap,
        child: Stack(
          children: [
            Center(
              child: Container(
                height:270,
                width: 270,
                child: CircularProgressIndicator(
                  color: Colors.green,
                  value: hour/12,
                  strokeWidth: 20,
                ),
              ),
            ),
            Center(
              child: Container(
                height:310,
                width: 310,
                child: CircularProgressIndicator(
                  color: Colors.red,
                  value: minute/60,
                  strokeWidth: 20,

                ),
              ),
            ),
            Center(
              child: Container(
                height:350,
                width: 350,
                child: CircularProgressIndicator(
                  color: Colors.orange,
                  value: second/60,
                  strokeWidth: 20,
                ),
              ),
            ),
          ],
        ),
        ),
    ]),
      drawer: Drawer(
          child: Column(
            children: [
              const SizedBox(height: 10,),
              FloatingActionButton.extended(
                onPressed: () {
                  setState(() {
                    digital = !digital;
                  });
                },
                label: const Text("Digital Clock",style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                )),


              ),
               const SizedBox(height: 10,),
              FloatingActionButton.extended(
                onPressed: () {
                  setState(() {
                    analog = !analog;
                  });
                },
                label: const Text("Analog Clock",style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                )),


              ),
              const SizedBox(height: 10,),
              FloatingActionButton.extended(
                onPressed: () {
                  setState(() {
                    strap = !strap;
                  });
                },
                label: const Text("Strap Watch",style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                )),


              ),

            ],
          ),
        ),

        ),


        );




  }
}
