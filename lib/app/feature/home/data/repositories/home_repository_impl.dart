import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/account_entity.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_mock_datasource.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeMockDatasource datasource;

  HomeRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, AccountEntity>> getAccountData() async {
    try {
      final accountModel = await datasource.getAccountDetails();
      return Right(accountModel);
    } catch (_) {
      return const Left(
        ServerFailure('Não foi possível carregar os dados da conta.'),
      );
    }
  }
}
