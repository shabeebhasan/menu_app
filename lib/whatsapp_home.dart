import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:menu_app/pages/chat_screen.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'models/modal_fit.dart';

class WhatsAppHome extends StatefulWidget {
  final List<CameraDescription> cameras;
  WhatsAppHome({this.cameras});

  @override
  _WhatsAppHomeState createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  bool showFab = true;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(vsync: this, initialIndex: 1, length: 3);
    _tabController.addListener(() {
      showFab = true;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu Gen"),
        elevation: 0.7,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            Tab(text: "CHATS"),
            Tab(
              text: "STATUS",
            ),
            Tab(
              text: "CALLS",
            ),
          ],
        ),
        actions: <Widget>[
          Icon(Icons.search),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
          ),
          Icon(Icons.more_vert)
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          ChatScreen(),
          ChatScreen(),
          ChatScreen(),
        ],
      ),
      floatingActionButton: showFab
          ? FloatingActionButton(
              backgroundColor: Theme.of(context).accentColor,
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () => {
                showMaterialModalBottomSheet(
                  expand: false,
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (context) => ModalFit(),
                )
              },
            )
          : null,
    );
  }
}
