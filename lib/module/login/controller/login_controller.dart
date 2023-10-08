import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shopbils/core.dart';

class LoginController extends GetxController {
  LoginView? view;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  bool obsecureText = true;
  obsecureTextEnable() {
    if (obsecureText == true) {
      obsecureText = false;
    } else {
      obsecureText = true;
    }
  }

  bool isLoading = false;
  doLoginGoogle() async {
    GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );

    // Set isLoading to true to indicate that the process is ongoing
    isLoading = true;

    try {
      await googleSignIn.disconnect();
    } catch (_) {}

    try {
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      var userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      debugPrint("userCredential: $userCredential");

      //TODO: on login success
      //------------------
      Get.offAll(DasboardView());
      print(
          "sudah berhasil loginbil${FirebaseAuth.instance.currentUser!.displayName ?? ""}");
    } catch (error) {
      print("--------------------");
      print(error);
    } finally {
      // Set isLoading to false to indicate that the process has finished
      isLoading = false;
    }
  }

  doLoginsGoogle() async {
    GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );

    try {
      await googleSignIn.disconnect();
    } catch (_) {}

    try {
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      var userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      debugPrint("userCredential: $userCredential");
      //TODO: on login success
      //------------------
      Get.offAll(DasboardView());
    } catch (_) {
      print("gagal nih booss");
    }
  }

  doLoginAnonymously() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
      Get.offAll(DasboardView());
    } catch (e) {
      print("________");
      print(e);
    }
  }

  updateIsLoading() {
    if (isLoading == false) {
      isLoading = true;
    } else {
      isLoading = false;
    }
  }
}
