import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:student/m/bottomSheet.dart';
import 'package:student/model/addingModel.dart';
import 'package:student/sharedPref.dart';

class AddinggUpdate extends StatefulWidget {
  // var profiles;

  String id;
  AddinggUpdate({required this.id});

  @override
  _AddinggUpdateState createState() => _AddinggUpdateState();
}

class _AddinggUpdateState extends State<AddinggUpdate> {
  late Future<String> profile;

  TextEditingController name = TextEditingController();

  TextEditingController mail = TextEditingController();

  TextEditingController phone = TextEditingController();

  TextEditingController address = TextEditingController();

  @override
  void initState() {
    //  asd= getPerson(widget.id);
    profile = getPerson(widget.id);

    getPerson(widget.id);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 10,
        title: Text('add details'),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder<String>(
            future: profile,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                AddingModel profiles = AddingModel.fromJson(
                    json.decode(snapshot.data!.toString()));
                name.text = profiles.name;
                mail.text = profiles.email;
                phone.text = profiles.phone;
                address.text = profiles.address;
                return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.white,
                    child: ListView(
                      children: <Widget>[
                        Center(
                          child: Stack(
                            children: [
                              CircleAvatar(
                                radius: 80.0,
                                backgroundImage: AssetImage('assets/c.jpg'),
                              ),
                              Positioned(
                                bottom: 20,
                                right: 20,
                                child: InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: ((builder) => Ca()),
                                    );
                                  },
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.teal,
                                    size: 28,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: TextField(
                            controller: name,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.lightBlue,
                                    width: 2,
                                  ),
                                ),
                                labelText: "Name",
                                labelStyle:
                                    TextStyle(color: Colors.red, fontSize: 20),
                                hintText: "Enter Name",
                                icon: Icon(
                                  Icons.account_box,
                                  color: Colors.lightBlue,
                                ),
                                suffixIcon: Icon(Icons.arrow_forward)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: TextField(
                            controller: mail,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blue,
                                    width: 2,
                                  ),
                                ),
                                labelText: "Email",
                                labelStyle:
                                    TextStyle(color: Colors.red, fontSize: 20),
                                hintText: "Enter Email",
                                icon: Icon(
                                  Icons.email,
                                  color: Colors.blue,
                                ),
                                suffixIcon: Icon(Icons.arrow_forward)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: TextField(
                            controller: phone,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.lightBlue,
                                    width: 2,
                                  ),
                                ),
                                labelText: "Phone",
                                labelStyle:
                                    TextStyle(color: Colors.red, fontSize: 20),
                                hintText: "Enter Phone",
                                icon: Icon(
                                  Icons.phone,
                                  color: Colors.blue,
                                ),
                                suffixIcon: Icon(Icons.arrow_forward)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: TextField(
                            controller: address,
                            keyboardType: TextInputType.text,
                            maxLines: 3,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.lightBlue,
                                    width: 2,
                                  ),
                                ),
                                labelText: "Address",
                                labelStyle:
                                    TextStyle(color: Colors.red, fontSize: 20),
                                hintText: "Enter pls",
                                icon: Icon(
                                  Icons.phone,
                                  color: Colors.blue,
                                ),
                                suffixIcon: Icon(Icons.arrow_forward)),
                          ),
                        ),
                        RaisedButton(
                          color: Colors.blue,
                          child: Text("save"),
                          textColor: Colors.white,
                          onPressed: () async {
                            AddingModel ad = AddingModel(
                                name: "${name.text}",
                                email: "${mail.text}",
                                phone: "${phone.text}",
                                address: "${address.text}");

                            await saveData("${name.text} + ${mail.text}", ad);
                            // profiles.add(mail.text);
                            // await update(profiles);

                            final snackBar =
                                SnackBar(content: Text('User Updated'));

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                        ),

                        // )
                      ],
                    ));
              } else {
                return CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}
