import 'package:book/constant.dart';
import 'package:book/core/helper/function/lunch_url.dart';
import 'package:book/core/utils/service_locator.dart';
import 'package:book/core/utils/styels.dart';
import 'package:book/core/widgts/custom_error_text.dart';
import 'package:book/core/widgts/custom_loading_indicator.dart';
import 'package:book/core/widgts/user_message.dart';
import 'package:book/features/home/data/models/home_book_model/home_book_model.dart';
import 'package:book/features/home/data/repos/home_repo_impl.dart';
import 'package:book/features/home/presentation/views/widgets/carouseslider_image_widget.dart';
import 'package:book/features/home/presentation/views/widgets/custom_book_appbar.dart';
import 'package:book/features/home/presentation/views/widgets/custom_book_button.dart';
import 'package:book/features/home/presentation/views/widgets/iteme_image.dart';
import 'package:book/features/home/presentation/views_model/relevence_book_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Bookviewsbody extends StatelessWidget {
  const Bookviewsbody({super.key, required this.homeBookModel});
  final HomeBookModel homeBookModel;

  @override
  Widget build(BuildContext context) {
    accessprviw() {
      if (homeBookModel.accessInfo!.pdf!.isAvailable!) {
        return 'Free preview';
      } else {
        return "not available";
      }
    }

    return BlocProvider(
      create: (context) => RelevenceBookCubitCubit(getIt<HomeRepoImpl>())
        ..fetchRelevenceBookDetails(
          category: homeBookModel.volumeInfo?.categories?[0] ?? 'play',
        ),

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
                  image:
                      homeBookModel.volumeInfo?.imageLinks?.thumbnail ??
                      "https://books.google.com/books/content?id=lF_zLLqSThcC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
                  aspectRatio: 2.8 / 5,
                ),
              ),
              SizedBox(height: 45),
              Text(
                homeBookModel.volumeInfo!.title!,
                maxLines: 1,
                style: TextStyle(
                  color: kwhitecolor,
                  fontSize: 30,
                  fontFamily: 'GT-Sectra-Fine-Regular',
                ),
              ),
              SizedBox(height: 7),
              Text(
                homeBookModel.volumeInfo?.authors?.join(",") ?? "",
                style: Styles.textStyle18.copyWith(color: Colors.grey),
              ),
              SizedBox(height: 7),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(FontAwesomeIcons.solidStar, color: kstarcolor, size: 16),
                  SizedBox(width: 6.3),
                  Text("0", style: Styles.textStyle16),
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
                    child: TextButton(
                      onPressed: () async {
                        if (homeBookModel.accessInfo!.pdf!.isAvailable!) {
                          lunchUrl(
                            homeBookModel.accessInfo!.pdf!.acsTokenLink!,
                          );
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
