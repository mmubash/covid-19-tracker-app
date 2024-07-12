import 'package:covid_19_tracker/Models/world_states_model.dart';
import 'package:covid_19_tracker/Views/countries_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

import 'package:covid_19_tracker/Services/states_services.dart' ;

class WorldScreen extends StatefulWidget {
  const WorldScreen({super.key});

  @override
  State<WorldScreen> createState() => _WorldScreenState();
}

class _WorldScreenState extends State<WorldScreen> {
  final  colorList = [Colors.blue, Colors.green, Colors.red];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Covid-19 Tracker"),
        actions: null,
        leading: null,
      ),
      body: FutureBuilder(
          future:StatesServices.fetchWorldStatesRecord() ,
          builder: (context,AsyncSnapshot<WorldStatesModel?> snapshot){
            if(!snapshot.hasData)
            {
              return SpinKitFadingCircle(
                color: Colors.grey,
              );
            }
            else{
              return Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.03,
                  ),
                  PieChart(
                    dataMap: {
                      "Total":snapshot.data!.cases!.toDouble(),
                      "Recovered":snapshot.data!.recovered!.toDouble(),
                      "Death":snapshot.data!.deaths!.toDouble(),
                    },
                    chartType: ChartType.ring,
                    colorList: colorList,
                    chartValuesOptions: ChartValuesOptions(
                      showChartValuesInPercentage: true
                    ),
                    chartRadius: MediaQuery.of(context).size.width/3.2,
                    legendOptions: LegendOptions(
                        legendPosition: LegendPosition.left
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.03,
                  ),
                  Card(
                    child: Column(
                      children: [
                        showWorldStatesData("Total Cases", snapshot.data!.cases!.toString()),
                        showWorldStatesData("Total Recovered", snapshot.data!.recovered!.toString()),
                        showWorldStatesData("Total Deaths", snapshot.data!.deaths!.toString()),
                        showWorldStatesData("Active Cases", snapshot.data!.active!.toString()),
                        showWorldStatesData("Critical Cases", snapshot.data!.critical!.toString()),
                        showWorldStatesData("Today Recovered", snapshot.data!.todayRecovered!.toString()),
                        showWorldStatesData("Total Deaths", snapshot.data!.todayDeaths!.toString()),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.03,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CountriesListScreen()));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*0.06,
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(6)
                      ),
                      child: Center(child: Text("Track Countries")),
                    ),
                  )
                ],
              );
            }
          }
      ),
    );
  }
  ListTile showWorldStatesData(String title,String value) {
    return ListTile(
             leading: Text(title),
             trailing: Text(value),
    );
  }
}
