

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:yemek_app/firestore/usermodel.dart';

import 'homeview.dart';


class UpdateInfo extends StatelessWidget {
  final UserInfo userInfo;
  final TextEditingController rollController = TextEditingController();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController pointController = TextEditingController();

  final FocusNode focusNode = FocusNode();

  UpdateInfo({super.key, required this.userInfo});

  @override
  Widget build(BuildContext context) {
    rollController.text = '${userInfo.surName}';
    nameController.text = userInfo.name;
   pointController.text = '${userInfo.marks}';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bilgi Güncelle'),
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
            getMyField(hintText: 'SurName', controller: nameController),
            getMyField(
                hintText: 'point',
                textInputType: TextInputType.number,
               controller: pointController),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: 120,
                  child: ElevatedButton(
                      onPressed: () {
                        //

                        UserInfo updatedInfo = UserInfo(
                          id: userInfo.id,
                          surName: rollController.text,
                          name: nameController.text,
                         marks: double.parse(pointController.text),
                        );
                        //
                        final collectionReference =
                        FirebaseFirestore.instance.collection('userInfo');
                        collectionReference
                            .doc(updatedInfo.id)
                            .update(updatedInfo.toJson())
                            .whenComplete(() {

                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FireStoreHomePage(),
                              ));
                        });
                        //
                      },
                      child: const Text('Güncelle')),
                ),
                SizedBox(width: 120,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey),
                      onPressed: () {
                        //
                        rollController.text = '';
                        nameController.text = '';
                        pointController.text = '';
                        focusNode.requestFocus();
                        //
                      },
                      child: const Text('Sıfırla')),
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
}