class NewsModel {
  String id;
  String name;
  String detail;
  String picture;

  NewsModel({this.id, this.name, this.detail, this.picture});

  NewsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['Name'];
    detail = json['Detail'];
    picture = json['Picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Name'] = this.name;
    data['Detail'] = this.detail;
    data['Picture'] = this.picture;
    return data;
  }
}

