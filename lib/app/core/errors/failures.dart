import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure([super.message = 'Erro ao conectar ao servidor.']);
}

class CacheFailure extends Failure {
  const CacheFailure([super.message = 'Erro ao recuperar dados locais.']);
}

class InsufficientBalanceFailure extends Failure {
  const InsufficientBalanceFailure([
    super.message = 'Saldo insuficiente para a operação.',
  ]);
}
