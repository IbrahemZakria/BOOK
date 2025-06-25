import 'package:book/constant.dart';
import 'package:book/core/helper/function/lunch_url.dart';
import 'package:book/core/utils/service_locator.dart';
import 'package:book/core/utils/styels.dart';
import 'package:book/core/widgts/custom_error_text.dart';
import 'package:book/core/widgts/custom_loading_indicator.dart';
import 'package:book/core/widgts/user_message.dart';
import 'package:book/features/home/data/repos/home_repo_impl.dart';
import 'package:book/features/home/domain/entities/book_entity.dart';
import 'package:book/features/home/domain/use_cases/fetch_relevence_book.dart';
import 'package:book/features/home/presentation/views/widgets/carouseslider_image_widget.dart';
import 'package:book/features/home/presentation/views/widgets/custom_book_appbar.dart';
import 'package:book/features/home/presentation/views/widgets/custom_book_button.dart';
import 'package:book/features/home/presentation/views/widgets/iteme_image.dart';
import 'package:book/features/home/presentation/views_model/relevence_book_cubit/relevence_book_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Bookviewsbody extends StatelessWidget {
  const Bookviewsbody({super.key, required this.bookEntity});
  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    accessprviw() {
      if (bookEntity.isavailable) {
        return 'Free preview';
      } else {
        return "not available";
      }
    }

    return BlocProvider(
      create: (context) => RelevenceBookCubitCubit(
        FetchRelevenceBookUseCase(getIt<HomeRepoImpl>()),
      )..fetchRelevenceBookDetails(category: bookEntity.category),

      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              CustomBookAppbar(),
              SizedBox(height: 36),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: ItemeImage(
                  image: bookEntity.image,
                  aspectRatio: 2.8 / 5,
                ),
              ),
              SizedBox(height: 45),
              Text(
                bookEntity.title,
                maxLines: 1,
                style: TextStyle(
                  color: kwhitecolor,
                  fontSize: 30,
                  fontFamily: 'GT-Sectra-Fine-Regular',
                ),
              ),
              SizedBox(height: 7),
              Text(
                bookEntity.autherName,
                style: Styles.textStyle18.copyWith(color: Colors.grey),
              ),
              SizedBox(height: 7),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(FontAwesomeIcons.solidStar, color: kstarcolor, size: 16),
                  SizedBox(width: 6.3),
                  Text(bookEntity.rating.toString(), style: Styles.textStyle16),
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
                      bookEntity.price,
                      style: Styles.textStyle20.copyWith(color: Colors.black),
                    ),
                  ),
                  CustomBookButton(
                    rightRadius: 16,
                    buttoncolor: Color(0xffEF8262),
                    child: TextButton(
                      onPressed: () async {
                        if (bookEntity.isavailable) {
                          lunchUrl(bookEntity.availableUrl);
                        } else {
                          Usermessage.show(
                            message: "it isn't available",
                            backgroundColor: Colors.red,
                          );
                        }
                      },
                      child: Text(
                        accessprviw(),
                        style: Styles.textStyle16.copyWith(
                          fontFamily: "Gilroy-Bold",
                        ),
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
                child:
                    BlocBuilder<
                      RelevenceBookCubitCubit,
                      RelevenceBookCubitState
                    >(
                      builder: (context, state) {
                        if (state is RelevenceBookCubitfailure) {
                          return CustomErrorText(text: state.erroMessage);
                        } else if (state is RelevenceBookCubitsucess) {
                          return CarousesliderImageWidget(
                            books: state.books,
                            spaceBetweenItem: .30,
                            centerheadline: true,
                            infintyScroll: false,
                          );
                        } else if (state is RelevenceBookCubitloading) {
                          return CustomLoadingindicator();
                        } else {
                          return CustomErrorText(
                            text: "opps there is an error",
                          );
                        }
                      },
                    ),
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
