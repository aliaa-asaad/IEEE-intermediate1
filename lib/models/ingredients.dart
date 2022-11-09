class Ingredients {
  String? original;

  Ingredients({this.original});

  Ingredients.fromMap(Map<String, dynamic> map) {
    this.original = map['original'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {'original': this.original};

    return map;
  }
}
