import 'package:flutter/material.dart';
import 'package:intermediate1/models/db_helper.dart';
import '../models/details.dart';
import '../network/api.dart';
import '../models/favorite.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool fav = false;

  @override
  Widget build(BuildContext context) {
    final mealId =
        ModalRoute.of(context)!.settings.arguments as Map<String, int?>;
    return FutureBuilder<Details>(
      future: API().getDetails(mealId['id'].toString()),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              centerTitle: true,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Color(0xff02947D)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              actions: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () {
                            if (fav == true) {
                              DBHelper.instance.insertFav(Favorite(
                                  id: snapshot.data!.id,
                                  name: snapshot.data!.title,
                                  image: snapshot.data!.image,
                                  isFav: true));
                            }
                            else{
                              DBHelper.instance.deleteTodo(snapshot.data!.id!);
                            }
                            setState(() {
                              fav = !fav;
                            });
                          },
                          icon: fav == false
                              ? Icon(
                                  Icons.favorite_border,
                                  color: Colors.red,
                                )
                              : Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )),
                      Icon(
                        Icons.play_arrow_outlined,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.shopping_cart,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.share,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ]),
              ],
            ),
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Column(
                children: [
                  //image
                  Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(snapshot.data!.image!),
                    )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //-------------------------------------
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data!.title!,
                            style: TextStyle(
                                color: Color(0xff02947D),
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          //icons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.schedule,
                                    size: 40,
                                    color: Color(0xff02947D),
                                  ),
                                  Text(
                                    '${snapshot.data!.readyInMinutes} min',
                                    style: TextStyle(fontSize: 15),
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          //-------------------------------------

                          //cards
                          /*  CustomCard(
                              list: snapshot.data!.extendedIngredients!, text: 'Integrations'),*/
                          Text(
                            'Steps',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 26,
                              color: Color(0xff02947D),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.separated(
                              separatorBuilder: (ctx, index) => SizedBox(
                                height: 2,
                              ),
                              itemCount:
                                  snapshot.data!.analyzedInstructions!.length,
                              itemBuilder: (ctx, index) => Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text(
                                  '${snapshot.data!.analyzedInstructions![index].steps![index].step}',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                              ),
                            ),
                          ),

                          //-------------------------------------
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        if (snapshot.hasError) {
          print(snapshot.error!);
          return Scaffold(
            body: Center(
              child: Container(
                child: Text(snapshot.error!.toString()),
              ),
            ),
          );
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
