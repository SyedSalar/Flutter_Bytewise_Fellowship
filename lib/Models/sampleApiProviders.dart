class ModelClass {
  int? userId;
  int? id;
  String? title;
  String? body;

  ModelClass({this.userId, this.id, this.title, this.body});

  ModelClass.fromJson(Map<dynamic, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map data = new Map<dynamic, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}
