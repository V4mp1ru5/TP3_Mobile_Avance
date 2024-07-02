import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tp3/transfert.dart';

import 'acceuil.dart';
import 'création.dart';
import 'generated/l10n.dart';
import 'main.dart';


class Consultation extends StatefulWidget {

  // l'objet a affiché, on le met final ce qui garantit une assignation
  final String id;


  const Consultation({Key? key, required this.id}) : super(key: key);

  @override
  State<Consultation> createState() => _ConsultationState();
}

class _ConsultationState extends State<Consultation> {

  @override
  void initState() {
    super.initState();
    getTask();
  }

  SpecialUlrichTask currentTask = SpecialUlrichTask();
  SpecialUlrichTask updatedTask = SpecialUlrichTask();
  int _currentSliderValue = 0;

  String imagePath = "";
  XFile? pickedImage;

  void getNetworkImage() async{
    imagePath = currentTask.imageUrl;
    setState(() {});
  }

  void getImage() async {
    ImagePicker picker = ImagePicker();
    pickedImage = await picker.pickImage(source: ImageSource.gallery);
    imagePath = pickedImage!.path;
    setState(() {});
  }

  void sendImage() async{
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(pickedImage!.path, filename: pickedImage!.name),
      "taskID": currentTask.id
    });
  }

  void getTask() async {
    try {
      DocumentSnapshot<SpecialUlrichTask> taskdoc = await getTasksCollection().doc(widget.id).get();
      SpecialUlrichTask t = taskdoc.data()!;
      t.percentageTimePassed = ((DateTime.now().millisecondsSinceEpoch - t.creationDate.millisecondsSinceEpoch)/(t.deadline.millisecondsSinceEpoch - t.creationDate.millisecondsSinceEpoch)) * 100;
      setState(() {
        currentTask = t;
        _currentSliderValue = t.percentageDone;

        if(currentTask.imageUrl != '') {
          getNetworkImage();
        }
      });
    }
    catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(S.of(context).error))
      );
    }
  }

  CollectionReference<SpecialUlrichTask> getTasksCollection() {
    return FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('Tasks')
        .withConverter<SpecialUlrichTask>(
        fromFirestore: (doc,_) => SpecialUlrichTask.fromJson(doc.data()!),
        toFirestore: (task, _) => task.toJson()
    );
  }

  void TaskUpdate(int value) async {
    try {
      updatedTask = currentTask;
      updatedTask.percentageDone = value;
      if(imagePath != "" && !imagePath.startsWith("http")){
        File file = File(imagePath);
        await FirebaseStorage.instance.ref('${widget.id}.jpg').putFile(file);
        String imageURL = await FirebaseStorage.instance.ref('${widget.id}.jpg').getDownloadURL();

        updatedTask.imageUrl = imageURL;
      }
      getTasksCollection().doc(widget.id).set(updatedTask);
      Navigator.popUntil(context, (route) => false);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Acceuil(
            name: 'idk anymore',
            id: 2,
          ),
        ),
      );
    }
    catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(S.of(context).error))
      );
    }
  }

  void updateTask(int value){
    TaskUpdate(value);
  }

  @override
  Widget build(BuildContext context) {
    String username = FirebaseAuth.instance.currentUser!=null?FirebaseAuth.instance.currentUser!.email!:"";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(S.of(context).consultation),
      ),
      // TODO widget. donne accès aux paramètres du widget
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Center(
          child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SizedBox(
              child: Text('${S.of(context).tName} ${currentTask.name}', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
            ),
            SizedBox(
              child: Text('${S.of(context).deadline} ${currentTask.deadline}', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
            ),
            SizedBox(
              child: Text('${S.of(context).tPassed} ${(currentTask.percentageTimePassed).toStringAsFixed(2)}', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
            ),
            SizedBox(
              child: Text('${S.of(context).pDone} ${currentTask.percentageDone}', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
            ),
            Slider(
              value: _currentSliderValue.toDouble(),
              max: 100,
              divisions: 100,
              label: _currentSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value.toInt();
                });
              },
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Builder(
                    builder: (context) {
                      if (imagePath=="") {
                        //
                        return Column(
                          children: [
                            Text(S.of(context).slectionnerUneImage),
                          ],
                        );
                      } else if(imagePath.startsWith("http")){
                        return Image.network(imagePath, width: 200,);
                      }
                      return Image.file(File(imagePath), width: 200);
                    },
                  ),
                  Column(
                    children: [
                      ElevatedButton(onPressed: getImage, child: (imagePath=="")?Text(S.of(context).ajouterUneImage):Text(S.of(context).modifierLimage)),
                    ],
                  ),
                ],
              ),
            ),
            OutlinedButton(
              onPressed: () { updateTask(_currentSliderValue); },
              child: Text(S.of(context).update),
            ),
          ],
              ),
        ),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.deepPurpleAccent,
              ),
              child: Text(username, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),),
            ),
            ListTile(
              title: Text(S.of(context).welcome),
              onTap: () {
                Navigator.popUntil(context, (route) => false);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Acceuil(name: 'name', id: 2),
                  ),
                );
              },
            ),
            ListTile(
              title: Text(S.of(context).addTask),
              onTap: () {
                Navigator.popUntil(context, (route) => false);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Creation(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text(S.of(context).disconnect),

              onTap: () async {
                await GoogleSignIn().signOut();
                await FirebaseAuth.instance.signOut();
                setState(() {});
                SingletonNom.setUsername("null");
                Navigator.popUntil(context, (route) => false);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyHomePage(title: 'nono'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
