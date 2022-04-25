import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kasado/app_router.dart';
import 'package:kasado/model/court/court.dart';
import 'package:kasado/ui/home/tabs/home/components/next_court_slot_details.dart';
import 'package:kasado/constants/extensions/string_extensions.dart';

class NextCourtSlotCard extends StatelessWidget {
  const NextCourtSlotCard({
    Key? key,
    required this.constraints,
    required this.court,
  }) : super(key: key);

  final BoxConstraints constraints;
  final Court court;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 10,
      ),
      child: Card(
        elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: InkWell(
          onTap: () => context.pushNamed(
            Routes.courtDetailsView,
            params: {'courtId': court.id},
          ),
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Column(
              children: [
                Hero(
                  tag: court.id,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: SizedBox(
                      height: constraints.maxHeight * 0.25,
                      width: constraints.maxWidth,
                      child: Image.network(
                        court.photoUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: constraints.maxHeight * 0.02),
                AutoSizeText(
                  court.name.toUpperCase(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                ),
                AutoSizeText(
                  court.location.address?.shortAddr ?? '',
                  maxLines: 1,
                  textAlign: TextAlign.center,
                ),
                const Divider(),
                NextCourtSlotDetails(
                  constraints: constraints,
                  court: court,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
