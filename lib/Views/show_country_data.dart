import 'package:covid_19_tracker/Models/countries_list_model.dart';
import 'package:flutter/material.dart';

class ShowCountryData extends StatelessWidget {
  const ShowCountryData({super.key,this.country});
  final CountryListModel? country;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(country!.country),
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Card(
            margin: EdgeInsets.fromLTRB(
              0,
              MediaQuery.of(context).size.height * 0.2,
              0,
              MediaQuery.of(context).size.height * 0.15,
            ),
            clipBehavior: Clip.hardEdge,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                showCountryData("Total Cases", country!.cases.toString()),
                showCountryData("Total Recovered", country!.recovered.toString()),
                showCountryData("Total Deaths", country!.deaths.toString()),
                showCountryData("Active Cases", country!.active.toString()),
                showCountryData("Critical Cases", country!.critical.toString()),
                showCountryData("Today Recovered", country!.todayRecovered.toString()),
                showCountryData("Total Deaths", country!.todayDeaths.toString()),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0,
                MediaQuery.of(context).size.height * 0.55),
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                country!.countryInfo.flag,
              ),
            ),
          )
        ],
      ),
    );
  }

  ListTile showCountryData(String title, String value) {
    return ListTile(
      leading: Text(title),
      trailing: Text(value),
    );
  }
}
