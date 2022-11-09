import 'package:intermediate1/models/ingredients.dart';
import 'package:intermediate1/models/instructions.dart';

class Details {
  int? id;
  String? title;
  String? image;
  List<Ingredients>? extendedIngredients;
  List<Instructions>? analyzedInstructions;
  int? readyInMinutes;
  bool? isFav;

  Details({
    this.id,
    this.title,
    this.image,
    this.isFav = false,
    this.extendedIngredients,
    this.analyzedInstructions,
    this.readyInMinutes,
  });

  Details.fromMap(Map<String, dynamic> map) {
    analyzedInstructions = [];
    ((map['analyzedInstructions']) as List<dynamic>?)?.forEach((element) {
      analyzedInstructions!.add(Instructions.fromMap(element));
    });
    extendedIngredients = [];
    ((map['extendedIngredients']) as List<dynamic>?)?.forEach((element) {
      print('2');
      extendedIngredients!.add(Ingredients.fromMap(element));
      print('3');
    });
    this.isFav = map['isFav'];
    this.id = map['id'];
    this.title = map['title'];
    this.image = map['image'];
    this.readyInMinutes = map['readyInMinutes'];
  }

  Map<String, dynamic> toMap() {
    List<Map> ingredientsList = [];
    extendedIngredients!
        .forEach((element) => ingredientsList.add(element.toMap()));
    List<Map>? instructionsList = [];
    analyzedInstructions!
        .forEach((element) => instructionsList.add(element.toMap()));
    Map<String, dynamic> map = {
      'id': this.id,
      'title': this.title,
      'image': this.image,
      'isFav': this.isFav,
      'extendedIngredients': ingredientsList,
      'analyzedInstructions': instructionsList,
    };
    return map;
  }
}
