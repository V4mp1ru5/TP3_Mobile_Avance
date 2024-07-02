import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tp1_mobile_avance/lib_http.dart';
import 'package:tp1_mobile_avance/transfert.dart';
import 'package:image_picker/image_picker.dart';

import 'acceuil.dart';
import 'connexion.dart';
import 'création.dart';
import 'generated/l10n.dart';


class Consultation extends StatefulWidget {

  // l'objet a affiché, on le met final ce qui garantit une assignation
  final int id;


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

  TaskDetailPhotoResponse currentTask = TaskDetailPhotoResponse();
  int _currentSliderValue = 0;

  String imagePath = "";
  XFile? pickedImage;

  void getNetworkImage(int? id) async{
    imagePath = "http://10.0.2.2:8080/file/${currentTask.photoId}";
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

    Dio dio = Dio();
    await dio.post("http://10.0.2.2:8080/file", data: formData);
  }

  void getTask() async {
    try {
      var response = await task(widget.id);
      setState(() {
        currentTask = response;
        _currentSliderValue = response.percentageDone;
        if(currentTask.photoId != 0) {
          getNetworkImage(currentTask.photoId);
        }
      });
      print(response);
    }
    catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(S.of(context).error))
      );
    }
  }

  void getTaskUpdate(int value) async {
    try {
      await taskUpdate(widget.id, value);
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
    getTaskUpdate(value);
    if(imagePath != "" && !imagePath.startsWith("http")){
      sendImage();
    }
  }

  void postSignout() async {
    try {
      await signout();
    }
    catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(S.of(context).error))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
              child: Text('${S.of(context).tPassed} ${currentTask.percentageTimeSpent}', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
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
                      } else if(imagePath.startsWith("http://10.0.2.2:8080/file")){
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
              child: Text(SingletonNom.getUsername(), textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 35),),
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

              onTap: () {
                postSignout();
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
