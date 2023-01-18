import 'package:flutter/material.dart';

import 'Global.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isFavorite = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Drawer(),
        appBar: AppBar(
          title: const Text(
            "WOMEN",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          actions: const [
            Icon(Icons.favorite_border),
            SizedBox(
              width: 20,
            ),
            Icon(Icons.search),
          ],
          backgroundColor: Colors.blueGrey,
        ),
        body: Container(
          alignment: Alignment.center,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: Global.item
                .map((e) => Padding(
                      padding: const EdgeInsets.all(5),
                      child: ListTile(
                        leading: SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.asset(e['image']),
                        ),
                        title: Text(
                          e['name'],
                          style: const TextStyle(color: Colors.white),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed('details', arguments: e['itemList']);
                        },
                        tileColor: Colors.blueGrey,
                      ),
                    ))
                .toList(),
          ),
        ));
  }
}
