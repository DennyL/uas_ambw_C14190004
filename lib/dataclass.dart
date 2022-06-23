class DataAPI {
  String cTitle;
  String cPubDate;
  String cDesc;
  String cThumbnail;
  String cLink;

  DataAPI({
    required this.cTitle,
    required this.cPubDate,
    required this.cDesc,
    required this.cThumbnail,
    required this.cLink,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': cTitle,
      'pubDate': cPubDate,
      'description': cDesc,
      'thumbnail': cThumbnail,
      'link': cLink
    };
  }

  factory DataAPI.fromJSON(Map<String, dynamic> json) {
    return DataAPI(
        cTitle: json['title'],
        cPubDate: json['pubDate'],
        cDesc: json['description'],
        cThumbnail: json['thumbnail'],
        cLink: json['link']);
  }
}
