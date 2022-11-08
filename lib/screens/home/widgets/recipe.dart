import 'package:flutter/material.dart';
import 'package:intermediate1/widgets/image.dart';

class RecipesCard extends StatelessWidget {
  final String? title;
  final int? id;
  final String? image;

  RecipesCard(this.title, this.id, this.image);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('details', arguments: {'id': id});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).colorScheme.primary,
      onTap: () => selectCategory(context),
      child: Stack(children: [
        //---------------------image-------------------------
        ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15)),
          child: Photo(image: image!),
        ),
        //----------------------------------------------
        //---------------------title-------------------------
        Container(
          alignment: Alignment.bottomLeft,
          child: Text(
            title!,
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.black.withOpacity(0),
              Colors.black.withOpacity(0.3),
              Colors.black
              /*Color(0xff9679B1).withOpacity(1),*/
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        //----------------------------------------------
      ]),
    );
  }
}
