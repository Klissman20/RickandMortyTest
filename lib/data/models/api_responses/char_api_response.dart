import 'package:rick_n_morty_test/data/models/char_model.dart';

class CharacterApiResponse {
  final Info info;
  final List<CharacterModel> results;

  CharacterApiResponse({
    required this.info,
    required this.results,
  });

  factory CharacterApiResponse.fromJson(Map<String, dynamic> json) =>
      CharacterApiResponse(
        info: Info.fromJson(json["info"]),
        results: List<CharacterModel>.from(
            json["results"].map((x) => CharacterModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Info {
  final int count;
  final int pages;
  final String next;
  final dynamic prev;

  Info({
    required this.count,
    required this.pages,
    required this.next,
    this.prev,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        count: json["count"],
        pages: json["pages"],
        next: json["next"],
        prev: json["prev"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "pages": pages,
        "next": next,
        "prev": prev,
      };
}
