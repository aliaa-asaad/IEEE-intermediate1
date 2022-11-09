import 'package:flutter/material.dart';
import 'package:intermediate1/models/db_helper.dart';
import '../models/details.dart';
import 'home/widgets/recipe.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<Details> favList = [];
  bool fav = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Favorite',
            style: TextStyle(color: Color(0xff02947D), fontSize: 30),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: Icon(Icons.menu, color: Color(0xff02947D)),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 7),
              child: Icon(Icons.search, color: Color(0xff02947D)),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: Center(
            child: Container(
                child: FutureBuilder<List<Details>>(
          future: DBHelper.instance.getAllFav(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  itemBuilder: (context, index) => RecipesCard(
                      snapshot.data![index].title,
                      snapshot.data![index].id,
                      snapshot.data![index].image),
                  itemCount: snapshot.data!.length,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      crossAxisSpacing: 20,
                      childAspectRatio: 3 / 3,
                      mainAxisSpacing: 20),
                ),
              );
            }
            if (snapshot.hasError) {
              return Container(
                child: Text(snapshot.error!.toString()),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ))));
  }
}
