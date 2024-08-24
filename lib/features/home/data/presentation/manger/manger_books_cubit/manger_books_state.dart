part of 'manger_books_cubit.dart';

abstract class MangerBooksState extends Equatable {
  const MangerBooksState();

  @override
  List<Object> get props => [];
}

class MangerBooksInitial extends MangerBooksState {}

class MangerBooksLoading extends MangerBooksState {}

class MangerBooksSuccess extends MangerBooksState {
  final List<BookModel> books;

  const MangerBooksSuccess(this.books);
}

class MangerBooksFailure extends MangerBooksState {
  final String errMessage;

  const MangerBooksFailure(this.errMessage);
}
