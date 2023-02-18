


class Comments{
  int?id;
  String? by;
  String? text;


  Comments({required this.by,required this.id,required this.text});


  factory Comments.fromJson(Map<String,dynamic>json){

    return Comments(
        by: json['by'],
        id: json['id'],
        text:json['text']
    );
  }







}