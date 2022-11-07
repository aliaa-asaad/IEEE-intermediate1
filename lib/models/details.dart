import 'package:intermediate1/models/ingredients.dart';
import 'package:intermediate1/models/instructions.dart';

class Details {
  int? id;
  String? title;
  String? image;

  /* List<Ingredients>? extendedIngredients;*/
  List<Instructions>? analyzedInstructions;
  int? readyInMinutes;

  Details({
    this.id,
    this.title,
    this.image,
    /*  this.extendedIngredients,*/
    this.analyzedInstructions,
    this.readyInMinutes,
  });

  Details.fromMap(Map<String, dynamic> map) {
    analyzedInstructions = [];
    ((map['analyzedInstructions']) as List<dynamic>).forEach((element) {
      analyzedInstructions!.add(Instructions.fromMap(element));
    });
    /* extendedIngredients = [];*/
    print('1');
    /* ((map['extendedIngredients']) as String).forEach((element) {
      print('2');
      extendedIngredients!.add(Ingredients.fromMap(element));
      print('3');
    });*/
    this.id = map['id'];
    this.title = map['title'];
    this.image = map['image'];
    this.readyInMinutes = map['readyInMinutes'];

  }

  Map<String, dynamic> toMap() {
    /*List<Map> ingredientsList = [];
    extendedIngredients!.forEach((element) => ingredientsList.add(element.toMap()));*/
    print('6');
    List<Map> instructionsList = [];
    analyzedInstructions!
        .forEach((element) => instructionsList.add(element.toMap()));
    Map<String, dynamic> map = {
      'id': this.id,
      'title': this.title,
      'image': this.image,
      /*  'extendedIngredients':ingredientsList,*/
      'analyzedInstructions': instructionsList,
    };
    return map;
  }
}
