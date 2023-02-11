// import 'dart:async';
// import 'dart:ffi';

import 'package:covid_api_api/Models/World_states_model.dart';
import 'package:covid_api_api/Services/states_services.dart';
import 'package:covid_api_api/view/countries_list.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class worldStateScreen extends StatefulWidget {
  const worldStateScreen({Key? key}) : super(key: key);

  @override
  State<worldStateScreen> createState() => _worldStateScreenState();
}

class _worldStateScreenState extends State<worldStateScreen> with SingleTickerProviderStateMixin {

  late final AnimationController _controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this)..repeat();
  
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
  final colorList = <Color>[
    Color(0xff4285f4),
    Color(0xff1aa260),
    Color(0xffde5236),
];

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
              FutureBuilder(
                future: statesServices.fecthWorldStatesModelRecord(),
                  builder: (context,AsyncSnapshot<WorldStatesModel> snapshot){

                    if(!snapshot.hasData){
                      return Expanded(
                          flex: 1,
                          child:SpinKitFadingCircle(
                            color: Colors.white,
                            size: 50,
                            controller: _controller,
                          ) );
                    }else{

                      return Column(
                        children: [

                          PieChart(

                              animationDuration: Duration(seconds: 1),
                              chartValuesOptions: ChartValuesOptions(
                                showChartValuesInPercentage: true,
                              ),
                              chartType: ChartType.ring,
                              chartRadius: MediaQuery.of(context).size.width / 2.2,
                              legendOptions: LegendOptions(
                                legendPosition: LegendPosition.left,

                              ),
                              colorList: colorList,
                              dataMap: {
                                "Total": double.parse(snapshot.data!.cases.toString()),
                                "Recovers": double.parse(snapshot.data!.recovered.toString()),
                                "Deaths": double.parse(snapshot.data!.deaths.toString()),
                              }
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height* .06,),
                          Card(
                            child:Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                              child: Column(
                                children: [
                                  ResuebleRow(title: "Total", value: snapshot.data!.cases.toString()),
                                  ResuebleRow(title: "recovered", value: snapshot.data!.recovered.toString()),
                                  ResuebleRow(title: "deaths", value: snapshot.data!.deaths.toString()),
                                  ResuebleRow(title: "critical", value: snapshot.data!.critical.toString()),
                                  ResuebleRow(title: "tests", value: snapshot.data!.tests.toString()),
                                  ResuebleRow(title: "todayCases", value: snapshot.data!.todayCases.toString()),

                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.06,),

                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> CountriesList()));
                            },
                            child: Container(
                                width: double.infinity,
                                height: 60,
                                decoration: BoxDecoration(
                                    color: Color(0xff1aa260),
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                child: Center(
                                  child: Text("Track Countries",),
                                )

                            ),
                          ),
                        ],
                      );
                    }

                  }),



            ],
          ),
        ),
      ),
    );
  }
}


class ResuebleRow extends StatelessWidget {
  String title, value;
   ResuebleRow({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10,right: 10,top: 5, bottom: 5),
      child: Column(

        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          ),
          SizedBox(height: 5,),
          Divider(),
        ],
      ),
    );
  }
}



