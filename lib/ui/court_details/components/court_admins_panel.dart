import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/admin/court_manager/court_admin_state.dart';
import 'package:kasado/model/court/court.dart';
import 'package:kasado/ui/shared/loading_widget.dart';

class CourtAdminsPanel extends HookConsumerWidget {
  const CourtAdminsPanel({
    Key? key,
    required this.court,
  }) : super(key: key);

  final Court court;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // jsonEncode to pass object as String (Primitive data types only for
    // provider's .family
    final courtAdminsStream = ref.watch(
      courtAdminsListProvider(jsonEncode(court.toJson())),
    );

    return courtAdminsStream.when(
      error: (e, _) => Text(e.toString()),
      loading: () => const LoadingWidget(),
      data: (courtAdmins) => ListView.builder(
        itemCount: courtAdmins.length,
        itemBuilder: (context, i) {
          final admin = courtAdmins[i];
          return ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(admin.photoUrl!),
            ),
            title: Text(admin.displayName!),
          );
        },
      ),
    );
  }
}
