import 'package:flutter/material.dart';
import 'package:intermediate1/screens/home/widgets/recipe.dart';
import '../../models/data.dart';
import '../../network/api.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Recipes',
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
                child: FutureBuilder<Data>(
          future: API().getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  itemBuilder: (context, index) => RecipesCard(
                      snapshot.data!.results![index].title,
                      snapshot.data!.results![index].id,
                      snapshot.data!.results![index].image),
                  itemCount: snapshot.data!.results!.length,
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
