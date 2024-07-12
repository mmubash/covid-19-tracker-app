class CountryInfo {
  final int id;
  final String iso2;
  final String iso3;
  final double lat;
  final double long;
  final String flag;

  CountryInfo({
    required this.id,
    required this.iso2,
    required this.iso3,
    required this.lat,
    required this.long,
    required this.flag,
  });

  factory CountryInfo.fromJson(Map<String, dynamic> json) {
    return CountryInfo(
      id: json['_id'] ?? 0,
      iso2: json['iso2'] ?? '',
      iso3: json['iso3'] ?? '',
      lat: (json['lat'] ?? 0.0).toDouble(),
      long: (json['long'] ?? 0.0).toDouble(),
      flag: json['flag'] ?? '',
    );
  }
}

class CountryListModel {
  final int updated;
  final String country;
  final CountryInfo countryInfo;
  final int cases;
  final int todayCases;
  final int deaths;
  final int todayDeaths;
  final int recovered;
  final int todayRecovered;
  final int active;
  final int critical;
  final int casesPerOneMillion;
  final int deathsPerOneMillion;
  final int tests;
  final int testsPerOneMillion;
  final int population;
  final String continent;
  final int oneCasePerPeople;
  final int oneDeathPerPeople;
  final int oneTestPerPeople;
  final double activePerOneMillion;
  final double recoveredPerOneMillion;
  final double criticalPerOneMillion;

  CountryListModel({
    required this.updated,
    required this.country,
    required this.countryInfo,
    required this.cases,
    required this.todayCases,
    required this.deaths,
    required this.todayDeaths,
    required this.recovered,
    required this.todayRecovered,
    required this.active,
    required this.critical,
    required this.casesPerOneMillion,
    required this.deathsPerOneMillion,
    required this.tests,
    required this.testsPerOneMillion,
    required this.population,
    required this.continent,
    required this.oneCasePerPeople,
    required this.oneDeathPerPeople,
    required this.oneTestPerPeople,
    required this.activePerOneMillion,
    required this.recoveredPerOneMillion,
    required this.criticalPerOneMillion,
  });

  factory CountryListModel.fromJson(Map<String, dynamic> json) {
    return CountryListModel(
      updated: json['updated'] ?? 0,
      country: json['country'] ?? '',
      countryInfo: CountryInfo.fromJson(json['countryInfo'] ?? {}),
      cases: json['cases'] ?? 0,
      todayCases: json['todayCases'] ?? 0,
      deaths: json['deaths'] ?? 0,
      todayDeaths: json['todayDeaths'] ?? 0,
      recovered: json['recovered'] ?? 0,
      todayRecovered: json['todayRecovered'] ?? 0,
      active: json['active'] ?? 0,
      critical: json['critical'] ?? 0,
      casesPerOneMillion: json['casesPerOneMillion'] ?? 0,
      deathsPerOneMillion: json['deathsPerOneMillion'] ?? 0,
      tests: json['tests'] ?? 0,
      testsPerOneMillion: json['testsPerOneMillion'] ?? 0,
      population: json['population'] ?? 0,
      continent: json['continent'] ?? '',
      oneCasePerPeople: json['oneCasePerPeople'] ?? 0,
      oneDeathPerPeople: json['oneDeathPerPeople'] ?? 0,
      oneTestPerPeople: json['oneTestPerPeople'] ?? 0,
      activePerOneMillion: (json['activePerOneMillion'] ?? 0.0).toDouble(),
      recoveredPerOneMillion: (json['recoveredPerOneMillion'] ?? 0.0).toDouble(),
      criticalPerOneMillion: (json['criticalPerOneMillion'] ?? 0.0).toDouble(),
    );
  }

  @override
  String toString() {
    return 'CountryListModel{updated: $updated, country: $country, countryInfo: $countryInfo, cases: $cases, todayCases: $todayCases, deaths: $deaths, todayDeaths: $todayDeaths, recovered: $recovered, todayRecovered: $todayRecovered, active: $active, critical: $critical, casesPerOneMillion: $casesPerOneMillion, deathsPerOneMillion: $deathsPerOneMillion, tests: $tests, testsPerOneMillion: $testsPerOneMillion, population: $population, continent: $continent, oneCasePerPeople: $oneCasePerPeople, oneDeathPerPeople: $oneDeathPerPeople, oneTestPerPeople: $oneTestPerPeople, activePerOneMillion: $activePerOneMillion, recoveredPerOneMillion: $recoveredPerOneMillion, criticalPerOneMillion: $criticalPerOneMillion}';
  }
}

void main() {
  // Your JSON data
  List<Map<String, dynamic>> jsonData = [
    // ... (insert the provided JSON data here)
  ];

  // Create a list of CountryListModel objects
  List<CountryListModel> countryList = jsonData
      .map((json) => CountryListModel.fromJson(json))
      .toList();

  // Print the list of CountryListModel objects
  countryList.forEach((country) {
    print(country);
  });
}
