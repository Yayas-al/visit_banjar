import 'package:bloc/bloc.dart';
import 'package:visit_banjar/cubit/page_state.dart';


class PageCubit extends Cubit<PageState> {
  PageCubit() : super(PageState(selectedIndex: 0));

  void selectPageIndex(int index) {
    emit(PageState(selectedIndex: index));
  }
}
