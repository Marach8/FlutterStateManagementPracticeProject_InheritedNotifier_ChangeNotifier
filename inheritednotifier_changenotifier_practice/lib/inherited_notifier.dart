import 'package:flutter/material.dart';
import 'package:inheritednotifier_changenotifier_practice/slider_notifier.dart';

class SliderInheritedNotifier extends InheritedNotifier<SliderNotifier>{
  const SliderInheritedNotifier({
      Key? key, 
      required SliderNotifier notifier, 
      required Widget child
    }): super(child: child, key: key, notifier: notifier);

  static double of(BuildContext context) =>
    context.dependOnInheritedWidgetOfExactType<SliderInheritedNotifier>()
      ?.notifier?.readSliderValue ?? 0.0;
}