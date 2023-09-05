import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterchallenges/gen/assets.gen.dart';
import 'package:flutterchallenges/navigation/routes.dart';

class SpaceConceptOnboardingScreen extends StatefulWidget {
  const SpaceConceptOnboardingScreen({super.key});

  @override
  State<SpaceConceptOnboardingScreen> createState() =>
      _SpaceConceptOnboardingScreenState();
}

class _SpaceConceptOnboardingScreenState
    extends State<SpaceConceptOnboardingScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom],
    );
  }

  @override
  Widget build(BuildContext context) {
    return const AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: _BodyOnboarding(),
        ),
      ),
    );
  }
}

class _BodyOnboarding extends StatelessWidget {
  const _BodyOnboarding();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _SpaceElementTitle(),
        _AstronauteIcon(),
        _IntroductionSlider(),
      ],
    );
  }
}

class _IntroductionSlider extends StatefulWidget {
  const _IntroductionSlider();

  @override
  _IntroductionSliderState createState() => _IntroductionSliderState();
}

class _IntroductionSliderState extends State<_IntroductionSlider> {
  late final PageController _pageController;
  bool _canPrevious = true;
  bool _canNext = true;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  Future<void> updatePosition(int position) async {
    await _pageController.animateToPage(
      position,
      duration: kThemeAnimationDuration,
      curve: Curves.ease,
    );
  }

  Future<void> _previousPage() async {
    await _pageController.previousPage(
      duration: kThemeAnimationDuration,
      curve: Curves.ease,
    );
  }

  Future<void> _nextPage() async {
    await _pageController.nextPage(
      duration: kThemeAnimationDuration,
      curve: Curves.ease,
    );
  }

  void _onPageChanged(int index) {
    if (index == 0) {
      _canNext = true;
      _canPrevious = false;
    } else if (index == 2) {
      _canNext = false;
      _canPrevious = true;
    } else {
      _canNext = true;
      _canPrevious = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .1,
              ),
              child: Stack(
                children: [
                  Positioned(
                    child: PageView(
                      onPageChanged: _onPageChanged,
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _pageController,
                      children: const <Widget>[
                        _FirstStep(),
                        _SecondStep(),
                        _ThirdStep(),
                      ],
                    ),
                  ),
                  Positioned(
                    child: Row(
                      children: [
                        Expanded(
                          child: Visibility(
                            visible: _canPrevious,
                            child: GestureDetector(
                              onTap: _previousPage,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Assets.spaceConcept.leftArrow.svg(),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(
                          flex: 4,
                        ),
                        Expanded(
                          child: Visibility(
                            visible: _canNext,
                            child: GestureDetector(
                              onTap: _nextPage,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Assets.spaceConcept.rightArrow.svg(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .1,
              vertical: MediaQuery.of(context).size.height * .03,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed(Routes.spaceConceptIntro),
                  child: const Text(
                    'Skip Step',
                    style: TextStyle(
                      color: Color(0xffBBBBBB),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Mark',
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    minimumSize: const Size(105, 34),
                  ),
                  onPressed: () => !_canNext
                      ? Navigator.of(context)
                          .pushNamed(Routes.spaceConceptIntro)
                      : updatePosition(_pageController.page!.toInt() + 1),
                  child: Text(
                    !_canNext ? 'Done' : 'Next',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Mark',
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

class _FirstStep extends StatelessWidget {
  const _FirstStep();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * .1,
      ),
      child: const Row(
        children: [
          Spacer(),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Explore',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Mark',
                  ),
                ),
                Text(
                  'Universe',
                  style: TextStyle(fontSize: 40, fontFamily: 'Mark'),
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                  'Habitant sem ut sit fames in adipiscing. Ac magna donec '
                  'egestas habitant.',
                  style: TextStyle(fontSize: 12, fontFamily: 'Mark'),
                ),
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}

class _SecondStep extends StatelessWidget {
  const _SecondStep();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: <Widget>[
        Spacer(),
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Explore',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Mark',
                ),
              ),
              Text(
                'Universe',
                style: TextStyle(fontSize: 40, fontFamily: 'Mark'),
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                'Habitant sem ut sit fames in adipiscing. Ac magna donec '
                'egestas habitant.',
                style: TextStyle(fontSize: 12, fontFamily: 'Mark'),
              ),
            ],
          ),
        ),
        Spacer(),
      ],
    );
  }
}

class _ThirdStep extends StatelessWidget {
  const _ThirdStep();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * .1,
      ),
      child: const Row(
        children: [
          Spacer(),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Explore',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Mark',
                  ),
                ),
                Text(
                  'Universe',
                  style: TextStyle(fontSize: 40, fontFamily: 'Mark'),
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                  'Habitant sem ut sit fames in adipiscing. Ac magna donec '
                  'egestas habitant.',
                  style: TextStyle(fontSize: 12, fontFamily: 'Mark'),
                ),
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}

class _AstronauteIcon extends StatelessWidget {
  const _AstronauteIcon();

  @override
  Widget build(BuildContext context) {
    return Assets.spaceConcept.onboarding.svg(
      fit: BoxFit.fitWidth,
      height: MediaQuery.of(context).size.height * .33,
      width: double.infinity,
    );
  }
}

class _SpaceElementTitle extends StatelessWidget {
  const _SpaceElementTitle();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * .08,
        bottom: 20,
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Space',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              fontFamily: 'Mark',
            ),
          ),
          Text(
            'Element',
            style: TextStyle(fontSize: 35, fontFamily: 'Mark'),
          ),
        ],
      ),
    );
  }
}
