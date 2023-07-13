import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = "LaFerrari";

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MainPage(title: title),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
        child: Stack(
          fit: StackFit.expand,
          children: [
            buildBackground(),
            Positioned(
              right: 8,
              top: 4,
              child: buildBookmark(),
            ),
            Center(
              child: buildTitle(),
            ),
            Align(
              alignment: const Alignment(0, 0.9),
              child: buildActions(),
            ),
            Positioned(
              left: -32,
              top: 20,
              child: buildBadge(),
            )
          ],
        ),
      ),
    );
  }

  Widget buildBadge() => RotationTransition(
        turns: const AlwaysStoppedAnimation(-45 / 360),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 32),
          color: Colors.white,
          child: const Text(
            "Popular",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      );

  Widget buildActions() => Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite_border, color: Colors.red),
            SizedBox(width: 8),
            Text(
              '27K',
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 32),
            Icon(Icons.share, color: Colors.blue),
            SizedBox(width: 8),
            Text(
              '3.2K',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );

  Widget buildTitle() {
    return (Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "LaFerrari",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 42),
          child: const Text(
            "The epitome of automotive excellence",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        )
      ],
    ));
  }

  Widget buildBookmark() => IconButton(
        icon: const Icon(
          Icons.bookmark_border,
          color: Colors.white,
          size: 40,
        ),
        onPressed: () {},
      );

  Widget buildBackground() => ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Container(
          color: Colors.black,
          child: Opacity(
            opacity: 0.8,
            child: Image.network(
              'https://www.hdcarwallpapers.com/walls/laferrari_sports_car-HD.jpg',
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      );
}
