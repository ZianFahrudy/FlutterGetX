import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key, required this.widget}) : super(key: key);

  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 40,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.network(
                    "https://randomuser.me/api/portraits/med/men/70.jpg",
                  ),
                ),
              ),
              title: Text("Zian Fahrudy"),
              subtitle: Text("zianfahrudy@gmail.com"),
            ),
            Divider(),
            widget,
          ],
        ),
      ),
    );
  }
}
