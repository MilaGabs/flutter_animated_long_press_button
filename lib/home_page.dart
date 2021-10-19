import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  bool isPressed = false;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..addListener(
        () {
          listenerAnimation();
        },
      );

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom LongPress Button'),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: GestureDetector(
            onTapDown: (_) {
              setState(() {
                isPressed = !isPressed;
              });
            },
            onTapUp: (_) {
              setState(() {
                isPressed = !isPressed;
              });
            },
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: isPressed ? Colors.blue : Colors.red,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Stack(
                  children: [
                    SizedBox(
                      height: 200,
                      width: 200,
                      child: CircularProgressIndicator(
                        value: _controller.value,
                        color: Colors.yellow,
                        strokeWidth: 6,
                      ),
                    ),
                    const Center(
                      child: Icon(
                        Icons.power_settings_new,
                        color: Colors.white,
                        size: 100,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void listenerAnimation() {
    setState(() {
      if (_controller.value == 1.0) {
        isPressed = !isPressed;
      }
    });
  }
}
