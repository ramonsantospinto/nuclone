import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failures.dart';
import '../entities/account_entity.dart';
import '../repositories/home_repository.dart';

class GetAccountDataUseCase {
  final HomeRepository repository;

  GetAccountDataUseCase(this.repository);

  Future<Either<Failure, AccountEntity>> call() async {
    return await repository.getAccountData();
  }
}
