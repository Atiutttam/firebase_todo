import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_todo/login_page.dart';
import 'package:firebase_todo/todo_model.dart';
import 'package:firebase_todo/user_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseFirestore fireStore=FirebaseFirestore.instance;

  late CollectionReference mTodo;
  String? uuId;
  static const String COLLECTION_USERS_KEY="users";
  static const String COLLECTION_TODO_KEY="notes";

  var titleController=TextEditingController();
  var descController=TextEditingController();

  @override
  void initState() {
    super.initState();
    getUserId();
  }
  getUserId() async {
    var prefs=await SharedPreferences.getInstance();
    uuId=prefs.getString(SignInPage.PREF_UID_KEY);
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {

    mTodo=fireStore.collection(COLLECTION_USERS_KEY).doc(uuId).collection(COLLECTION_TODO_KEY);

    return Scaffold(
      appBar: AppBar(title: Text("firebase"),),
      body:
      // FutureBuilder(
      //   future: fireStore.collection("users").get(),
      //   builder: (_, snapshots)
      uuId!=null
          ? StreamBuilder(
            stream: fireStore.collection(COLLECTION_USERS_KEY).doc(uuId).collection(COLLECTION_TODO_KEY).snapshots(),
            builder: (_, snapshots)
            {
            if(snapshots.connectionState==ConnectionState.waiting){
             return Center(child: CircularProgressIndicator(),);}
            if(snapshots.hasError){
            return Center(child: Text("Error:${snapshots.error}"),);}
           if(snapshots.hasData){
            return ListView.builder(
              itemCount: snapshots.data!.size,
              itemBuilder: (_, index){
                Map<String,dynamic>mData=snapshots.data!.docs[index].data();
                TodoModel eachModel=TodoModel.fromDoc(mData);
                return ListTile(
                  // leading: Text("${eachModel.age}"),
                  title: Text("${eachModel.title}"),
                  subtitle: Text("${eachModel.desc}"),
                  // trailing: Text("${eachModel.gender}"),
                );
              });
        }
        return Container();
        },
      )
          :Center(child: CircularProgressIndicator(),),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var newTodo=TodoModel(
              title: "home work",
              desc: "lesson");
          var refDoc=await mTodo.add(newTodo.toDoc());
          print("${refDoc}");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
