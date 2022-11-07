class Results {
  int? id;
  String? title;
  String? image;

  Results(
    this.id,
    this.title,
    this.image,
  );

  Results.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.title = map['title'];
    this.image = map['image'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': this.id,
      'title': this.title,
      'image': this.image,
    };
    return map;
  }
}
