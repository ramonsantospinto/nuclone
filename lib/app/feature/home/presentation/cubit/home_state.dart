import 'package:equatable/equatable.dart';
import '../../domain/entities/account_entity.dart';

enum HomeStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  final HomeStatus status;
  final AccountEntity? account;
  final bool isBalanceVisible;
  final String? errorMessage;

  const HomeState({
    this.status = HomeStatus.initial,
    this.account,
    this.isBalanceVisible = true,
    this.errorMessage,
  });

  HomeState copyWith({
    HomeStatus? status,
    AccountEntity? account,
    bool? isBalanceVisible,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      account: account ?? this.account,
      isBalanceVisible: isBalanceVisible ?? this.isBalanceVisible,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, account, isBalanceVisible, errorMessage];
}
