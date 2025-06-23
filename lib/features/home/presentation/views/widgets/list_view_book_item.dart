import 'package:book/constant.dart';
import 'package:book/core/widgts/custome_text.dart';
import 'package:book/core/utils/styels.dart';
import 'package:book/features/home/domain/entities/book_entity.dart';
import 'package:book/features/home/presentation/views/book_details_view.dart';
import 'package:book/features/home/presentation/views/widgets/iteme_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListViewBookItem extends StatelessWidget {
  const ListViewBookItem({super.key, required this.bookEntity});
  final BookEntity bookEntity;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          BookDetailsView.routeName,
          arguments: bookEntity,
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
            ItemeImage(image: bookEntity.image, aspectRatio: 2.5 / 4),
            SizedBox(width: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomeText(
                  text: bookEntity.title,
                  textStyle: Styles.textStyle20.copyWith(
                    fontFamily: "GT-Sectra-Fine-Regular",
                  ),
                ),
                SizedBox(height: 3),

                CustomeText(
                  text: bookEntity.autherName,
                  maxLines: 1,
                  textStyle: Styles.textStyle14,
                ),
                SizedBox(height: 3),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.52,
                  child: Row(
                    children: [
                      Text(
                        bookEntity.price,
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
                      Text(
                        bookEntity.rating.toString(),
                        style: Styles.textStyle14,
                      ),
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
