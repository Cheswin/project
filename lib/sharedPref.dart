import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:student/model/addingModel.dart';

Future<String> getPerson(String id) async {
  var prefs = await SharedPreferences.getInstance();
  return json.decode(prefs.getString(id) ?? "false");
}

Future<List<String>> getList() async {
  var prefs = await SharedPreferences.getInstance();
  return prefs.getStringList("id") ?? ["false"];
}

saveList(List<String> listOfPPl) async {
  print("\n\n\n\n");
  print(listOfPPl);
  var prefs = await SharedPreferences.getInstance();
  return prefs.setStringList("id", listOfPPl);
}

saveData(String id, AddingModel ad) {
  SharedPreferences.getInstance().then((sharedPref) {
    // sharedPref.setBool('isLoggedIn', true);
    // json.encode(ad.toJson())
    sharedPref.setString(id, json.encode(ad.toJson()));

    print(" \n\n\n\n\n\n\n\n }");
  });
}

updateData(String id, AddingModel ad) {
  SharedPreferences.getInstance().then((sharedPref) {
    // sharedPref.setBool('isLoggedIn', true);
    sharedPref.setString(id, ad.toJson().toString());

    print(" \n\n\n\n\n\n\n\n }");
  });
}

clearLoginState() {
  SharedPreferences.getInstance().then((sharedPref) {
    sharedPref.clear();
  });
}

// Future<void> _incrementCounter() async {
//   final SharedPreferences prefs = await _prefs;
//   final int counter = (prefs.getInt('counter') ?? 0) + 1;

//   setState(() {
//     _counter = prefs.setInt("counter", counter).then((bool success) {
//       return counter;
//     });
//   });
// }

// @override
// void initState() {
//   super.initState();
//   _counter = _prefs.then((SharedPreferences prefs) {
//     return (prefs.getInt('counter') ?? 0);
//   });
// }
