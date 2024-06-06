class PokemonTypes {
  final int count;
  final String next;
  final dynamic previous;
  final List<PokemonTypeResult> results;

  PokemonTypes({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory PokemonTypes.fromJson(Map<String, dynamic> json) => PokemonTypes(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<PokemonTypeResult>.from(json["results"].map((x) => PokemonTypeResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class PokemonTypeResult {
  final String name;
  final String url;

  PokemonTypeResult({
    required this.name,
    required this.url,
  });

  factory PokemonTypeResult.fromJson(Map<String, dynamic> json) => PokemonTypeResult(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
