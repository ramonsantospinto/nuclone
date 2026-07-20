import 'package:equatable/equatable.dart';

enum TransactionType { pixSent, pixReceived, cardPayment, deposit }

class TransactionEntity extends Equatable {
  final String id;
  final String title;
  final String description;
  final double amount;
  final DateTime date;
  final TransactionType type;

  const TransactionEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.amount,
    required this.date,
    required this.type,
  });

  @override
  List<Object?> get props => [id, title, description, amount, date, type];
}
