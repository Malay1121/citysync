// import 'package:appwrite/models.dart';
import 'package:citysync/app/helper/all_imports.dart';
import 'package:citysync/app/helper/gemini_helper.dart';
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
        data.addEntries({"created_at": toUtc(DateTime.now())}.entries);
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

  static Future getOrganization({required String organizationId}) async {
    try {
      DocumentSnapshot userSnapshot =
          await FirebaseFirestore.instance
              .collection("organizations")
              .doc(organizationId)
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
      for (var event in events) {
        for (var organization in organizations.docs) {
          if (getKey(event, ["organizer"], "1") == organization.id) {
            int index = events.indexOf(event);
            events[index].addEntries(
              {"organizer_data": organization.data()}.entries,
            );
          }
        }
      }
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
        "present": false,
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

  static Future getIssues({int? limit}) async {
    try {
      List issues = [];
      Query userSnapshot = FirebaseFirestore.instance
          .collection("issues")
          .orderBy("created_at");
      if (limit != null) {
        userSnapshot = userSnapshot.limit(limit);
      }
      QuerySnapshot snapshot = await userSnapshot.get();
      issues.addAll(snapshot.docs.map((e) => e.data()));
      QuerySnapshot users =
          await FirebaseFirestore.instance
              .collection("users")
              .where(
                "uid",
                whereIn: issues.map((e) => getKey(e, ["issuer"], "")),
              )
              .get();
      for (var issue in issues) {
        for (var user in users.docs) {
          if (getKey(issue, ["issuer"], "1") == user.id) {
            int index = issues.indexOf(issue);
            issues[index].addEntries({"issuer_data": user.data()}.entries);
          }
        }
      }
      for (Map issue in issues) {
        AggregateQuerySnapshot aggregateQuerySnapshot =
            await FirebaseFirestore.instance
                .collection("upvotes")
                .where("issue", isEqualTo: getKey(issue, ["id"], ""))
                .count()
                .get();
        issue.addEntries(
          {"upvotes": (aggregateQuerySnapshot.count ?? 0).toString()}.entries,
        );
      }

      issues = issues.reversed.toList();

      return issues;
    } on FirebaseException catch (error) {
      showFirebaseError(error.message);
    }
  }

  static Future upvote({
    required String issueId,
    required String userId,
  }) async {
    try {
      EasyLoading.show();
      await FirebaseFirestore.instance.collection("upvotes").add({
        "issue": issueId == "" ? null : issueId,
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

  static Future removeVote({
    required String issueId,
    required String userId,
  }) async {
    try {
      EasyLoading.show();
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance
              .collection("upvotes")
              .where("user", isEqualTo: userId == "" ? null : userId)
              .where("issue", isEqualTo: issueId == "" ? null : issueId)
              .get();
      if (querySnapshot.docs.isNotEmpty) {
        await FirebaseFirestore.instance
            .collection("upvotes")
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

  static Future organizationUniqueIdAvailable({
    required String uniqueId,
  }) async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance
              .collection("organizations")
              .where("id", isEqualTo: uniqueId)
              .get();
      return querySnapshot.docs.isEmpty;
    } on FirebaseException catch (error) {
      showFirebaseError(error.message);
    }
  }

  static Future createOrganization({required Map<String, dynamic> data}) async {
    try {
      Reference storageRef = FirebaseStorage.instance.ref().child(
        "organization_pictures/${getKey(data, ["id"], null)}.${data["organization_picture"].toString().split(".").last}",
      );
      await storageRef.putFile(File(data["organization_picture"]));
      String imagePath = await storageRef.getDownloadURL();
      data["organization_picture"] = imagePath;
      data.addEntries({"created_at": toUtc(DateTime.now())}.entries);

      await FirebaseFirestore.instance
          .collection("organizations")
          .doc(getKey(data, ["id"], ""))
          .set(data);

      return data;
    } on FirebaseException catch (error) {
      showFirebaseError(error.message);
    }
  }

  static Future createEvent({required Map<String, dynamic> data}) async {
    try {
      Map geminiResult = await GeminiHelper.fetch(
        systemPrompt: AppStrings.createEventPrompt,
        text: jsonEncode(data),
      );
      if (getKey(geminiResult, ["data", "valid"], false) == true) {
        var doc = await FirebaseFirestore.instance
            .collection("events")
            .add(data);
        String id = doc.id;
        Reference storageRef = FirebaseStorage.instance.ref().child(
          "event_pictures/${id}.${data["image"].toString().split(".").last}",
        );
        await storageRef.putFile(File(data["image"]));
        String imagePath = await storageRef.getDownloadURL();
        data["image"] = imagePath;
        data.addEntries(
          {
            "created_at": toUtc(DateTime.now()),
            "deeds": getKey(geminiResult, ["data", "deed_points"], 0),
            "id": id,
          }.entries,
        );
        await FirebaseFirestore.instance
            .collection("events")
            .doc(id)
            .update(data);

        return data;
      } else {
        showSnackbar(message: "Create a valid event");
      }
      return null;
    } on FirebaseException catch (error) {
      showFirebaseError(error.message);
    }
  }

  static Future getOrganizationByUser({required String userId}) async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance
              .collection("organizations")
              .where("admin", isEqualTo: userId)
              .get();
      return querySnapshot.docs.first.data();
    } on FirebaseException catch (error) {
      showFirebaseError(error.message);
    }
  }

  static Future getUserDeeds({required String userId}) async {
    try {
      DocumentSnapshot querySnapshot =
          await FirebaseFirestore.instance
              .collection("users")
              .doc(userId)
              .get();

      return getKey((querySnapshot.data() as Map?) ?? {}, ["deeds"], 0);
    } on FirebaseException catch (error) {
      showFirebaseError(error.message);
    }
  }

  static Future createIssue({required Map<String, dynamic> data}) async {
    try {
      EasyLoading.show();
      Map geminiResult = await GeminiHelper.fetch(
        systemPrompt: AppStrings.createIssuePrompt,
        text: jsonEncode(data),
      );
      if (getKey(geminiResult, ["data", "valid"], false) == true) {
        var doc = await FirebaseFirestore.instance
            .collection("issues")
            .add(data);
        String id = doc.id;
        Reference storageRef = FirebaseStorage.instance.ref().child(
          "issue_pictures/${id}.${data["image"].toString().split(".").last}",
        );
        await storageRef.putFile(File(data["image"]));
        String imagePath = await storageRef.getDownloadURL();
        data["image"] = imagePath;
        data.addEntries(
          {
            "created_at": toUtc(DateTime.now()),
            "deeds": getKey(geminiResult, ["data", "deed_points"], 0),
            "id": id,
          }.entries,
        );

        await FirebaseFirestore.instance
            .collection("issues")
            .doc(id)
            .update(data);

        int deeds = await getUserDeeds(userId: getKey(data, ["issuer"], ""));
        deeds += getKey(data, ["deeds"], 0) as int;
        await editUser(
          userId: getKey(data, ["issuer"], ""),
          data: {"deeds": deeds},
        );
        EasyLoading.dismiss();

        return data;
      } else {
        EasyLoading.dismiss();

        showSnackbar(message: "Create a valid issue");
      }
      EasyLoading.dismiss();

      return null;
    } on FirebaseException catch (error) {
      EasyLoading.dismiss();

      showFirebaseError(error.message);
    }
  }
}
