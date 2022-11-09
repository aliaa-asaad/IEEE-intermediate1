
import 'package:intermediate1/models/details.dart';

class Data {
  List<Details>? results;

  Data({this.results});

  Data.fromMap(Map<String, dynamic> map) {
    results = [];
    ((map['results']) as List<dynamic>).forEach((element) {
      results!.add(Details.fromMap(element));
    });
  }

  Map<String, dynamic> toMap() {
    List<Map> resultList = [];
    results!.forEach((element) => resultList.add(element.toMap()));
    Map<String, dynamic> map = {'results': resultList};

    return map;
  }
}
