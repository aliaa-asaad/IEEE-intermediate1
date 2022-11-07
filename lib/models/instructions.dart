class Instructions {
  List<Steps>? steps;

  Instructions({this.steps});

  Instructions.fromMap(Map<String, dynamic> map) {
    steps = [];
    ((map['steps']) as List<dynamic>).forEach((element) {
      print(element.runtimeType);
      steps!.add(Steps.fromMap(element));
    });
  }

  Map<String, dynamic> toMap() {
    List<Map> stepList = [];
    steps!.forEach((element) => stepList.add(element.toMap()));
    Map<String, dynamic> map = {'steps': stepList};

    return map;
  }
}

class Steps {
  int? number;
  String? step;

  Steps({this.number, this.step});

  Steps.fromMap(Map<String, dynamic> map) {
    this.step = map['step'];
    this.number = map['number'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'number': this.number,
      'step': this.step,
    };
    return map;
  }
}
