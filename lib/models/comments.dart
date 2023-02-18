


class Comments{
  int?id;
  String? by;
  String? text;
  List? kids;


  Comments({required this.by,required this.id,required this.text,required this.kids});


  factory Comments.fromJson(Map<String,dynamic>json){

    return Comments(
        by: json['by'],
        id: json['id'],
        text:json['text'],
        kids: json['kids']
    );
  }







}