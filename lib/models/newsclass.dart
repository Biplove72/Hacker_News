

class NewsItems{

  int? id;
  String? by;
  List? kids;
  String? title;
  String? type;
  String ?url;

  NewsItems({required this.id,
    required this.title,
    required this.by,required this.kids,
    required this.type,
    required this.url
  });

  factory NewsItems.fromJson(Map<String,dynamic> json){
    return NewsItems(
    id: json['id'],
  title: json['title'],
  by: json['by'],
  kids: json['kids'],
  type: json['type'],
  url: json['url']);


  }






}