
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/models/task_model.dart';
import 'package:evently_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseFunction{
  static CollectionReference<UserModel> getCollectionUserModel(){
    return  FirebaseFirestore.instance.collection("Users")
        .withConverter(
        fromFirestore: (snapshot, _) {
          return UserModel.fromJson(snapshot.data()!);
        }
        , toFirestore: (value, _) {
      return value.toJson();
    }
    );
  }
  static Future<void> saveUser(UserModel user){
    var collection =getCollectionUserModel() ;
    var docR = collection.doc(user.id);
    return docR.set(user);
  }
  static readUser()async{
    var collection =getCollectionUserModel() ;
    DocumentSnapshot<UserModel> data =
    await collection.doc(FirebaseAuth.instance.currentUser!.uid).get();
    return data.data();

  }

  static CollectionReference<TaskModel> getCollectionTaskModel(){
    return  FirebaseFirestore.instance.collection("Tasks")
        .withConverter(
        fromFirestore: (snapshot, _) {
          return TaskModel.fromJson(snapshot.data()!);
        }
        , toFirestore: (value, _) {
      return value.toJson();
    }
    );
  }
  static Future<void> createTask(TaskModel task){
    var collection =getCollectionTaskModel() ;
    var docR = collection.doc();
    task.id = docR.id;
    return docR.set(task);
  }

  static  Stream<QuerySnapshot<TaskModel>> getFavoriteStream(){
    var collection =getCollectionTaskModel() ;
    var data = collection
        .where("userId",isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where("isFavorite",isEqualTo: true).snapshots();
    return data;
  }
  static Stream<QuerySnapshot<TaskModel>> getTasksStream({String? categories }){
    var collection =getCollectionTaskModel() ;
    var data;
    if(categories !=null){
       data = getCollectionTaskModel().where("userId",isEqualTo: FirebaseAuth.instance.currentUser!.uid)
           .where("categories",isEqualTo: categories).snapshots();
    }else{
      data =  getCollectionTaskModel()
          .where("userId",isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .snapshots();
    }

    return data;
  }

  static Future<void> updateTask(TaskModel task){
    var collection =getCollectionTaskModel() ;
    var docR = collection.doc(task.id);
    return docR.update(task.toJson());
  }

  static Future<void> deleteTask(TaskModel task){
    var collection =getCollectionTaskModel() ;
    var docR = collection.doc(task.id);
    return docR.delete();
  }




  static Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );


    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
  static Future<void> signOut() async{
    await FirebaseAuth.instance.signOut();
  }
  static Future<void> resetPassword(
  String email,
  {
  required Function onSuccess,
  required Function onError
  }) async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    }on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        onSuccess();
        onError('No user found for that email.');
      } else {
        onError(e.code);
      }
    } catch (e) {
      onError(e.toString());
    }

  }

  static Future<void> login(
      String emailAccount,
      String password,
  {
    required Function onSuccess,
    required Function onError
  }
      ) async{
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAccount,
          password: password
      );
      if(credential.user!.emailVerified) {
       onSuccess();
       }else{
        onError('Email not verified');
       }

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        onError('No user found for that email.');

      } else if (e.code == 'wrong-password') {
        onError('Wrong password provided for that user.');

      }else{
        onError(e.code);
      }

    } catch (e) {
      onError(e.toString());
    }
  }


 static Future<void> createUser(
     String email,
     String password,
     String name,
     {
       required Function onSuccess,
       required Function onError
     }
     ) async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      saveUser(
          UserModel(
              id: credential.user!.uid,
              name: name, email: email)
      );
      onSuccess();
      credential.user!.sendEmailVerification();
    } on FirebaseAuthException catch (e) {

      if (e.code == 'weak-password') {
        onError('The password provided is too weak.');

      } else if (e.code == 'email-already-in-use') {
        onError('The account already exists for that email.');

      }else{
        onError(e.code);
      }
    } catch (e) {
      onError(e.toString());
    }
  }
}