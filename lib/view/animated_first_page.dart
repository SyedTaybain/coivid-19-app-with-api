import 'dart:async';

import 'package:covid_api_api/view/world_state.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class animatedFirstPage extends StatefulWidget {
  const animatedFirstPage({Key? key}) : super(key: key);

  @override
  State<animatedFirstPage> createState() => _animatedFirstPageState();
}

class _animatedFirstPageState extends State<animatedFirstPage> with SingleTickerProviderStateMixin{



  late final AnimationController _controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this)..repeat();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4),
        () => Navigator.push(context, MaterialPageRoute(builder: (context)=> worldStateScreen())) );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          AnimatedBuilder(
              animation: _controller,
              child: Container(
                child: Center(
                  child: Image(image: AssetImage("assets/images/virus.png"),),
                ),
              ),
              builder: (BuildContext context, Widget? child){
                return Transform.rotate(
                  angle: _controller.value * 2 * math.pi,
                  child: child,
                );
              }),
          SizedBox(height: MediaQuery.of(context).size.height * 0.08,),

          Text("Covid-19\nTracking App",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,

            ),
          ),

        ],
      )),
    );
  }
}




