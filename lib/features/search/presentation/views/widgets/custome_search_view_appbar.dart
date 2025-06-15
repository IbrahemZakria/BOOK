import 'package:book/core/widgts/custome_text_form_field.dart';
import 'package:book/features/home/presentation/views_model/relevence_book_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomeSearchViewAppbar extends StatelessWidget {
  const CustomeSearchViewAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchControler = TextEditingController();
    return Container(
      margin: const EdgeInsets.all(8),
      width: double.infinity,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: CustomeTextFormField.custometextformfield(
              controller: searchControler,

              hintText: 'Search',
              onSaved: (value) {
                BlocProvider.of<RelevenceBookCubitCubit>(
                  context,
                ).fetchRelevenceBookDetails(category: searchControler.text);
              },
              prefixIcon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close),
          ),
        ],
      ),
    );
  }
}
