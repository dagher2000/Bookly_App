import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'manger_books_state.dart';

class MangerBooksCubit extends Cubit<MangerBooksState> {
  MangerBooksCubit(this.homeRepo) : super(MangerBooksInitial());

  final HomeRepo homeRepo;
  Future<void> fetchFeaturedBooks() async {
    emit(MangerBooksLoading());
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold((failure) {
      print("erorr");
      emit(MangerBooksFailure(failure.errMessage));
    }, (books) {
      print(books.first.id);
      emit(MangerBooksSuccess(books));
    });
  }
}
