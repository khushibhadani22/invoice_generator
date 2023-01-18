import 'package:flutter/material.dart';

import 'Global.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "CART",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('pdf');
                },
                icon: const Icon(Icons.picture_as_pdf))
          ],
          backgroundColor: Colors.blueGrey.shade900,
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: Global.finalCart
              .map((e) => Card(
                    elevation: 0,
                    child: SizedBox(
                        height: 150,
                        width: 350,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              ListTile(
                                leading: SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: Image.asset(
                                    "${e['image']}",
                                  ),
                                ),
                                title: Text("${e['price']}"),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  OutlinedButton(
                                      onPressed: () {
                                        setState(() {
                                          e['cart'] = false;
                                          if (e['cart'] == false) {
                                            Global.finalCart.remove(e);
                                            e['i']--;
                                          }
                                        });
                                      },
                                      child: const Text("Remove")),
                                  Container(
                                    height: 35,
                                    width: 120,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                          style: BorderStyle.solid,
                                          color: Colors.grey.withOpacity(1),
                                        )),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              e['remove'] = true;
                                              if (e['remove'] == true) {
                                                e['i']--;
                                                Global.totalBill -= e['price'];
                                                if (e['i'] <= 0) {
                                                  e['i'] = 0;
                                                }
                                                if (e['i'] == 0) {
                                                  Global.finalCart.remove(e);
                                                }
                                              }
                                            });
                                          },
                                          icon: const Icon(Icons.remove),
                                        )),
                                        Expanded(
                                            child: Align(
                                          alignment: Alignment.center,
                                          child: Text("${e['i']}"),
                                        )),
                                        Expanded(
                                            child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              e['add'] = true;
                                              if (e['add'] == true) {
                                                e['i']++;
                                                Global.totalBill =
                                                    Global.totalBill +
                                                        e['price'];
                                              }
                                            });
                                          },
                                          icon: const Icon(Icons.add),
                                        ))
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )),
                  ))
              .toList(),
        ));
  }
}
