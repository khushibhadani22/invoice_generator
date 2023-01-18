import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool pick = false;
  bool dark = false;
  bool switchVal = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              leading: const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
              ),
              title: const Text(
                "Khushi Bhadani",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
              subtitle: const Text(
                "9662914392",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              ),
              trailing: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('edit');
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            AppBar(
              toolbarHeight: 35,
              leading: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Switch(
                  onChanged: (val) {
                    switchVal == true;
                  },
                  value: switchVal,
                ),
              ),
              title: const Text(
                "Kids Zone",
                style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.white24,
            ),
            ListTile(
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.download,
                  color: Colors.grey,
                  size: 29,
                ),
              ),
              title: const Text(
                "Download",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
              subtitle: const Text(
                "See Offline",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.language,
                  color: Colors.grey,
                  size: 29,
                ),
              ),
              title: const Text(
                "App Language",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            ),
            ListTile(
              leading: IconButton(
                  onPressed: () {},
                  icon: (dark == false)
                      ? const Icon(
                          Icons.dark_mode_outlined,
                          color: Colors.grey,
                          size: 27,
                        )
                      : IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.dark_mode_rounded,
                            color: Colors.grey,
                            size: 27,
                          ))),
              title: const Text(
                "Dark Theme",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            ),
            ListTile(
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.network_wifi_sharp,
                  color: Colors.grey,
                  size: 29,
                ),
              ),
              title: const Text(
                "Network System",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            ),
            Container(
              height: 1,
              width: 290,
              color: Colors.white24,
            ),
            ListTile(
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.settings,
                  color: Colors.grey,
                  size: 29,
                ),
              ),
              title: const Text(
                "Setting",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
              subtitle: const Text(
                "Preferences",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.help,
                  color: Colors.grey,
                  size: 29,
                ),
              ),
              title: const Text(
                "Help",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            ),
            Container(
              height: 1,
              width: 290,
              color: Colors.white24,
            ),
            const ListTile(
              title: Text(
                "Privacy Policy   -    T&C",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 13),
              ),
            ),
            const ListTile(
              title: Text(
                "v12.4.9.1182",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 13),
              ),
            ),
            const SizedBox(
              height: 180,
              width: 10,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text(
          "SHOP NOW",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
              ))
        ],
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade400,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              const CircleAvatar(
                radius: 150,
                backgroundImage: AssetImage('assets/images/bg.jpg'),
              ),
              const SizedBox(
                height: 80,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('edit1');
                },
                child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey.shade900,
                      borderRadius: BorderRadius.circular(25)),
                  child: const Center(
                    child: Text(
                      "Logging Your Account",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('edit');
                },
                child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)),
                  child: Center(
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                          color: Colors.blueGrey.shade900,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 150,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('home');
                },
                child: const Text(
                  "Skip",
                  style: TextStyle(color: Colors.white, fontSize: 13),
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.blueGrey.shade400,
    );
  }
}
