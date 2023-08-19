import 'package:equatable/equatable.dart';

class PageState extends Equatable {
  final int selectedIndex;

  PageState({required this.selectedIndex});

  @override
  List<Object?> get props => [selectedIndex];
}