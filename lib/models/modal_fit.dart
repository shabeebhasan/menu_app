import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menu_app/pages/new_category.dart';

class ModalFit extends StatelessWidget {
  const ModalFit({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
      top: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text('Add Category'),
            leading: Icon(Icons.category),
            onTap: () => _navigateToNextScreen(context),
          ),
          ListTile(
            title: Text('Add Item'),
            leading: Icon(Icons.ac_unit),
            onTap: () => _navigateToNextScreen(context),
          ),
        ],
      ),
    ));
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => AddCategory()));
  }
}
