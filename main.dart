import 'package:flutter/material.dart';
void main() {
runApp(MyApp());
}
class MyApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
return MaterialApp(
home: SonicAnimation(),
    );
  }
}

class SonicAnimation extends StatefulWidget {
@override
_SonicAnimationState createState() => _SonicAnimationState();
}
class _SonicAnimationState extends State<SonicAnimation> with SingleTickerProviderStateMixin{
bool _isGoingFast = true;
bool _isVisible = true;
late AnimationController _animationController; 


void initState(){
  super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5), // Default slow speed
    )..repeat();
}

@override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

void toggleVisibility() {
setState(() {
_isVisible = !_isVisible;
  });
}

 void toggleSpeed() {
    setState(() {
      _isGoingFast = !_isGoingFast;
      if (_isGoingFast) {
        _animationController.duration = Duration(seconds: 1); // Sonic is going at a Fast speed
      } else {
        _animationController.duration = Duration(seconds: 8); // Sonic is going at a Slow speed
      }
      _animationController.repeat(); // Restart animation
    });
  }

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text('Fading and Rotating Sonic Animation'),
),
body: Center(
child: AnimatedOpacity(
opacity: _isVisible ? 1.0 : 0.0,
duration: Duration(seconds: 3),
child: RotationTransition(
            turns: _animationController.drive(Tween(begin: 0.0, end: 1.0)),
            child: Image.network(
              'sonic_adventures.png', // Use a valid URL
        ),
    ),
  ),
),
floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: toggleVisibility,
            child: Icon(Icons.visibility),
            backgroundColor: Colors.red,
            heroTag: "toggleVisibility",
          ),
          
          SizedBox(height: 20),
          FloatingActionButton(
            onPressed: toggleSpeed,
            child: Icon(Icons.speed),
            backgroundColor: Colors.blue,
            heroTag: "Sonic Go Fast!!!",
          ),
        ],
      ),
    );
  }
}

