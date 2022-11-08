class Results {
  int? id;
  String? title;
  String? image;
  bool? isFav;

  Results({this.id, this.title, this.image, this.isFav = false});

  Results.fromMap(Map<String, dynamic> map) {
    if (map['id'] != null) this.id = map['id'];
    this.title = map['title'];
    this.image = map['image'];
    this.isFav = map['isFav'] == 0 ? false : true;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      if (this.id != null) 'id': this.id,
      'title': this.title,
      'image': this.image,
      'isFav': this.isFav == true ? 1 : 0,
    };
    return map;
  }
}
