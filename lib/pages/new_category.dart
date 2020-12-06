import 'package:flutter/material.dart';
import 'package:menu_app/reducers/actions.dart';
import 'package:menu_app/reducers/store.dart';

class AddCategory extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<AddCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ADD CATEGORY')),
      body: SingleChildScrollView(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new ListTile(
              leading: const Icon(Icons.category),
              title: new TextField(
                decoration: new InputDecoration(
                  hintText: "Name",
                ),
              ),
            ),
            new ListTile(
              leading: const Icon(Icons.description),
              title: new TextField(
                decoration: new InputDecoration(
                  hintText: "Description",
                ),
              ),
            ),
            new Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    /*...*/
                    _onFetchPostsPressed();
                  },
                  child: Text(
                    "Save",
                  ),
                )),
          ],
        ),
      ),
    );
  }

  void _onFetchPostsPressed() {
    Redux.store.dispatch(fetchPostsAction);
  }
}
