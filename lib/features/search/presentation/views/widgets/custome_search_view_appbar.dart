import 'package:book/core/utils/custome_text_form_field.dart';
import 'package:flutter/material.dart';

class CustomeSearchViewAppbar extends StatelessWidget {
  const CustomeSearchViewAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: double.infinity,
      height: 60,
      child: CustomeTextFormField.custometextformfield(
        hintText: 'Search',
        onSaved: (value) {},
        prefixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
      ),
    );
  }
}
