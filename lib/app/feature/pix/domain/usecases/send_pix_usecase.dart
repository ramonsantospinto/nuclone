import 'package:fpdart/fpdart.dart';
import 'package:nuclone/app/feature/pix/domain/repositories/pix_repository.dart';
import '../../../../core/errors/failures.dart';

class SendPixParams {
  final String pixKey;
  final double amount;
  final double currentBalance;

  SendPixParams({
    required this.pixKey,
    required this.amount,
    required this.currentBalance,
  });
}

class SendPixUseCase {
  final PixRepository repository;

  SendPixUseCase(this.repository);

  Future<Either<Failure, bool>> call(SendPixParams params) async {
    if (params.amount <= 0) {
      return const Left(
        ServerFailure('O valor do Pix deve ser maior que zero.'),
      );
    }

    if (params.amount > params.currentBalance) {
      return const Left(
        InsufficientBalanceFailure(
          'Saldo insuficiente para realizar este Pix.',
        ),
      );
    }

    if (params.pixKey.trim().isEmpty) {
      return const Left(ServerFailure('Informe uma chave Pix válida.'));
    }

    return await repository.sendPix(
      pixKey: params.pixKey,
      amount: params.amount,
    );
  }
}
