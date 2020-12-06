class ICModel {
  int id;
  int userId;
  String title;
  String body;

  ICModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    userId = json['userId'];
    title = json['title'];
    body = json['body'];
  }

  static List<ICModel> listFromJson(List<dynamic> json) {
    return json == null
        ? List<ICModel>()
        : json.map((value) => ICModel.fromJson(value)).toList();
  }
}
