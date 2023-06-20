import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class flowers extends StatefulWidget {
  const flowers({Key? key}) : super(key: key);

  @override
  State<flowers> createState() => _flowersState();
}

class _flowersState extends State<flowers> {
  double speedMultiplier = 1.0;
  late SpeedController speedController;

  @override
  void initState() {
    super.initState();
    speedController = SpeedController(
      'CloseOpenClose',
      speedMultiplier: speedMultiplier,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Controller - Speed'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: RiveAnimation.asset(
                    'assets/flowers.riv',
                    fit: BoxFit.contain,
                    animations: const ['CloseOpenClose'],
                    controllers:  [speedController],
                  ),
                ),
              ),
              Slider(
                value: speedMultiplier,
                min: 0.5,
                max: 2.5,
                onChanged: (value) {
                  setState(() {
                    speedMultiplier = value;
                    speedController.speedMultiplier = speedMultiplier;
                    // animationTime = speedController.getAnimationTime();
                  });
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                child: const Text('Expert'),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SpeedController extends SimpleAnimation {
  double speedMultiplier;

  SpeedController(
      String animationName, {
        double mix = 1,
        this.speedMultiplier = 1,
      }) : super(animationName, mix: mix);

  @override
  void apply(RuntimeArtboard artboard, double elapsedSeconds) {
    if (instance == null || !instance!.keepGoing) {
      isActive = false;
    }
    double progressTime = elapsedSeconds * (3 - speedMultiplier);
    instance!.animation.apply(instance!.time, coreContext: artboard, mix: mix);
    instance!.advance(progressTime);
  }


}

void main() => runApp(
  MaterialApp(
    title: 'Lotus',
    home: const flowers(),
  ),
);