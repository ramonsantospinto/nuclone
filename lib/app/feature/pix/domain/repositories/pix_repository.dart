import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failures.dart';

abstract class PixRepository {
  Future<Either<Failure, bool>> sendPix({
    required String pixKey,
    required double amount,
  });
}
