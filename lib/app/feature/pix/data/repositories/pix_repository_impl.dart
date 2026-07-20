import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/repositories/pix_repository.dart';

class PixRepositoryImpl implements PixRepository {
  @override
  Future<Either<Failure, bool>> sendPix({
    required String pixKey,
    required double amount,
  }) async {
    try {
      await Future.delayed(const Duration(milliseconds: 1500));
      return const Right(true);
    } catch (_) {
      return const Left(
        ServerFailure('Falha ao processar a transferência Pix.'),
      );
    }
  }
}
