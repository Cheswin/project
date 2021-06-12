import 'package:flutter/material.dart';
import 'package:student/m/bottomSheet.dart';
import 'package:student/model/addingModel.dart';
import 'package:student/sharedPref.dart';

class Addingg extends StatelessWidget {
  // var profiles;

  List<String> profiles;
  Addingg({required this.profiles});
  TextEditingController name = TextEditingController();
  TextEditingController mail = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
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
        child: Container(
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
                      labelStyle: TextStyle(color: Colors.red, fontSize: 20),
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
                      labelStyle: TextStyle(color: Colors.red, fontSize: 20),
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
                      labelStyle: TextStyle(color: Colors.red, fontSize: 20),
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
                      labelStyle: TextStyle(color: Colors.red, fontSize: 20),
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

                  await saveData("${mail.text}", ad);
                  profiles.add(mail.text);
                  await saveList(profiles);

                  final snackBar = SnackBar(content: Text('User Added'));

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              ),
              // RaisedButton(
              //   color: Colors.blue,
              //   child: Text("save"),
              //   textColor: Colors.white,
              //   onPressed: () {
              //     AddingModel ad = AddingModel(
              //         name: "${name.text}",
              //         email: "${mail.text}",
              //         phone: "${phone.text}",
              //         address: "${address.text}");

              //     saveData("${name.text} + ${mail.text}", ad);
              //   },
              // )
            ],
          ),
        ),
      ),
    );
  }
}
