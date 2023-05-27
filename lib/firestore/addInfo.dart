

import 'package:cloud_firestore/cloud_firestore.dart';


import 'package:flutter/material.dart';
import 'package:yemek_app/firestore/usermodel.dart';

import 'homepage.dart';



class AddInfo extends StatefulWidget {
  const AddInfo({super.key});

  @override
  State<AddInfo> createState() => _AddInfoState();
}

class _AddInfoState extends State<AddInfo> {
  final TextEditingController rollController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController pointController = TextEditingController();
  //odaklanma işine yarar
  final FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memnuniyet'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            getMyField(
                focusNode: focusNode,
                hintText: 'Name',
                textInputType: TextInputType.number,
                controller: rollController),
            getMyField(hintText: 'Surname', controller: nameController),
            getMyField(
                hintText: 'Point',
                textInputType: TextInputType.number,
                controller: pointController),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox( width: 120,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0))
                      )
                    ),
                      onPressed: () {
                        //
                        UserInfo userInfo = UserInfo(
                         surName: rollController.text,
                          name: nameController.text,
                          marks: double.parse(pointController.text),
                        );

                        addUserandtoNavigate(userInfo, context);
                        //
                      },
                      child: const Text('Ekle')),
                ),
                SizedBox(width: 120,
                  child: ElevatedButton(

                      style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5.0))
                          ),
                          backgroundColor: Colors.deepOrange),
                      onPressed: () {
                        //
                        rollController.text = '';
                        nameController.text = '';
                        pointController.text = '';
                        focusNode.requestFocus();
                        //
                      },
                      child: const Text('Sil')),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget getMyField(
      {required String hintText,
        TextInputType textInputType = TextInputType.name,
        required TextEditingController controller,
        FocusNode? focusNode}) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        focusNode: focusNode,
        controller: controller,
        keyboardType: textInputType,
        decoration: InputDecoration(
            hintText: 'Enter $hintText',
            labelText: hintText,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)))),
      ),
    );
  }

  void addUserandtoNavigate(UserInfo info, BuildContext context) {


    final infoRef = FirebaseFirestore.instance.collection('userInfo').doc();
    info.id = infoRef.id;
    final data = info.toJson();
    infoRef.set(data).whenComplete(() {
      //



      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => FireStoreHomePage(),
        ),
            (route) => false,

      );

      //
    });

    //
  }
}