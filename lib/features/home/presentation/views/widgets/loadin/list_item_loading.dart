import 'package:book/constant.dart';
import 'package:book/core/utils/styels.dart';
import 'package:book/core/widgts/custome_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListItemLoading extends StatelessWidget {
  const ListItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.17,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 2.5 / 4, // Adjust the aspect ratio as needed
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          SizedBox(width: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomeText(
                text: " Loading ",
                textStyle: Styles.textStyle20.copyWith(
                  fontFamily: "GT-Sectra-Fine-Regular",
                ),
              ),
              SizedBox(height: 3),

              CustomeText(
                text: " Loading ",
                maxLines: 1,
                textStyle: Styles.textStyle14,
              ),
              SizedBox(height: 3),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.52,
                child: Row(
                  children: [
                    Text(
                      " Loading",
                      style: Styles.textStyle20.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      FontAwesomeIcons.solidStar,
                      color: kstarcolor,
                      size: 16,
                    ),
                    SizedBox(width: 6.3),

                    Text(" Loading ", style: Styles.textStyle14),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
