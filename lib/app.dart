import 'package:flutter/material.dart';
import 'package:student/m/addingg.dart';
import 'package:student/model/addingModel.dart';
import 'package:student/sharedPref.dart';
import 'package:student/update.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Abc(),
    );
  }
}

class Abc extends StatefulWidget {
  const Abc({
    Key? key,
  }) : super(key: key);

  @override
  _AbcState createState() => _AbcState();
}

class _AbcState extends State<Abc> {
  late Future<List<String>> fut;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // var fut;
    fut = getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 10,
        title: Text('student list'),
        centerTitle: true,
      ),
      floatingActionButton: FutureBuilder<List<String>>(
          future: fut,
          builder: (context, snapshot) {
            if (snapshot.hasData)
              return FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => Addingg(
                                profiles: snapshot.data!,
                              )));
                },
                child: Icon(Icons.add),
                color: Colors.red,
                shape: CircleBorder(),
                padding: EdgeInsets.all(10),
              );
            else
              return CircularProgressIndicator();
          }),
      body: FutureBuilder<List<String>>(
          future: fut,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print("Data vanne");
              print("${snapshot.data.toString()}");

              return ListView.builder(
                  itemCount:
                      snapshot.data!.length > 1 ? snapshot.data!.length - 1 : 0,
                  itemBuilder: (_, index) {
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => AddinggUpdate(
                                      id: snapshot.data![index],
                                    )));
                        // profiles
                      },
                      title: Text(snapshot.data![index + 1]),
                    );
                  });
            } else
              return Center(
                child: CircularProgressIndicator(),
              );
          }),
    );
  }
}
