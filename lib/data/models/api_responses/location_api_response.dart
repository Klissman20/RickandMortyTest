import 'package:rick_n_morty_test/data/models/location_model.dart';

class LocationApiResponse {
  final Info info;
  final List<LocationModel> results;

  LocationApiResponse({
    required this.info,
    required this.results,
  });

  factory LocationApiResponse.fromJson(Map<String, dynamic> json) =>
      LocationApiResponse(
        info: Info.fromJson(json["info"]),
        results: List<LocationModel>.from(
            json["results"].map((x) => LocationModel.fromJson(x))),
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
  final String prev;

  Info({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
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
