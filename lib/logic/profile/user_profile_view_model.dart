import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/constants/enums/player_position.dart';
import 'package:kasado/constants/extensions/iterable_extensions.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/data/repositories/user_info_repository.dart';
import 'package:kasado/logic/profile/user_profile_state.dart';
import 'package:kasado/logic/profile/user_profile_tec_mixin.dart';
import 'package:kasado/logic/shared/view_model.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';
import 'package:kasado/model/kasado_user_info/kasado_user_info.dart';
import 'package:kasado/model/stats/stats.dart';
import 'package:kasado/model/user_bio/user_bio.dart';

final userProfileViewModel = Provider.autoDispose(
  (ref) => UserProfileViewModel(
    ref: ref,
    userInfoRepo: ref.watch(userInfoRepositoryProvider),
    currentUser: ref.watch(currentUserProvider)!,
  ),
);

class UserProfileViewModel extends ViewModel with UserProfileTecMixin {
  UserProfileViewModel({
    required Ref ref,
    required this.userInfoRepo,
    required this.currentUser,
  }) : super(ref);

  final UserInfoRepository userInfoRepo;
  final KasadoUser currentUser;

  @override
  void initState([Map<String, Object?>? params]) {
    FirebaseAnalytics.instance.logEvent(
      name: 'user_profile_view',
      parameters: {
        'user_id': ref.read(currentUserProvider)?.toJson().toString(),
        'viewed_user_id': params!['viewed_user_id'],
      },
    );
  }

  Future<void> openEditProfileDialog({
    required BuildContext context,
    required Widget dialog,
    required UserBio? userBio,
  }) async {
    if (userBio != null) {
      setupUserBioToEdit(
        userBio,
        (birthDate, positions) {
          ref.read(birthdateProvider.notifier).state = birthDate;
          ref.read(playerPositionsProvider.notifier).state = positions;
        },
      );
    }
    showDialog(
      context: context,
      builder: (_) => dialog,
    ).then((_) {
      ref.read(birthdateProvider.notifier).state = null;
      ref.read(playerPositionsProvider.notifier).state = [];
      clearAllTecs();
    });
  }

  List<MapEntry> getSortedStatsAsMapEntries(Stats stats) {
    final statsMap = {
      'PTS': stats.points,
      'AST': stats.ast,
      'REB': stats.rebounds,
      'STL': stats.stl,
      'BLK': stats.blk,
    };
    final statsMapEntries = statsMap.entries.toList();

    return statsMapEntries..sort((a, b) => (b.value.compareTo(a.value)));
  }

  Future<void> addOrDeductPondo({
    required BuildContext context,
    required KasadoUserInfo currentUserInfo,
    required bool isAdd,
    required double pondo,
  }) async {
    await userInfoRepo.addOrDeductPondo(
      currentUserInfo: currentUserInfo,
      isAdd: isAdd,
      pondo: pondo,
    );
    Navigator.pop(context);
  }

  Future<void> setBirthDate(BuildContext context) async {
    final initialDate = ref.read(birthdateProvider) ?? DateTime.now();
    ref.read(birthdateProvider.notifier).state = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1980),
      lastDate: DateTime.now(),
      initialEntryMode: DatePickerEntryMode.input,
    );
  }

  void modifyPlayerPositionList({
    required PlayerPosition position,
    required bool isAdd,
  }) {
    ref.read(playerPositionsProvider.notifier).update(
      (state) {
        if (state.length == 2 && isAdd) {
          Fluttertoast.showToast(msg: "Maximum of 2 positions only");

          return state;
        } else if (isAdd) {
          return [...state, position];
        } else {
          return [...state].exclude(position);
        }
      },
    );
  }

  Future<void> pushUserBio(BuildContext context) async {
    final userBio = UserBio(
      birthdate: ref.read(birthdateProvider),
      weight: double.tryParse(tecWeight.text),
      heightFt: double.tryParse(tecHeightFt.text),
      heightIn: double.tryParse(tecHeightIn.text),
      positions: ref.read(playerPositionsProvider),
    );
    ref.read(mixpanel)!.track("Pushed UserBio", properties: userBio.toJson());
    await userInfoRepo.pushUserBio(userId: currentUser.id, userBio: userBio);
    Navigator.pop(context);
  }
}
