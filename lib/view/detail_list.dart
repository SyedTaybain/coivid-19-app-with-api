import 'dart:async';

import 'package:covid_api_api/view/world_state.dart';
import 'package:flutter/material.dart';



class detailList extends StatefulWidget {
  String name;
  String image;
  int cases,TodayCases,Deaths,Recovered,Active,Tests,Population;

   detailList({

     required this.image,
     required this.name,
     required this.cases,
     required this.TodayCases,
     required this.Deaths,
     required this.Recovered,
     required this.Active,
     required this.Tests,
     required this.Population,


   }) ;

  @override
  State<detailList> createState() => _detailListState();
}

class _detailListState extends State<detailList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.name),
          centerTitle: true,
        ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,

            children: [

              Padding(
                padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height* 0.060),
                child: Card(
                  
                  child: Column(

                    children: [
                      SizedBox(height: 30,),
                      ResuebleRow(title: "Cases", value: widget.cases.toString()),
                      ResuebleRow(title: "TodayCases", value: widget.TodayCases.toString()),
                      ResuebleRow(title: "Population", value: widget.Population.toString()),
                      ResuebleRow(title: "Tests", value: widget.Tests.toString()),
                      ResuebleRow(title: "Active", value: widget.Active.toString()),
                      ResuebleRow(title: "Recovered", value: widget.Recovered.toString()),
                      ResuebleRow(title: "Deaths", value: widget.Deaths.toString()),
                    ],
                  ),
                ),
              ),
              Image(
                  height: 100,
                  width: 100,
                  image: NetworkImage(widget.image,))
              // CircleAvatar(
              //   radius: 40,
              //   backgroundImage: NetworkImage(widget.image),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}



