import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';


class SpeedyAnimation extends StatefulWidget {
  const SpeedyAnimation({Key? key}) : super(key: key);

  @override
  _SpeedyAnimationState createState() => _SpeedyAnimationState();
}

class _SpeedyAnimationState extends State<SpeedyAnimation> {
  double speedMultiplier = 1.0;
  bool isBirds1On = false;
  bool isBirds1Off = false;

  late RiveAnimationController _controller;
  late RiveAnimationController _controller1;
  late RiveAnimationController _controller2;
  late RiveAnimationController _controller3;

  @override
  void initState() {
    super.initState();
    _controller = OneShotAnimation(
      'Tall 1 Bird Off',
      autoplay: true,
    );
    _controller1 = OneShotAnimation(
      'Tall 2 Bird Off',
      autoplay: true,
    );
    _controller2 = OneShotAnimation(
      'Flock Off',
      autoplay: true,
    );
    _controller3 = OneShotAnimation(
      'Trio Off',
      autoplay: true,
    );
  }

  @override
  Widget build(BuildContext context) {
      List<RiveAnimationController<dynamic>> animationControllers = [];

      if (speedMultiplier >= 0.5 && speedMultiplier < 1) {
        animationControllers.add(SpeedController('MAIN Idle', speedMultiplier: speedMultiplier));
        animationControllers.add( _controller,);
      } else if (speedMultiplier >= 1.0 && speedMultiplier < 1.5) {
        // 根据不同的条件设置不同的 _controller
          animationControllers.add(SpeedController('MAIN Idle', speedMultiplier: speedMultiplier));
          animationControllers.add( _controller1,);
          animationControllers.add( _controller,);
      } else if (speedMultiplier >= 1.5 && speedMultiplier < 2.0) {
    animationControllers.add(SpeedController('MAIN Idle', speedMultiplier: speedMultiplier));
    animationControllers.add( _controller2,);
    animationControllers.add( _controller1,);
    animationControllers.add( _controller,);
      } else {
    animationControllers.add(SpeedController('MAIN Idle', speedMultiplier: speedMultiplier));
    animationControllers.add( _controller3,);
    animationControllers.add( _controller2,);
    animationControllers.add( _controller1,);
    animationControllers.add( _controller,);
      }
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
                    'assets/forest.riv',
                    fit: BoxFit.contain,
                    animations: const ['MAIN Idle'],
                    controllers:  [SpeedController('MAIN Idle', speedMultiplier: speedMultiplier)],
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
                  });
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                child: const Text('Expert'),
                onPressed: () => _controller,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class SpeedController extends SimpleAnimation {
  final double speedMultiplier;

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

    instance!
      ..animation.apply(instance!.time, coreContext: artboard, mix: mix)
      ..advance(elapsedSeconds * speedMultiplier);
  }
}


class RiveAnimationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rive Animation'),
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: 1.0, // 设置宽高比为1:1，可以根据需要进行调整
          child: RiveAnimation.asset(
            'assets/smoke.riv', // 替换为你的本地Rive动画文件路
            fit: BoxFit.contain, // 设置适配模式，这里使用`contain`来确保整个动画都可见，同时保持纵横比
            alignment: Alignment.center, // 设置动画在容器中的对齐方式
          ),
        ),
      ),
    );
  }
}

class StateMachineSkills extends StatefulWidget {
  const StateMachineSkills({Key? key}) : super(key: key);

  @override
  State<StateMachineSkills> createState() => _StateMachineSkillsState();
}

class _StateMachineSkillsState extends State<StateMachineSkills> {
  /// Tracks if the animation is playing by whether controller is running.
  bool get isPlaying => _controller?.isActive ?? false;

  Artboard? _riveArtboard;
  StateMachineController? _controller;
  SMIInput<double>? _levelInput;

  @override
  void initState() {
    super.initState();

    // Load the animation file from the bundle, note that you could also
    // download this. The RiveFile just expects a list of bytes.
    rootBundle.load('assets/forest.riv').then(
          (data) async {
        // Load the RiveFile from the binary data.
        final file = RiveFile.import(data);

        // The artboard is the root of the animation and gets drawn in the
        // Rive widget.
        final artboard = file.mainArtboard;
        var controller =
        StateMachineController.fromArtboard(artboard, 'MAIN Idle');
        if (controller != null) {
          artboard.addController(controller);
          _levelInput = controller.findInput('MAIN Idle');
          setState(() => _riveArtboard = artboard);
        };
        },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skills Machine'),
      ),
      body: Center(
        child: _riveArtboard == null
            ? const SizedBox()
            : Stack(
          children: [
            Positioned.fill(
              child: Rive(
                artboard: _riveArtboard!,
                fit: BoxFit.contain,
              ),
            ),
            Positioned.fill(
              bottom: 32,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ElevatedButton(
                    child: const Text('Beginner'),
                    onPressed: () => _levelInput,
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    child: const Text('Intermediate'),
                    onPressed: () => _levelInput,
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    child: const Text('Expert'),
                    onPressed: () => _levelInput,
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

// void main() => runApp(
//   MaterialApp(
//     title: 'forest',
//     home: const SpeedyAnimation(),
//   ),
// );