import 'package:flutter/material.dart';

import 'Global.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> data = ModalRoute.of(context)!.settings.arguments as List;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Text("Women"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('cart');
            },
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
          ),
        ],
        backgroundColor: Colors.blueGrey,
      ),
      body: GridView.builder(
        physics: const BouncingScrollPhysics(),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: data.length,
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: () {},
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.blueGrey,
                  child: Column(
                    children: [
                      Image.asset(
                        "${data[i]['image']}",
                        height: 100,
                        width: 100,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "${data[i]['price']}",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  data[i]['cart'] = true;
                                  if (data[i]['cart'] == true) {
                                    Global.cart.add(data[i]);
                                    data[i]['i']++;
                                  }
                                  Global.finalCart = Global.cart.toList();
                                  Global.totalBill += data[i]['price'];
                                });
                              },
                              icon: (data[i]['cart'] == false)
                                  ? const Icon(
                                      Icons.shopping_cart_outlined,
                                      color: Colors.white,
                                    )
                                  : const Icon(
                                      Icons.shopping_cart,
                                      color: Colors.white,
                                    )),
                        ],
                      ),
                    ],
                  ),
                )),
          );
        },
      ),
    );
  }
}
