import '../models/account_model.dart';
import '../../domain/entities/transaction_entity.dart';

abstract class HomeMockDatasource {
  Future<AccountModel> getAccountDetails();
}

class HomeMockDatasourceImpl implements HomeMockDatasource {
  @override
  Future<AccountModel> getAccountDetails() async {
    await Future.delayed(const Duration(milliseconds: 1200));

    return AccountModel(
      userName: 'Ramon',
      balance: 14250.80,
      creditCardLimit: 8500.00,
      creditCardUsed: 1340.50,
      recentTransactions: [
        TransactionEntity(
          id: '1',
          title: 'Transferência enviada',
          description: 'Pix para João Silva',
          amount: -150.00,
          date: DateTime.now().subtract(const Duration(hours: 2)),
          type: TransactionType.pixSent,
        ),
        TransactionEntity(
          id: '2',
          title: 'Pagamento recebido',
          description: 'Pix de Empresa XYZ',
          amount: 3200.00,
          date: DateTime.now().subtract(const Duration(days: 1)),
          type: TransactionType.pixReceived,
        ),
        TransactionEntity(
          id: '3',
          title: 'Compra no cartão',
          description: 'Supermercado Mercado Livre',
          amount: -289.90,
          date: DateTime.now().subtract(const Duration(days: 2)),
          type: TransactionType.cardPayment,
        ),
      ],
    );
  }
}
