import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/home/home_view_model.dart';

class HomeView extends HookConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(homeViewModel);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.logout),
                onPressed: model.signOut,
              )
            ],
          ),
          body: Center(
            child: ListView(
              children: [
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 10,
                  ),
                  child: SizedBox(
                    height: constraints.maxHeight * 0.4,
                    width: constraints.maxWidth * 0.85,
                    child: Card(
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: SizedBox(
                                  height: constraints.maxHeight * 0.2,
                                  width: constraints.maxWidth,
                                  child: Image.network(
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHonQRDPCLA0zXvTzoThs-Q2hQ9s5lg3RBmA&usqp=CAU",
                                  ),
                                ),
                              ),
                              SizedBox(height: constraints.maxHeight * 0.02),
                              const Text(
                                'SKINA JAPAN BASKETBALL COURT',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Divider(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 50.0,
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.people),
                                        SizedBox(
                                            width: constraints.maxWidth * 0.05),
                                        const Text('8 / 15')
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.calendar_today),
                                        SizedBox(
                                          width: constraints.maxWidth * 0.05,
                                        ),
                                        const Text('Feb 15 / 3:00 - 4:00')
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.money),
                                        SizedBox(
                                          width: constraints.maxWidth * 0.05,
                                        ),
                                        const Text('₱ 50')
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 10,
                  ),
                  child: SizedBox(
                    height: constraints.maxHeight * 0.4,
                    width: constraints.maxWidth * 0.85,
                    child: Card(
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: SizedBox(
                                  height: constraints.maxHeight * 0.2,
                                  width: constraints.maxWidth,
                                  child: Image.network(
                                    "https://i.pinimg.com/originals/80/9f/af/809faf105f55a2830918b9d859bd3958.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: constraints.maxHeight * 0.02),
                              const Text(
                                'SKINA CHINA BASKETBALL COURT',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Divider(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 50.0,
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.people),
                                        SizedBox(
                                            width: constraints.maxWidth * 0.05),
                                        const Text('12 / 15')
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.calendar_today),
                                        SizedBox(
                                          width: constraints.maxWidth * 0.05,
                                        ),
                                        const Text('Feb 15 / 4:00 - 5:00')
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.money),
                                        SizedBox(
                                          width: constraints.maxWidth * 0.05,
                                        ),
                                        const Text('₱ 20')
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
