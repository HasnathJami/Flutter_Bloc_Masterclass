import 'package:equatable/equatable.dart';

abstract class PostEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class PostFetched extends PostEvents {}

class SearchItem extends PostEvents {
  final String stSearch;

  SearchItem(this.stSearch);
}
