import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../pix/presentation/pages/pix_send_page.dart';
import '../cubit/home_cubit.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  void _navigateToPix(BuildContext context) {
    final balance = context.read<HomeCubit>().state.account?.balance ?? 0.0;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => PixSendPage(currentBalance: balance),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final actions = [
      _ActionItem(
        icon: LucideIcons.qrCode,
        label: 'Área Pix',
        onTap: () => _navigateToPix(context),
      ),
      _ActionItem(
        icon: LucideIcons.receipt,
        label: 'Pagar',
      ),
      _ActionItem(
        icon: LucideIcons.arrowUpRight,
        label: 'Transferir',
        onTap: () => _navigateToPix(context),
      ),
      _ActionItem(
        icon: LucideIcons.arrowDownLeft,
        label: 'Depositar',
      ),
      _ActionItem(
        icon: LucideIcons.smartphone,
        label: 'Recarga',
      ),
      _ActionItem(
        icon: LucideIcons.piggyBank,
        label: 'Caixinhas',
      ),
    ];

    return SizedBox(
      height: 115,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: actions.length,
        separatorBuilder: (_, _) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final item = actions[index];
          return GestureDetector(
            onTap: item.onTap,
            behavior: HitTestBehavior.opaque,
            child: Column(
              children: [
                Container(
                  width: 72,
                  height: 72,
                  decoration: const BoxDecoration(
                    color: AppColors.greyCard,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(item.icon, color: Colors.black, size: 24),
                ),
                const SizedBox(height: 8),
                Text(
                  item.label,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ActionItem {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  _ActionItem({
    required this.icon,
    required this.label,
    this.onTap,
  });
}
