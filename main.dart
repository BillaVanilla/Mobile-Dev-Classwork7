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
AnimationController _animationController; 


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
child: Image.network(
'Sonic Adventures.png',
    ),
  ),
),
floatingActionButton: FloatingActionButton(
onPressed: toggleVisibility,
child: Icon(Icons.play_arrow),
backgroundColor: Colors.red,
      ),
    );
  }
}
