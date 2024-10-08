import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/presentation/manger/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/data/presentation/views/widget/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.bookModal});
  final BookModel bookModal;
  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(
        category: widget.bookModal.volumeInfo.categories![0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BookDetailsViewBody(
          bookModal: widget.bookModal,
        ),
      ),
    );
  }
}
