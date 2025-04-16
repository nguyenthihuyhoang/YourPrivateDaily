import 'package:flutter/material.dart';
import 'package:private_app/consts/image_app.dart';
import 'package:private_app/pages/add_post/edit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var listData = ['a', 'b', 'c'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Positioned.fill(child: Image.asset(ImageApp.imageBackground)),
            ListView.builder(
              itemCount: listData.length,
              itemBuilder: (context, index) {
                return Container(child: Text('${listData[index]}'));
              },
            ),
            Positioned(
              bottom: 25,

              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  spacing: 80,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.calendar_month),
                    FloatingActionButton(
                      child: Icon(Icons.add),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Editor()),
                        );
                      },
                    ),
                    Icon(Icons.logout),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
