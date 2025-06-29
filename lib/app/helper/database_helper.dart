// import 'package:appwrite/models.dart';
import 'package:citysync/app/helper/all_imports.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseHelper {
  static Future getApis() async {
    try {
      DocumentSnapshot documentSnapshot =
          await FirebaseFirestore.instance.collection("apis").doc("apis").get();
      apiKeys =
          documentSnapshot.data() != null
              ? documentSnapshot.data() as Map
              : apiKeys;
    } on FirebaseException catch (error) {
      showFirebaseError(error.message);
    }
  }

  static Future updateApiIndex({required String apiName}) async {
    try {
      await FirebaseFirestore.instance
          .collection("apis")
          .doc("apis")
          .update(apiKeys[apiName]);
      return apiKeys[apiName];
    } on FirebaseException catch (error) {
      showFirebaseError(error.message);
    }
  }

  static Future usernameAvailable({required String username}) async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance
              .collection("users")
              .where("username", isEqualTo: username)
              .get();
      return querySnapshot.docs.isEmpty;
    } on FirebaseException catch (error) {
      showFirebaseError(error.message);
    }
  }

  static Future createUser({required Map<String, dynamic> data}) async {
    try {
      // Account account = Account(client);
      // Functions functions = Functions(client);
      // User user = await account.create(
      //   userId: data["username"],
      //   email: data["email"],
      //   password: generateMd5(data["password"]),
      //   name: data["name"],
      // );
      // Future user = functions.createExecution(functionId: "create_user", method: ExecutionMethod.pOST, body: );
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: data["email"],
            password: generateMd5(data["password"]),
          );
      if (user.user != null) {
        Reference storageRef = FirebaseStorage.instance.ref().child(
          "profile_pictures/${user.user!.uid}.${data["profile_picture"].toString().split(".").last}",
        );
        await storageRef.putFile(File(data["profile_picture"]));
        String imagePath = await storageRef.getDownloadURL();
        data["profile_picture"] = imagePath;
        FirebaseAuth.instance.currentUser!.updateProfile(
          displayName: data["name"],
          photoURL: imagePath,
        );
        data.addEntries({"uid": user.user!.uid}.entries);
        await FirebaseFirestore.instance
            .collection("users")
            .doc(data["uid"])
            .set(data);
        writeUserDetails(data);
      }
      return user.user;
    } on FirebaseException catch (error) {
      showFirebaseError(error.message);
    }
  }

  static Future? loginUser({required Map<String, dynamic> data}) async {
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: data["email"],
            password: generateMd5(data["password"]),
          );
      Map<String, dynamic>? userData =
          (await FirebaseFirestore.instance
                  .collection("users")
                  .doc(user.user!.uid)
                  .get())
              .data();
      if (userData != null) writeUserDetails(userData);
      return user;
    } on FirebaseException catch (error) {
      showFirebaseError(error.message);
    }
  }

  static Future editUser({
    required String userId,
    required Map<String, dynamic> data,
  }) async {
    try {
      if (getKey(data, ["profile_picture"], "") is File) {
        Reference storageRef = FirebaseStorage.instance.ref().child(
          "profile_pictures/${userId}.${data["profile_picture"].toString().split(".").last}",
        );
        await storageRef.putFile(data["profile_picture"]);
        String imagePath = await storageRef.getDownloadURL();
        data["profile_picture"] = imagePath;
      }

      await FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .update(data);

      editUserDetails(data);

      return data;
    } on FirebaseException catch (error) {
      showFirebaseError(error.message);
    }
  }

  static Future getUser({required String userId}) async {
    try {
      DocumentSnapshot userSnapshot =
          await FirebaseFirestore.instance
              .collection("users")
              .doc(userId)
              .get();
      return userSnapshot.data();
    } on FirebaseException catch (error) {
      showFirebaseError(error.message);
    }
  }

  static Future getEvents({int? limit}) async {
    try {
      List events = [];
      Query userSnapshot = FirebaseFirestore.instance
          .collection("events")
          .orderBy("start_time");
      if (limit != null) {
        userSnapshot = userSnapshot.limit(limit);
      }
      QuerySnapshot snapshot = await userSnapshot.get();
      events.addAll(snapshot.docs.map((e) => e.data()));
      QuerySnapshot organizations =
          await FirebaseFirestore.instance
              .collection("organizations")
              .where(
                "id",
                whereIn: events.map((e) => getKey(e, ["organizer"], "")),
              )
              .get();
      for (var organization in organizations.docs) {
        events
            .firstWhereOrNull(
              (element) =>
                  getKey(element, ["organizer"], "") ==
                  getKey((organization.data() as Map?) ?? {}, ["id"], "1"),
            )
            .addEntries({"organizer_data": organization.data()}.entries);
      }
      return events;
    } on FirebaseException catch (error) {
      showFirebaseError(error.message);
    }
  }

  static Future registerEvent({
    required String eventId,
    required String userId,
  }) async {
    try {
      EasyLoading.show();
      await FirebaseFirestore.instance.collection("registrations").add({
        "event": eventId == "" ? null : eventId,
        "user": userId == "" ? null : userId,
        "created_at": toUtc(DateTime.now()),
      });
      EasyLoading.dismiss();
      return {"status": "success"};
    } on FirebaseException catch (error) {
      EasyLoading.dismiss();
      showFirebaseError(error.message);
    }
  }

  static Future unregisterEvent({
    required String eventId,
    required String userId,
  }) async {
    try {
      EasyLoading.show();
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance
              .collection("registrations")
              .where("user", isEqualTo: userId == "" ? null : userId)
              .where("event", isEqualTo: eventId == "" ? null : eventId)
              .get();
      if (querySnapshot.docs.isNotEmpty) {
        await FirebaseFirestore.instance
            .collection("registrations")
            .doc(querySnapshot.docs.first.id)
            .delete();
      }
      EasyLoading.dismiss();
      return {"status": "success"};
    } on FirebaseException catch (error) {
      EasyLoading.dismiss();
      showFirebaseError(error.message);
    }
  }
}
