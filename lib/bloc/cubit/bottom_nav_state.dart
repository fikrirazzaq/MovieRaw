part of 'bottom_nav_cubit.dart';

class BottomNavState extends Equatable {
  final int selectedIndexBody;
  BottomNavState({
    required this.selectedIndexBody,
  });

  @override
  List<Object> get props => [selectedIndexBody];
}
