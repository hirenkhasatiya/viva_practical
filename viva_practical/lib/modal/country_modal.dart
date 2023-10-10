class country {
  List capital;
  Map name;
  Map languages;
  int population;
  List timezones;
  Map flage;
  double area;
  Map idd;

  country({
    required this.idd,
    required this.flage,
    required this.name,
    required this.area,
    required this.capital,
    required this.languages,
    required this.population,
    required this.timezones,
  });

  factory country.fromJson({required Map<String, dynamic> data}) => country(
        flage: data["flags"],
        idd: data["idd"],
        area: data["area"],
        capital: data["capital"] ?? [],
        name: data["name"],
        languages: data["languages"] ?? {},
        population: data["population"],
        timezones: data["timezones"],
      );
}
