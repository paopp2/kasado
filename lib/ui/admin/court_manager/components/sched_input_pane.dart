import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/constants/date_time_related_constants.dart';
import 'package:kasado/logic/admin/court_manager/court_admin_controller.dart';
import 'package:kasado/logic/shared/kasado_utils.dart';
import 'package:kasado/model/court_sched/court_sched.dart';
import 'package:kasado/ui/admin/court_manager/components/court_sched_input_dialog.dart';

class SchedInputPane extends HookConsumerWidget {
  const SchedInputPane({
    Key? key,
    required this.controller,
    required this.courtSchedList,
    required this.isSpecial,
  }) : super(key: key);

  final CourtAdminController controller;
  final List<CourtSched> courtSchedList;
  final bool isSpecial;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final utils = ref.watch(kasadoUtilsProvider);

    return Column(
      children: [
        TextButton(
          child: Text(isSpecial ? "Add Special Sched" : "Add Sched"),
          onPressed: () => showDialog(
            context: context,
            builder: (_) => CourtSchedInputDialog(
              controller: controller,
              isSpecial: isSpecial,
            ),
          ),
          style: TextButton.styleFrom(foregroundColor: Colors.green),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: courtSchedList.length,
            itemBuilder: (context, i) {
              final sched = courtSchedList[i];

              return ListTile(
                title: Text("${(isSpecial) ? utils.getDateFormat(
                    sched.timeRange.startsAt,
                    showYear: true,
                  ) : weekdaysStringList[sched.weekdayIndex]} / ${utils.getTimeRangeFormat(sched.timeRange)}"),
                subtitle: (!isSpecial)
                    ? Text(
                        "${utils.getDateFormat(sched.timeRange.startsAt)} - ${utils.getDateFormat(sched.endDate, showYear: true)}")
                    : null,
                trailing: IconButton(
                  onPressed: () => controller.removeFromCourtSchedList(
                    sched: sched,
                    isSpecial: isSpecial,
                  ),
                  icon: const Icon(Icons.delete),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
