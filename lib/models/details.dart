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
    print('a');
    analyzedInstructions = [];
    print('b');
    ((map['analyzedInstructions']) as List<dynamic>).forEach((element) {
      print('c');
      analyzedInstructions!.add(Instructions.fromMap(element));
      print('d');
    });
    /* extendedIngredients = [];*/
    print('1');
    /* ((map['extendedIngredients']) as String).forEach((element) {
      print('2');
      extendedIngredients!.add(Ingredients.fromMap(element));
      print('3');
    });*/
    this.id = map['id'];
    print('2');
    this.title = map['title'];
    print('3');
    this.image = map['image'];
    print('4');
    this.readyInMinutes = map['readyInMinutes'];
    print('5');
  }

  Map<String, dynamic> toMap() {
    /*List<Map> ingredientsList = [];
    extendedIngredients!.forEach((element) => ingredientsList.add(element.toMap()));*/
    print('6');
    List<Map> instructionsList = [];
    print('7');
    analyzedInstructions!
        .forEach((element) => instructionsList.add(element.toMap()));
    print('8');
    Map<String, dynamic> map = {
      'id': this.id,
      'title': this.title,
      'image': this.image,
      /*  'extendedIngredients':ingredientsList,*/
      'analyzedInstructions': instructionsList,
    };
    print('9');
    return map;
  }
}
