import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failures.dart';
import '../entities/account_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, AccountEntity>> getAccountData();
}
