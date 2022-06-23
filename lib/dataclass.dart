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

  factory DataAPI.fromJSON(Map<String, dynamic> json) {
    return DataAPI(
        cTitle: json['title'],
        cPubDate: 'pubDate',
        cDesc: 'description',
        cThumbnail: 'thumbnail',
        cLink: 'link');
  }
}
