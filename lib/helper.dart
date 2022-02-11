import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void launchURL(String url) async {
  if (!await launch(url)) throw 'Could not launch $url';
}

void back(BuildContext context) {
  Navigator.pop(context);
}

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
  ));
}

void openScreen() {

}