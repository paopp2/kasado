import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/profile/user_profile_view_model.dart';
import 'package:kasado/model/kasado_user_info/kasado_user_info.dart';
import 'package:kasado/ui/shared/data_entry_field.dart';
import 'package:kasado/ui/shared/loading_widget.dart';

class PondoInputDialog extends HookConsumerWidget {
  const PondoInputDialog({
    Key? key,
    required this.userInfo,
    required this.model,
  }) : super(key: key);

  final KasadoUserInfo userInfo;
  final UserProfileViewModel model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoadingState = useState(false);
    final pondoTec = useTextEditingController();

    Future<void> _onDeductPressed() async {
      isLoadingState.value = true;
      await model.addOrDeductPondo(
        context: context,
        currentUserInfo: userInfo,
        isAdd: false,
        pondo: double.parse(pondoTec.text),
      );
      isLoadingState.value = false;
    }

    Future<void> _onAddPressed() async {
      isLoadingState.value = true;
      await model.addOrDeductPondo(
        context: context,
        currentUserInfo: userInfo,
        isAdd: true,
        pondo: double.parse(pondoTec.text),
      );
      isLoadingState.value = false;
    }

    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              userInfo.user.displayName!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Pondo: ${userInfo.pondo}'),
            DataEntryField(
              tec: pondoTec,
              hint: 'Pondo to add/deduct',
              isDouble: true,
            ),
            (isLoadingState.value)
                ? const LoadingWidget()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        child: const Text(
                          'DEDUCT',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        onPressed: _onDeductPressed,
                      ),
                      TextButton(
                        child: const Text(
                          'ADD',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        onPressed: _onAddPressed,
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
