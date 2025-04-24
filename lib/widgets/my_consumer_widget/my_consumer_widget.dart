import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:haztecasa/models/bases/base_model.dart';
import 'package:haztecasa/models/bases/base_state_notifier_model.dart';
import 'package:haztecasa/widgets/error_dialog/error_dialog.dart';

class MyConsumerWidget extends ConsumerWidget {
  final List<StateNotifierProvider<BaseStateNotifier<BaseModel>, BaseModel>> providers;
  final Widget Function(BuildContext context, WidgetRef ref) builder;

  const MyConsumerWidget({super.key, required this.providers, required this.builder});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    for (final provider in providers) {
      ref.listen<BaseModel>(provider, (prev, next) {
        Future.microtask(() async {
          String error = next.error ?? '';

          if (error == "" || identical(prev?.error, next.error) || !context.mounted) return;

          // aqui mandar a log en un servicio
          await ErrorDialog.show(context, error, null);

          ref.read(provider.notifier).clearError();
        });
      });
    }

    return builder(context, ref);
  }
}
