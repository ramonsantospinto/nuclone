import 'package:equatable/equatable.dart';

enum PixStatus { initial, loading, success, failure }

class PixState extends Equatable {
  final PixStatus status;
  final String? errorMessage;

  const PixState({
    this.status = PixStatus.initial,
    this.errorMessage,
  });

  PixState copyWith({
    PixStatus? status,
    String? errorMessage,
  }) {
    return PixState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage];
}
