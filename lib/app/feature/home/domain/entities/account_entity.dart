import 'package:equatable/equatable.dart';
import 'transaction_entity.dart';

class AccountEntity extends Equatable {
  final String userName;
  final double balance;
  final double creditCardLimit;
  final double creditCardUsed;
  final List<TransactionEntity> recentTransactions;

  const AccountEntity({
    required this.userName,
    required this.balance,
    required this.creditCardLimit,
    required this.creditCardUsed,
    required this.recentTransactions,
  });

  double get availableCreditLimit => creditCardLimit - creditCardUsed;

  @override
  List<Object?> get props => [
    userName,
    balance,
    creditCardLimit,
    creditCardUsed,
    recentTransactions,
  ];
}
