import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';

class PondoInfoDialog extends HookConsumerWidget {
  const PondoInfoDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasGcashState = useState(true);

    useEffect(() {
      ref.read(mixpanel)!.track("Viewed PondoInfoDialog");
      return;
    }, []);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "STEPS TO ADD TO PONDO",
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Use GCash"),
                  Checkbox(
                    activeColor: Colors.blue,
                    value: hasGcashState.value,
                    onChanged: (val) {
                      ref.read(mixpanel)!.track("Toggled useGcash to ${val!}");
                      hasGcashState.value = val;
                    },
                  ),
                ],
              ),
              const Divider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: (hasGcashState.value)
                    ? [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Text(
                                '1. Send GCash to the following number:'),
                            const Text(
                              '(Ikay bahala pilay imong ipa-PONDO)',
                              textAlign: TextAlign.center,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  '09164531565',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.copy),
                                  onPressed: () {
                                    ref
                                        .read(mixpanel)!
                                        .track("Gcash number copied");
                                    Clipboard.setData(
                                      const ClipboardData(text: "09164531565"),
                                    );
                                    Fluttertoast.showToast(
                                      msg: "Copied to clipboard",
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        // TODO: Fix launching of Kasado Facebook page
                        // const Text("2. Go to the Kasado "),
                        // RichText(
                        //   text: TextSpan(children: [
                        //     const TextSpan(
                        //       text: "2. Go to the ",
                        //       style: TextStyle(color: Colors.black),
                        //     ),
                        //     TextSpan(
                        //       text: 'Kasado FB Page',
                        //       style: const TextStyle(color: Colors.blue),
                        //       recognizer: TapGestureRecognizer()
                        //         ..onTap = () {
                        //           ref
                        //               .read(mixpanel)!
                        //               .track("Pressed Kasado page (S2)");
                        //           launch("https://bit.ly/kasado-2022");
                        //         },
                        //     ),
                        //   ]),
                        // ),
                        const Text(
                          "2. Go to the Kasado FB Page (Sa karon, isearch lng sa 'Kasado', nya pangitaa tong naay black version sa atong logo)",
                        ),
                        const SizedBox(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: const [
                            Text("3. Send a message with the following:"),
                            Text(" • Player's Kasado email"),
                            Text(" • GCash proof of payment (screenshot)"),
                          ],
                        ),
                      ]
                    : [
                        const Text(
                          "Ihatag ang ipa-PONDO ni \nFabian Pepito or Paolo Pepito",
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "OR",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Pwede pud mamalihug og migo nga nay GCash. Pahibaw lang sa Kasado email",
                          textAlign: TextAlign.center,
                        ),
                      ],
              ),
              const Divider(),
              Column(
                children: [
                  const Text(
                    'Contact for more info:',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      FaIcon(
                        FontAwesomeIcons.facebook,
                        color: Colors.black,
                        size: 20,
                      ),
                      SizedBox(width: 10),
                      // RichText(
                      //   textAlign: TextAlign.center,
                      //   text: TextSpan(
                      //     children: [
                      //       TextSpan(
                      //         text: 'Kasado',
                      //         style: const TextStyle(color: Colors.blue),
                      //         recognizer: TapGestureRecognizer()
                      //           ..onTap = () {
                      //             ref
                      //                 .read(mixpanel)!
                      //                 .track("Pressed Kasado page (Bottom)");
                      //             launch("https://bit.ly/kasado-2022");
                      //           },
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      Text("Kasado")
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
