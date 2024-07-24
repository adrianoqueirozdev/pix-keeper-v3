import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pix_keeper/core/presentation/blocs/pix_key/pix_key_bloc.dart';
import 'package:pix_keeper/core/presentation/blocs/pix_key/pix_key_state.dart';

class DeletePixKeyConfirm extends StatelessWidget {
  final PixKeyBloc pixKeyBloc;
  final VoidCallback deletePixKey;

  const DeletePixKeyConfirm({super.key, required this.deletePixKey, required this.pixKeyBloc});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<PixKeyBloc, PixKeyState>(
      bloc: pixKeyBloc,
      builder: (context, state) {
        final isLoading = state is DeletePixKeyLoadingState;

        return AlertDialog(
          icon: Icon(
            Icons.delete,
            color: colorScheme.error,
            size: 32,
          ),
          title: const Text(
            "Deletar Chave",
            textAlign: TextAlign.center,
          ),
          content: const Text(
            "Tem certeza que deseja deletar esta chave?",
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: isLoading ? null : () => Get.back(),
              child: const Text("Cancelar"),
            ),
            FilledButton.icon(
              style: FilledButton.styleFrom(
                backgroundColor: colorScheme.error,
                foregroundColor: colorScheme.onError,
              ),
              onPressed: deletePixKey,
              icon: isLoading
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : null,
              label: isLoading ? const SizedBox.shrink() : const Text("Deletar"),
            ),
          ],
        );
      },
    );
  }
}
