import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_nav_state.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(BottomNavState(selectedIndexBody: 0));

  void navigateTo(int index) {
    emit(BottomNavState(selectedIndexBody: index));
  }
}
