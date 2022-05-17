import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/constants/enums/player_position.dart';
import 'package:kasado/logic/profile/user_profile_state.dart';
import 'package:kasado/logic/profile/user_profile_view_model.dart';
import 'package:kasado/logic/shared/kasado_utils.dart';
import 'package:kasado/ui/profile/components/player_position_chip.dart';
import 'package:kasado/ui/shared/data_entry_field.dart';
import 'package:kasado/ui/shared/loading_widget.dart';

class EditProfileDialog extends HookConsumerWidget {
  const EditProfileDialog({
    Key? key,
    required this.model,
  }) : super(key: key);

  final UserProfileViewModel model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoadingState = useState(false);
    final utils = ref.watch(kasadoUtilsProvider);
    final selectedBirthdate = ref.watch(birthdateProvider);
    model.tecBirthdate.text = utils.getDateFormat(
      selectedBirthdate,
      showYear: true,
    );

    Future<void> _onCheckFabPressed() async {
      isLoadingState.value = true;
      await model.pushUserBio(context);
      isLoadingState.value = false;
    }

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Edit Profile",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => model.setBirthDate(context),
                  child: DataEntryField(
                    tec: model.tecBirthdate,
                    hint: 'Birthdate',
                    isDisabled: true,
                    validator: null,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: DataEntryField(
                        tec: model.tecHeightFt,
                        hint: 'Height (ft)',
                        isDouble: true,
                        validator: null,
                      ),
                    ),
                    Expanded(
                      child: DataEntryField(
                        tec: model.tecHeightIn,
                        hint: 'Height (in)',
                        isDouble: true,
                        validator: null,
                      ),
                    ),
                  ],
                ),
                DataEntryField(
                  tec: model.tecWeight,
                  hint: 'Weight (kg)',
                  isDouble: true,
                  validator: null,
                ),
                const Divider(),
                const Text(
                  "Choose two positions you play best",
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PlayerPositionChip(
                      model: model,
                      position: PlayerPosition.pg,
                    ),
                    PlayerPositionChip(
                      model: model,
                      position: PlayerPosition.sg,
                    ),
                    PlayerPositionChip(
                      model: model,
                      position: PlayerPosition.sf,
                    ),
                    PlayerPositionChip(
                      model: model,
                      position: PlayerPosition.pf,
                    ),
                    PlayerPositionChip(
                      model: model,
                      position: PlayerPosition.c,
                    ),
                  ],
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: (isLoadingState.value)
                ? const LoadingWidget(color: Colors.white)
                : const Icon(Icons.check),
            onPressed: _onCheckFabPressed,
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
