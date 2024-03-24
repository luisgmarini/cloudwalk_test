import 'package:equatable/equatable.dart';

abstract class AbsSuccess extends Equatable {}

final success = Success._success;

class Success extends AbsSuccess {
  Success._internal();

  static final Success _success = Success._internal();

  @override
  List<Object?> get props => [];
}

class DataSuccess<T> extends AbsSuccess {
  DataSuccess({
    required this.data,
  });

  final T data;

  DataSuccess<T> copyWith(T? data) {
    return DataSuccess(data: data ?? this.data);
  }

  @override
  List<Object?> get props => [data];
}
