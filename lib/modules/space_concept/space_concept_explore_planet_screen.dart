import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterchallenges/modules/space_concept/widgets/bottom_bar.dart';
import 'package:flutterchallenges/modules/space_concept/widgets/pick_to_option.dart';
import 'package:flutterchallenges/modules/space_concept/widgets/top_bar.dart';

import '../../gen/assets.gen.dart';

/// space concept widget
/// show Earth with diffrent animations
class SpaceConceptExplorePlanetScreen extends StatelessWidget {
  const SpaceConceptExplorePlanetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xff1B122E),
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: Color(0xff0A0A14),
        body: _ExploreBody(),
        bottomNavigationBar: BottomBar(),
        extendBody: true,
      ),
    );
  }
}

class _ExploreBody extends StatelessWidget {
  const _ExploreBody();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.topCenter,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image:
              AssetImage('assets/space_concept/explore_screen_background.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopBar(),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: Navigator.of(context).pop,
              child: Padding(
                padding: EdgeInsets.only(
                  left: size.width * .1,
                  bottom: 30,
                ),
                child: Assets.spaceConcept.arrowBack.svg(),
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  OverflowBox(
                    maxHeight: size.height * 1,
                    child: const Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        _Atmosphere(),
                        _PlanetMediaItem(),
                      ],
                    ),
                  ),
                  const _ExploreInformation(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ExploreInformation extends StatelessWidget {
  const _ExploreInformation();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * .1,
        vertical: 10,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              PickToExplore(number: 3, radius: 12, action: () {}),
              const SizedBox(width: 10),
              const Text(
                'Earth',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Mark',
                  color: Colors.white,
                  height: 0.9,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Habitant'
            ' sem ut sit fames in adipiscing. Ac magna donec egestas habitant.',
            style: TextStyle(
              fontSize: 12,
              fontFamily: 'Mark',
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class _Atmosphere extends StatelessWidget {
  const _Atmosphere();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return OverflowBox(
      maxHeight: size.height * 2,
      maxWidth: size.width * 2,
      child: Container(
        margin: EdgeInsets.only(top: size.height * .7),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: .3),
        ),
        width: size.width * 2,
      ),
    );
  }
}

class _PlanetMediaItem extends StatelessWidget {
  const _PlanetMediaItem();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Hero(
      tag: 'earth',
      child: Assets.spaceConcept.earthPlanetWithShadowClip
          .image(fit: BoxFit.contain, width: size.width),
    );
  }
}
