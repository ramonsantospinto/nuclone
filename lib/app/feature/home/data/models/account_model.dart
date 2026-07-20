import '../../domain/entities/account_entity.dart';

class AccountModel extends AccountEntity {
  const AccountModel({
    required super.userName,
    required super.balance,
    required super.creditCardLimit,
    required super.creditCardUsed,
    required super.recentTransactions,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      userName: json['userName'] as String,
      balance: (json['balance'] as num).toDouble(),
      creditCardLimit: (json['creditCardLimit'] as num).toDouble(),
      creditCardUsed: (json['creditCardUsed'] as num).toDouble(),
      recentTransactions: const [],
    );
  }
}
