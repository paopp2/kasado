import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/admin/player_manager/player_manager_view_model.dart';
import 'package:kasado/model/kasado_user_info/kasado_user_info.dart';
import 'package:kasado/ui/admin/player_manager/components/pondo_input_dialog.dart';
import 'package:kasado/ui/shared/user_search/user_search_pane.dart';

class PlayerManagerView extends HookConsumerWidget {
  const PlayerManagerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(playerManagerViewModel);

    void _onUserTapped(KasadoUserInfo userInfo) => showDialog(
          context: context,
          builder: (_) => PondoInputDialog(
            model: model,
            userInfo: userInfo,
          ),
        );

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: UserSearchPane(onUserTapped: _onUserTapped),
          ),
        );
      },
    );
  }
}
