import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tp3/transfert.dart';

import 'consultation.dart';
import 'création.dart';
import 'generated/l10n.dart';
import 'main.dart';


class Acceuil extends StatefulWidget {

  // l'objet a affiché, on le met final ce qui garantit une assignation
  final String name;
  final int id;


  const Acceuil({Key? key, required this.name, required this.id}) : super(key: key);

  @override
  State<Acceuil> createState() => _AcceuilState();
}

class _AcceuilState extends State<Acceuil> {

  @override
  void initState() {
    super.initState();
    getTasks();
  }

  List<SpecialUlrichTask> tasks = [];

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

  void getTasks() async {
    QuerySnapshot<SpecialUlrichTask> tasksdocs = await getTasksCollection().get();
    List<SpecialUlrichTask> currentTasks = tasksdocs.docs.map(
            (doc) {
          SpecialUlrichTask t = doc.data();
          t.id = doc.id;
          t.percentageTimePassed = ((DateTime.now().millisecondsSinceEpoch - t.creationDate.millisecondsSinceEpoch)/(t.deadline.millisecondsSinceEpoch - t.creationDate.millisecondsSinceEpoch)) * 100;
          return t;
        }
    ).toList();
    setState(() {
      tasks = currentTasks;
    });
  }



  @override
  Widget build(BuildContext context) {

    String username = FirebaseAuth.instance.currentUser!=null?FirebaseAuth.instance.currentUser!.email!:"";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(S.of(context).welcome),
      ),
      body: Center(
        child: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: tasks.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Consultation(
                      id: tasks[index].id,
                    ),
                  ),
                );

              },
              title: Text('${S.of(context).tName} ${tasks[index].name}\n${S.of(context).pDone} ${tasks[index].percentageDone}\n${S.of(context).tPassed} ${(tasks[index].percentageTimePassed).toStringAsFixed(2)}%\n${S.of(context).deadline} ${tasks[index].deadline}', style: const TextStyle(fontWeight: FontWeight.w700)),
              leading: CachedNetworkImage(
                imageUrl: tasks[index].imageUrl,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.supervised_user_circle),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Creation(),
          ),
        );
      },
      label: Text(S.of(context).add),
      icon: const Icon(Icons.add),
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
                Navigator.pop(context);
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
