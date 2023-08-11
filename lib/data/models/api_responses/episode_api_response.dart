import 'package:rick_n_morty_test/data/models/episode_model.dart';

class EpisodeApiResponse {
  final Info info;
  final List<EpisodeModel> results;

  EpisodeApiResponse({
    required this.info,
    required this.results,
  });

  factory EpisodeApiResponse.fromJson(Map<String, dynamic> json) =>
      EpisodeApiResponse(
        info: Info.fromJson(json["info"]),
        results: List<EpisodeModel>.from(
            json["results"].map((x) => EpisodeModel.fromJson(x))),
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
