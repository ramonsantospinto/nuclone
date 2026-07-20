import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/send_pix_usecase.dart';
import 'pix_state.dart';

class PixCubit extends Cubit<PixState> {
  final SendPixUseCase sendPixUseCase;

  PixCubit(this.sendPixUseCase) : super(const PixState());

  Future<void> sendPix({
    required String pixKey,
    required double amount,
    required double currentBalance,
  }) async {
    emit(state.copyWith(status: PixStatus.loading));

    final result = await sendPixUseCase(
      SendPixParams(
        pixKey: pixKey,
        amount: amount,
        currentBalance: currentBalance,
      ),
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: PixStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (_) => emit(
        state.copyWith(status: PixStatus.success),
      ),
    );
  }

  void resetState() {
    emit(const PixState());
  }
}
