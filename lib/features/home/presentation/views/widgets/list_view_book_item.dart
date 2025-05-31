import 'package:book/constant.dart';
import 'package:book/core/utils/app_router.dart';
import 'package:book/core/utils/assets.dart';
import 'package:book/core/widgts/custome_text.dart';
import 'package:book/core/utils/styels.dart';
import 'package:book/features/home/presentation/views/widgets/iteme_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class ListViewBookItem extends StatelessWidget {
  const ListViewBookItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(AppRouter.bookdetailsview);
        // Navigate to book details view
        // context.push('/book-details');
      },
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.17,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        child: Row(
          children: [
            ItemeImage(image: AssetsData.testImage, aspectRatio: 2.5 / 4),
            SizedBox(width: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomeText(
                  text: "the story name",
                  textStyle: Styles.textStyle20.copyWith(
                    fontFamily: "GT-Sectra-Fine-Regular",
                  ),
                ),
                SizedBox(height: 3),
                CustomeText(
                  text: "F. Scott Fitzgerald",
                  textStyle: Styles.textStyle14,
                ),
                SizedBox(height: 3),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.52,
                  child: Row(
                    children: [
                      Text(
                        "10.99 \$",
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
                      Text("rate", style: Styles.textStyle16),
                      SizedBox(width: 8),
                      Text("(rate)", style: Styles.textStyle14),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
