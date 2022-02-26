import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/repositories/user_info_repository.dart';
import 'package:kasado/logic/shared/view_model.dart';
import 'package:kasado/model/kasado_user_info/kasado_user_info.dart';

final playerManagerViewModel = Provider.autoDispose(
  (ref) => PlayerManagerViewModel(
    read: ref.read,
    userInfoRepo: ref.watch(userInfoRepositoryProvider),
  ),
);

class PlayerManagerViewModel extends ViewModel {
  PlayerManagerViewModel({
    required Reader read,
    required this.userInfoRepo,
  }) : super(read);

  final UserInfoRepository userInfoRepo;

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
}
