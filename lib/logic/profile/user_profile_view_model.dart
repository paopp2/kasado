import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/constants/enums/player_position.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/data/repositories/user_info_repository.dart';
import 'package:kasado/logic/profile/user_profile_state.dart';
import 'package:kasado/logic/profile/user_profile_tec_mixin.dart';
import 'package:kasado/logic/shared/view_model.dart';
import 'package:kasado/model/kasado_user_info/kasado_user_info.dart';
import 'package:kasado/model/stats/stats.dart';

final userProfileViewModel = Provider.autoDispose(
  (ref) => UserProfileViewModel(
    read: ref.read,
    userInfoRepo: ref.watch(userInfoRepositoryProvider),
  ),
);

class UserProfileViewModel extends ViewModel with UserProfileTecMixin {
  UserProfileViewModel({
    required Reader read,
    required this.userInfoRepo,
  }) : super(read);

  final UserInfoRepository userInfoRepo;

  @override
  void initState([Map<String, Object?>? params]) {
    FirebaseAnalytics.instance.logEvent(
      name: 'user_profile_view',
      parameters: {
        'user_id': read(currentUserProvider)?.toJson().toString(),
        'viewed_user_id': params!['viewed_user_id'],
      },
    );
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
    final initialDate = read(birthDateProvider) ?? DateTime.now();
    read(birthDateProvider.notifier).state = await showDatePicker(
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
    read(playerPositionsProvider.notifier).update(
      (state) {
        if (state.length == 2 && isAdd) {
          Fluttertoast.showToast(msg: "Maximum of 2 positions only");

          return state;
        } else if (isAdd) {
          return [...state, position];
        } else {
          return [...state]..remove(position);
        }
      },
    );
  }
}
