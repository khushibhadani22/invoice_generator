import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Global.dart';

class Edit extends StatefulWidget {
  const Edit({Key? key}) : super(key: key);

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  GlobalKey<FormState> pageKey = GlobalKey<FormState>();

  TextEditingController fController = TextEditingController();
  TextEditingController dController = TextEditingController();
  TextEditingController pController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  XFile? image;
  File? photo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Profile",
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 100,
              width: 10,
            ),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.grey,
                  backgroundImage: (photo == null) ? null : FileImage(photo!),
                ),
                FloatingActionButton(
                  mini: true,
                  onPressed: () async {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: const Text("Choose Image"),
                            actions: [
                              ElevatedButton(
                                  onPressed: () async {
                                    image = await _picker.pickImage(
                                        source: ImageSource.camera);
                                    setState(() {
                                      photo = File(image!.path);
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  child: const Icon(Icons.camera_alt)),
                              ElevatedButton(
                                  onPressed: () async {
                                    image = await _picker.pickImage(
                                        source: ImageSource.gallery);
                                    setState(() {
                                      photo = File(image!.path);
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  child: const Icon(Icons.photo)),
                            ],
                          );
                        });
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
              width: 10,
            ),
            Text(
              Global.fName,
              style: TextStyle(
                  color: Colors.blueGrey.shade900,
                  fontWeight: FontWeight.bold,
                  fontSize: 13),
            ),
            const SizedBox(
              height: 10,
              width: 10,
            ),
            Text(
              Global.phone,
              style: TextStyle(color: Colors.blueGrey.shade900, fontSize: 10),
            ),
            const SizedBox(
              height: 20,
              width: 10,
            ),
            Form(
              key: pageKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.person,
                        size: 30,
                        color: Colors.blueGrey.shade900,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: 330,
                        child: TextFormField(
                          controller: fController,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter Name....";
                            }
                            return null;
                          },
                          onSaved: (val) {
                            setState(() {
                              Global.fName = val!;
                            });
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder()),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.call,
                        size: 30,
                        color: Colors.blueGrey.shade900,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: 330,
                        child: TextFormField(
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter Number....";
                            }
                            return null;
                          },
                          onSaved: (val) {
                            setState(() {
                              Global.phone = val!;
                            });
                          },
                          controller: pController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder()),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.cake,
                        size: 30,
                        color: Colors.blueGrey.shade900,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: 330,
                        child: TextFormField(
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter BOD....";
                            }
                            return null;
                          },
                          onSaved: (val) {
                            setState(() {
                              Global.bDate = val!;
                            });
                          },
                          controller: dController,
                          keyboardType: TextInputType.datetime,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder()),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 210,
              width: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 150),
                  backgroundColor: Colors.blueGrey.shade900,
                ),
                onPressed: () {
                  setState(() {
                    if (pageKey.currentState!.validate()) {
                      pageKey.currentState!.save();
                    }
                    Global.pic = photo;
                  });
                  Navigator.of(context).pushReplacementNamed('home');
                },
                child: const Text(
                  "SAVE",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
