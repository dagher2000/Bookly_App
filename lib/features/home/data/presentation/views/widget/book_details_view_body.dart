import 'package:bookly_app/features/home/data/presentation/views/widget/custom_book_details_app_bar.dart';
import 'package:bookly_app/features/home/data/presentation/views/widget/custom_book_image.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          const CustomBookDetailsAppBar(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.17),
            child: const CustomBookImage(),
          ),
        ],
      ),
    );
  }
}
