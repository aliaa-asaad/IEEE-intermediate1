class Ingredients {
  List<Names>? name;

  Ingredients({this.name});

  Ingredients.fromMap(Map<String, dynamic> map) {
    name = [];
    ((map['name']) as List<dynamic>).forEach((element) {
      name!.add(Names.fromMap(element));
    });
  }

  Map<String, dynamic> toMap() {
    List<Map> nameList = [];
    name!.forEach((element) => nameList.add(element.toMap()));
    Map<String, dynamic> map = {'name': nameList};

    return map;
  }
}

class Names {
  String? original;

  Names({this.original});

  Names.fromMap(Map<String, dynamic> map) {
    this.original = map['original'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'original': this.original,
    };
    return map;
  }
}
