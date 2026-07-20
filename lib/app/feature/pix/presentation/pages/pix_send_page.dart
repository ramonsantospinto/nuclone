import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../../../../core/dependency_injection/injector.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../cubit/pix_cubit.dart';
import '../cubit/pix_state.dart';
import '../widgets/pix_success_sheet.dart';

class PixSendPage extends StatefulWidget {
  final double currentBalance;

  const PixSendPage({super.key, required this.currentBalance});

  @override
  State<PixSendPage> createState() => _PixSendPageState();
}

class _PixSendPageState extends State<PixSendPage> {
  final _keyController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  void dispose() {
    _keyController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PixCubit>(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(LucideIcons.arrowLeft, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: BlocConsumer<PixCubit, PixState>(
          listener: (context, state) {
            if (state.status == PixStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage ?? 'Erro na transferência'),
                  backgroundColor: Colors.red,
                ),
              );
            } else if (state.status == PixStatus.success) {
              showModalBottomSheet(
                context: context,
                isDismissible: false,
                builder: (_) => PixSuccessSheet(
                  amount: double.tryParse(_amountController.text) ?? 0.0,
                  pixKey: _keyController.text,
                ),
              );
            }
          },
          builder: (context, state) {
            final isLoading = state.status == PixStatus.loading;

            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Qual o valor da transferência?',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Saldo disponível em conta: ${CurrencyFormatter.format(widget.currentBalance)}',
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const SizedBox(height: 24),
                  TextField(
                    controller: _keyController,
                    decoration: const InputDecoration(
                      labelText: 'Chave Pix (E-mail, CPF, Telefone)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _amountController,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Valor (R\$)',
                      border: OutlineInputBorder(),
                      prefixText: 'R\$ ',
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26),
                        ),
                      ),
                      onPressed: isLoading
                          ? null
                          : () {
                              final amount =
                                  double.tryParse(_amountController.text) ??
                                  0.0;
                              context.read<PixCubit>().sendPix(
                                pixKey: _keyController.text,
                                amount: amount,
                                currentBalance: widget.currentBalance,
                              );
                            },
                      child: isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Transferir',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Icon(
                                  LucideIcons.arrowRight,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
