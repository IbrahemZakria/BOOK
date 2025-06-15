import 'package:book/core/widgts/user_message.dart';
import 'package:book/features/home/data/models/home_book_model/home_book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> lunchUrl(HomeBookModel homeBookModel) async {
  final Uri url = Uri.parse(homeBookModel.accessInfo!.pdf!.acsTokenLink!);

  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  } else {
    Usermessage.show(
      message: "it isn't available",
      backgroundColor: Colors.red,
    );
  }
}
