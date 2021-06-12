import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:path_provider/path_provider.dart';

class Ca extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          children: <Widget>[
            Text(
              "choose Profile Pic",
              style: TextStyle(fontSize: 20),
            ),
            Row(children: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.camera),
                onPressed: () {},
                label: Text('camera'),
              ),
              FlatButton.icon(
                icon: Icon(Icons.image),
                onPressed: () {},
                label: Text('Gallery'),
              ),
            ]),
          ],
        ),
      ),
    ));
  }
}
