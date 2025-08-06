import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:scroll_pos/scroll_pos.dart';

class Home2View extends StatefulWidget {
  const Home2View({
    super.key,
  });

  @override
  State<Home2View> createState() => _Home2ViewState();
}

class _Home2ViewState extends State<Home2View> {
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  @override
  Widget build(BuildContext context) {
    final controller = ScrollPosController(itemCount: 5);
    return Scaffold(
      key: _key,
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Color(0xff1E1E20),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                spacing: 16,
                children: [
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Lottie.asset(
                        'assets/image_background.json',
                        height: 100,
                      ),
                      Image.asset(
                        'assets/my2.png',
                        height: 100,
                        fit: BoxFit.fitHeight,
                        // height: 500,
                      ),
                    ],
                  ),
                  Text(
                    "Monir Haider",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Color(0xff2B2B2C),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      "Software Engineer",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      'assets/my_logo.png',
                      height: 100,
                    ),
                  ),
                  Column(
                    spacing: 16,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        spacing: 8,
                        children: [
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Color(0xff2B2B2C),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(Icons.email_outlined),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'EMAIL',
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text('mdmonirhelale@gmail.com'),
                            ],
                          )
                        ],
                      ),
                      Row(
                        spacing: 8,
                        children: [
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Color(0xff2B2B2C),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(Icons.pin_drop_outlined),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'LOCATION',
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text('Dhaka, Bangladesh'),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.g_mobiledata),
                          Icon(Icons.close),
                          Icon(Icons.facebook_outlined),
                          Icon(Icons.link),
                          Icon(Icons.whatshot),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
