import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tp3/transfert.dart';
import 'acceuil.dart';
import 'main.dart';
import 'generated/l10n.dart';

void main() {
  runApp(const Creation());
}

class Creation extends StatelessWidget {
  const Creation({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CreationPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class CreationPage extends StatefulWidget {
  const CreationPage({super.key, required this.title});


  final String title;

  @override
  State<CreationPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CreationPage> {
  final myControllerName = TextEditingController();

  DateTime deadlinePicked = DateTime.now();

  Future<bool> verifyName(String name) async {
    QuerySnapshot<SpecialUlrichTask> tasksdocs = await getTasksCollection().get();
    List<SpecialUlrichTask> currentTasks = tasksdocs.docs.map(
            (doc) {
          SpecialUlrichTask t = doc.data();
          t.id = doc.id;
          t.percentageTimePassed = ((DateTime.now().millisecondsSinceEpoch - t.creationDate.millisecondsSinceEpoch)/(t.deadline.millisecondsSinceEpoch - t.creationDate.millisecondsSinceEpoch)) * 100;
          return t;
        }
    ).toList();
    List<String> taskNames = currentTasks.map((task) => task.name).toList();
    return taskNames.contains(name);
  }

  void AddTask() async {


    try{
      if(myControllerName.value.text.trim() == ''){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('The task name is empty', style: TextStyle(color: Colors.red),))
        );
      }
      else if(deadlinePicked.millisecondsSinceEpoch < DateTime.now().millisecondsSinceEpoch){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('The task deadline is invalid', style: TextStyle(color: Colors.red),))
        );
      }
      else if(await verifyName(myControllerName.value.text.trim())) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('This task already existe',
              style: TextStyle(color: Colors.red),))
        );
      }
      else {
        SpecialUlrichTask newTask = SpecialUlrichTask();
        newTask.deadline = deadlinePicked;
        newTask.name = myControllerName.value.text.trim();

        await getTasksCollection().add(newTask);

        Navigator.popUntil(context, (route) => false);
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Acceuil(name: 'name', id: 2),
          ),
        );
      }
    }
    catch (error){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(S.of(context).error, style: TextStyle(color: Colors.red),))
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

  @override
  Widget build(BuildContext context) {

    String username = FirebaseAuth.instance.currentUser!=null?FirebaseAuth.instance.currentUser!.email!:"";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(S.of(context).cration),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Center(

          child: Expanded(
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 250,
                    child: TextField(
                      controller: myControllerName,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: S.of(context).taskName,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 250,
                    height: 200,
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.date,
                      initialDateTime: deadlinePicked,
                      onDateTimeChanged: (DateTime newDateTime) { deadlinePicked = newDateTime; },
                    ),
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    AddTask();
                  },
                  child: Text(S.of(context).add),
                ),
              ],
            ),
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
                Navigator.pop(context);
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
