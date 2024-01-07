import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:inheritednotifier_changenotifier_practice/extension.dart';
import 'package:inheritednotifier_changenotifier_practice/inherited_notifier.dart';
import 'package:inheritednotifier_changenotifier_practice/slider_notifier.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final SliderNotifier sliderNotifier = SliderNotifier();

    return Scaffold(
      appBar: AppBar(title: const Text('InheritedNotifier/ChangeNotifier'), centerTitle: true),
      body: SliderInheritedNotifier(
        notifier: sliderNotifier,
        child: Builder(
          builder: (context) {
            return Column(
              children: [
                Text('${sliderNotifier.readSliderValue}'),
                const Gap(5),
                Slider(
                  value: SliderInheritedNotifier.of(context),
                  onChanged: (val){sliderNotifier.writeSliderValue = val;},
                ),
                const Gap(10),
                Row(
                  children: [
                    Container(
                      height: 200, color: Colors.blue,
                    ),
                    Container(
                      height: 200, color: Colors.yellow,
                    )
                  ].expandEqually(SliderInheritedNotifier.of(context)).toList(),
                )
              ]
            );
          }
        ),
      )
    );
  }
}