import 'package:covid_api_api/Services/states_services.dart';
import 'package:covid_api_api/view/detail_list.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({Key? key}) : super(key: key);

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {

  TextEditingController _controller = TextEditingController();

  StatesServices statesServices = StatesServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (value){
                  setState(() {
                  });
                },
                decoration: InputDecoration(
                  hintText: "Search for the Countries",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50)
                  ),
                ),
                controller: _controller,
              ),
            ),

            Expanded(
                child: FutureBuilder(
                  future: statesServices.countryListApi(),
                    builder: (context ,AsyncSnapshot<List<dynamic>> snapshot){
                      if(!snapshot.hasData){
                        /////////////////it is like loading
                        return ListView.builder(
                            itemCount: 4,
                            itemBuilder: (context,index){
                              return Shimmer.fromColors(
                                baseColor: Colors.grey.shade700,
                                highlightColor: Colors.grey.shade200,
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: Container(height: 50, width: 89, color: Colors.white,),
                                      title: Container(height: 10, width: 89, color: Colors.white,),
                                      subtitle: Container(height: 10, width: 89, color: Colors.white,),
                                    )

                                  ],
                                ),
                              );

                            }
                        );
                      }
                      else{
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context,index){
                              String name = snapshot.data![index]["country"];

                              if(_controller.text.isEmpty){
                                return Column(
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                            detailList(
                                               image: snapshot.data![index]["countryInfo"]["flag"],
                                                name: snapshot.data![index]["country"],
                                                cases: snapshot.data![index]["cases"],
                                                TodayCases: snapshot.data![index]["todayCases"],
                                                Deaths: snapshot.data![index]["deaths"],
                                                Recovered: snapshot.data![index]["recovered"],
                                                Active: snapshot.data![index]["active"],
                                                Tests: snapshot.data![index]["tests"],
                                                Population: snapshot.data![index]["population"]
                                            )
                                        ));
                                      },
                                      child: ListTile(
                                        leading: Image(
                                            height: 50,
                                            width: 50,
                                            image: NetworkImage(
                                              snapshot.data![index]["countryInfo"]["flag"],

                                            )),
                                        title: Text(snapshot.data![index]["country"]),
                                        subtitle: Text("Cases  : "+snapshot.data![index]["cases"].toString()),
                                      ),
                                    ),

                                  ],
                                );
                              }
                              else if(name.toLowerCase().contains(_controller.text.toLowerCase())){
                                return Column(
                                  children: [

                                    InkWell(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                            detailList(
                                                image: snapshot.data![index]["countryInfo"]["flag"],
                                                name: snapshot.data![index]["country"],
                                                cases: snapshot.data![index]["cases"],
                                                TodayCases: snapshot.data![index]["todayCases"],
                                                Deaths: snapshot.data![index]["deaths"],
                                                Recovered: snapshot.data![index]["recovered"],
                                                Active: snapshot.data![index]["active"],
                                                Tests: snapshot.data![index]["tests"],
                                                Population: snapshot.data![index]["population"]
                                            )
                                        ));
                                      },
                                      child: ListTile(
                                        leading: Image(
                                            height: 50,
                                            width: 50,
                                            image: NetworkImage(
                                              snapshot.data![index]["countryInfo"]["flag"],

                                            )),
                                        title: Text(snapshot.data![index]["country"]),
                                        subtitle: Text("Cases  : "+snapshot.data![index]["cases"].toString()),
                                      ),
                                    )

                                  ],
                                );
                              }
                              else{
                                return Container();
                              }

                            }
                        );
                      }


                    }
                )
            )
          ],
        ),
      ),
    );
  }
}



