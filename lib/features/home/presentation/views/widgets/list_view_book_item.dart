import 'package:book/constant.dart';
import 'package:book/core/widgts/custome_text.dart';
import 'package:book/core/utils/styels.dart';
import 'package:book/features/home/data/models/home_book_model/home_book_model.dart';
import 'package:book/features/home/presentation/views/book_details_view.dart';
import 'package:book/features/home/presentation/views/widgets/iteme_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListViewBookItem extends StatelessWidget {
  const ListViewBookItem({super.key, required this.homeBookModel});
  final HomeBookModel homeBookModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          BookDetailsView.routeName,
          arguments: homeBookModel,
        );
        // GoRouter.of(context).push(AppRouter.bookdetailsview);
        // Navigate to book details view
        // context.push('/book-details');
      },
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.17,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        child: Row(
          children: [
            ItemeImage(
              image:
                  homeBookModel.volumeInfo?.imageLinks?.thumbnail ??
                  "https://books.google.com/books/content?id=DBOXDQAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api",
              aspectRatio: 2.5 / 4,
            ),
            SizedBox(width: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomeText(
                  text: homeBookModel.volumeInfo?.title ?? " :::::::::::",
                  textStyle: Styles.textStyle20.copyWith(
                    fontFamily: "GT-Sectra-Fine-Regular",
                  ),
                ),
                SizedBox(height: 3),

                CustomeText(
                  text: homeBookModel.volumeInfo?.authors?.join(', ') ?? "ali",
                  maxLines: 1,
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
