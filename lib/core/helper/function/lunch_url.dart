import 'package:book/core/widgts/user_message.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> lunchUrl(String uri) async {
  final Uri url = Uri.parse(uri);

  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  } else {
    Usermessage.show(
      message: "it isn't available",
      backgroundColor: Colors.red,
    );
  }
}
