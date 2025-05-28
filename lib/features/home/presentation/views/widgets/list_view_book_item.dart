import 'package:book/constant.dart';
import 'package:book/core/utils/assets.dart';
import 'package:book/core/utils/custom_widgts/custome_text.dart';
import 'package:book/core/utils/styels.dart';
import 'package:book/features/home/presentation/views/widgets/iteme_image.dart';
import 'package:flutter/material.dart';

class ListViewBookItem extends StatelessWidget {
  const ListViewBookItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.17,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          ItemeImage(image: AssetsData.testImage, aspectRatio: 2 / 4),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomeText(text: "the story name"),
                CustomeText(
                  text: "F. Scott Fitzgerald",
                  textStyle: Styles.smallcontent,
                ),
                Row(
                  children: [
                    Text("10.99 \$", style: Styles.numberStyle),
                    SizedBox(width: 64),
                    Icon(Icons.star_rate_rounded, color: kstarcolor, size: 24),
                    Text("rate", style: Styles.titleMedium),
                    SizedBox(width: 8),
                    Text("(rate)", style: Styles.smallcontent),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
