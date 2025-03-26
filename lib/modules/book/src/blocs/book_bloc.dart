import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_perpus/modules/book/src/blocs/book_event.dart';
import 'package:flutter_perpus/modules/book/src/blocs/book_state.dart';
import 'package:flutter_perpus/modules/book/src/services/book_service.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final BookService bookService;

  BookBloc(this.bookService) : super(BookInitial()) {
    on<FetchRandomBooks>((event, emit) async {
      emit(BookLoading());
      try {
        final books = await bookService.fetchRandomBooks();
        emit(BookLoaded(books));
      } catch (e) {
        emit(BookError('Gagal memuat buku'));
      }
    });
  }
}
