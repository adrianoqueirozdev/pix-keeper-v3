import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pix_keeper/core/presentation/blocs/pix_key/pix_key_bloc.dart';
import 'package:pix_keeper/core/presentation/blocs/pix_key/pix_key_state.dart';
import 'package:pix_keeper/shared/widgets/base_widget.dart';
import 'package:pix_keeper/shared/widgets/bottom_sheet_group_button.dart';
import 'package:pix_keeper/shared/widgets/modal_bottom_sheet_base.dart';

class DeletePixKeyConfirm extends StatelessWidget {
  final VoidCallback onDeletePixKey;
  final VoidCallback onCancel;

  const DeletePixKeyConfirm({super.key, required this.onDeletePixKey, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    final pixKeyBloc = Get.find<PixKeyBloc>();

    return BaseWidgetBuilder(
      builder: (context, textTheme, colorScheme, isDarkMode, size) {
        return BlocBuilder<PixKeyBloc, PixKeyState>(
          bloc: pixKeyBloc,
          builder: (context, state) {
            final isLoading = state is DeletePixKeyLoadingState;

            return ModalBottomSheetBase(
              height: 250,
              title: "Apagar Chave",
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Text(
                        "Você tem certeza de que deseja apagar esta chave? As chaves apagadas ficaram na lixeira.",
                        style: textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 32),
                      BottomSheetGroupButton(
                        onSecondaryAction: isLoading ? null : onCancel,
                        onPrimaryAction: isLoading ? null : onDeletePixKey,
                      ),
                      const SizedBox(height: 18),
                    ],
                  ),
                ),
                if (isLoading) const LinearProgressIndicator(),
              ],
            );
          },
        );
      },
    );
  }
}
