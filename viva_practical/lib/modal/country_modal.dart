class country {
  List capital;
  Map name;
  Map languages;
  int population;
  List timezones;

  country({
    required this.name,
    required this.capital,
    required this.languages,
    required this.population,
    required this.timezones,
  });

  factory country.fromJson({required Map<String, dynamic> data}) => country(
        capital: data["capital"] ?? [],
        name: data["name"],
        languages: data["languages"] ?? {},
        population: data["population"],
        timezones: data["timezones"],
      );
}
