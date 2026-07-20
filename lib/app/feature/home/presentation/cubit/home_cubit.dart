import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_account_data_usecase.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetAccountDataUseCase getAccountDataUseCase;

  HomeCubit(this.getAccountDataUseCase) : super(const HomeState());

  Future<void> fetchAccountData() async {
    emit(state.copyWith(status: HomeStatus.loading));

    final result = await getAccountDataUseCase();

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: HomeStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (account) => emit(
        state.copyWith(
          status: HomeStatus.success,
          account: account,
        ),
      ),
    );
  }

  void toggleBalanceVisibility() {
    emit(state.copyWith(isBalanceVisible: !state.isBalanceVisible));
  }
}
