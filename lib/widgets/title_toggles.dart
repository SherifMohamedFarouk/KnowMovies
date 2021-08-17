import 'package:flutter/material.dart';
import 'package:knovies/config/palette.dart';
import 'package:knovies/getx_controller/getx_controllers.dart';
import 'package:logger/logger.dart';
import 'package:toggle_switch/toggle_switch.dart';

class TitleWithToggle extends StatelessWidget {
  const TitleWithToggle({
    Key? key,
    required this.screenControllers,
    required this.title,
    this.toggle = true,
    this.movieType = true,
  }) : super(key: key);

  final GetxControllers screenControllers;
  final String title;
  final bool toggle;

  final bool movieType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40.0, 8.0, 0.0, 8.0),
      child: Align(
          alignment: Alignment.topLeft,
          child: Row(
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 20.0),
              ),
              const SizedBox(
                width: 20.0,
              ),
              toggle
                  ? (movieType ? moivesToggleSwitch : seriesToggleSwitch)
                  : SizedBox.shrink(),
            ],
          )),
    );
  }

  ToggleSwitch get moivesToggleSwitch {
    return ToggleSwitch(
      minWidth: 80.0,
      cornerRadius: 10.0,
      activeBgColors: [
        [Colors.amber],
        [Colors.amber]
      ],
      activeFgColor: Colors.black,
      inactiveBgColor: Palette.shadeyYellow,
      inactiveFgColor: Palette.toggleColor,
      initialLabelIndex: 1,
      totalSwitches: 2,
      animate: true,
      labels: ['Today', 'Weekly'],
      radiusStyle: true,
      onToggle: (index) {
        print('switched to: $index');
        index == 0
            ? screenControllers.fetchMoviesTrendingList("day","moive")
            : screenControllers.fetchMoviesTrendingList("week","moive");
        var logger = Logger();
        logger.d(screenControllers.moviesType.value);
      },
    );
  }

  ToggleSwitch get seriesToggleSwitch {
    return ToggleSwitch(
      minWidth: 80.0,
      cornerRadius: 10.0,
      activeBgColors: [
        [Colors.amber],
        [Colors.amber]
      ],
      activeFgColor: Colors.black,
      inactiveBgColor: Colors.white,
      inactiveFgColor: Colors.black,
      initialLabelIndex: 1,
      totalSwitches: 2,
      labels: ['Today', 'Weekly'],
      radiusStyle: true,
      onToggle: (index) {
        print('switched to: $index');
        index == 0
            ? screenControllers.fetchSeriesTrendingList("day","tv")
            : screenControllers.fetchSeriesTrendingList("week","tv");
        var logger = Logger();
        logger.d(screenControllers.moviesType.value);
      },
    );
  }
}
