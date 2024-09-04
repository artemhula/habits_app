import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:habits/provider/habit_provider.dart';
import 'package:provider/provider.dart';

class StrikeWidget extends StatelessWidget {
  const StrikeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HabitProvider>(
      builder: (BuildContext context, HabitProvider provider, Widget? child) {
        if (provider.streak < 2) {
          return Container();
        }
        return Text(
          'Strike: ${provider.streak}',
        )
            .animate(onPlay: (controller) => controller.repeat())
            .shimmer(
                duration: const Duration(seconds: 2),
                color: Theme.of(context).colorScheme.tertiary)
            .animate()
            .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
            .slide();
      },
    );
  }
}
