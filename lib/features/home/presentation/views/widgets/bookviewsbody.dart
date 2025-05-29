import 'package:book/constant.dart';
import 'package:book/core/utils/assets.dart';
import 'package:book/core/utils/styels.dart';
import 'package:book/features/home/presentation/views/widgets/carouseslider_image.dart';
import 'package:book/features/home/presentation/views/widgets/custom_book_appbar.dart';
import 'package:book/features/home/presentation/views/widgets/custom_book_button.dart';
import 'package:book/features/home/presentation/views/widgets/iteme_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Bookviewsbody extends StatelessWidget {
  const Bookviewsbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            CustomBookAppbar(),
            SizedBox(height: 36),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: ItemeImage(
                image: AssetsData.testImage,
                aspectRatio: 2.7 / 5,
              ),
            ),
            SizedBox(height: 45),
            Text(
              "The Jungle Book",
              style: TextStyle(
                color: kwhitecolor,
                fontSize: 30,
                fontFamily: 'GT-Sectra-Fine-Regular',
              ),
            ),
            SizedBox(height: 7),
            Text(
              "Rudyard Kipling",
              style: Styles.textStyle18.copyWith(color: Colors.grey),
            ),
            SizedBox(height: 7),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(FontAwesomeIcons.solidStar, color: kstarcolor, size: 16),
                SizedBox(width: 6.3),
                Text("rate", style: Styles.textStyle16),
                SizedBox(width: 8),
                Text("(rate)", style: Styles.textStyle14),
              ],
            ),
            SizedBox(height: 37),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomBookButton(
                  leftRadius: 16,
                  buttoncolor: kwhitecolor,
                  child: Text(
                    'price',
                    style: Styles.textStyle20.copyWith(color: Colors.black),
                  ),
                ),
                CustomBookButton(
                  rightRadius: 16,
                  buttoncolor: Color(0xffEF8262),
                  child: Text(
                    'Free preview',
                    style: Styles.textStyle16.copyWith(
                      fontFamily: "Gilroy-Bold",
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            Row(
              children: [
                Text(
                  "You can also like",
                  style: Styles.textStyle16.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: CarousesliderImage(
                spaceBetweenItem: .35,
                centerheadline: true,
                infintyScroll: false,
              ),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
