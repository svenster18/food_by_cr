import 'package:flutter/material.dart';

import 'home_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 800) {
            return StartWebPage();
          } else {
            return StartMobilePage();
          }
        },
      );
  }
}

class StartMobilePage extends StatelessWidget {
  const StartMobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCD57C),
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset("images/dessert-box.png"),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  elevation: 0,
                  shape : RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0)
                  ),
                  margin: const EdgeInsets.all(24.0),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        Text(
                          "Temukan Dessert Box Kesukaanmu Disini",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          "Temukan dan coba dessert box terbaik kami",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 16.0),
                        SizedBox(
                          width: double.infinity,
                          height: 50.0,
                          child: FilledButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Mulai',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}

class StartWebPage extends StatelessWidget {
  const StartWebPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCD57C),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Image.asset("images/dessert-box.png")),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(120.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Card(
                      elevation: 0,
                      shape : RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0)
                      ),
                      margin: const EdgeInsets.all(24.0),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          children: [
                            Text(
                              "Temukan Dessert Box Kesukaanmu Disini",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              "Temukan dan coba dessert box terbaik kami",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(height: 16.0),
                            SizedBox(
                              width: double.infinity,
                              height: 50.0,
                              child: FilledButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomeScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Mulai',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}