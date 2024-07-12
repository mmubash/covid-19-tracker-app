import 'package:covid_19_tracker/Models/countries_list_model.dart';

import 'package:covid_19_tracker/Services/states_services.dart';
import 'package:covid_19_tracker/Views/show_country_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shimmer/shimmer.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({super.key});

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(7.0),
        child: FutureBuilder(
          future: StatesServices.fetchCountryList(),
          builder: (context, AsyncSnapshot<List<CountryListModel>> snapshot) {
            if (snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    onEditingComplete: () {
                      setState(() {});
                    },
                    controller: searchController,
                    decoration: InputDecoration(
                        hintText: "Search with country name",
                        constraints: BoxConstraints(
                            maxHeight:
                                MediaQuery.of(context).size.height * 0.06),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: searchController.text.isEmpty
                        ? showCountriesList(snapshot.data!)
                        : showCountriesList(searchCountryByName(
                            searchController.text.toString(), snapshot)),
                  )
                ],
              );
            }
            else {
              return Shimmer.fromColors(
                  baseColor: Colors.grey.shade700,
                  highlightColor: Colors.grey.shade100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextField(
                        onEditingComplete: () {
                          setState(() {});
                        },
                        controller: searchController,
                        decoration: InputDecoration(
                            hintText: "Search with country name",
                            constraints: BoxConstraints(
                                maxHeight:
                                    MediaQuery.of(context).size.height * 0.06),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                            )),
                      ),
                      Text("loading..."),
                      Expanded(
                        child: ListView.builder(
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: Container(
                                  color: Colors.white,
                                  width:
                                      MediaQuery.of(context).size.height * 0.08,
                                  height:
                                      MediaQuery.of(context).size.height * 0.08,
                                ),
                                title: Container(
                                  color: Colors.white,
                                  width:
                                      MediaQuery.of(context).size.height * 0.01,
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                subtitle: Container(
                                  color: Colors.white,
                                  width:
                                      MediaQuery.of(context).size.height * 0.01,
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                              );
                            }),
                      )
                    ],
                  ));
            }
          },
        ),
      ),
    );
  }

  searchCountryByName(
      String name, AsyncSnapshot<List<CountryListModel>> snapshot) {
    List<CountryListModel> searchedCountry = [];
    for (CountryListModel country in snapshot.data!) {
      if (country.country.toLowerCase().contains(name.toLowerCase())) {
        searchedCountry.add(country);
      }
    }
    return searchedCountry;
  }

  ListView showCountriesList(List<CountryListModel> countriesList) {
    return ListView.builder(
        itemCount: countriesList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return ShowCountryData(country: countriesList[index],);
              }));
            },
            child: showCountry(
                countriesList[index].countryInfo.flag,
                countriesList[index].country,
                countriesList[index].cases.toString(),
                context),
          );
        });
  }

  Widget showCountry(String? flagUrl, String? countryName, String? totalCases,
      BuildContext context) {
    return (flagUrl == null || countryName == null || totalCases == null)
        ? SpinKitFadingCircle()
        : ListTile(
            leading: Image.network(
              flagUrl!,
              width: MediaQuery.of(context).size.height * 0.08,
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            title: Text(
              countryName!,
            ),
            subtitle: Text(totalCases!),
          );
  }
}
