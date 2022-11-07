class Favorite {
  int? id;
  String? name;
  bool? isFav;
  String? image;

  Favorite({this.id, this.name, this.image, this.isFav});

  Favorite.fromMap(Map<String, dynamic> map) {
    if (map['id'] != null) this.id = map['id'];
    this.name = map['name'];
    this.isFav = map['isFav'] == 0 ? false : true;
    this.image = map[' image'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map;
    return map = {
      if (this.id != null) 'id': this.id,
      'name': this.name,
      'image': this.image,
      ' image': this.image,
      'isFav': this.isFav == true ? 1 : 0,
    };
  }
}
