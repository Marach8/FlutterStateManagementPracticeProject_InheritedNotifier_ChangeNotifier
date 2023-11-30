import 'package:flutter/material.dart';
import 'package:gap/gap.dart';


void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.blue),
        useMaterial3: true
      ),
      home: const HomePage(),
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
                  onChanged: (value){sliderNotifier.writeSliderValue = value;},
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

extension Marach on Iterable<Widget>{
  Iterable<Widget> expandEqually(double opacity) => 
    map<Widget>((widget) => Expanded(child: Opacity(opacity: opacity, child: widget, ),));
}


class SliderNotifier extends ChangeNotifier{
  double _sliderValue = 0.0;
  get readSliderValue => _sliderValue;
  set writeSliderValue (double newValue){
    if(newValue != _sliderValue){_sliderValue = newValue; notifyListeners();}
  }
}

final SliderNotifier sliderNotifier = SliderNotifier();

class SliderInheritedNotifier extends InheritedNotifier<SliderNotifier>{
  const SliderInheritedNotifier({Key? key, required SliderNotifier notifier, required Widget child}): 
    super(child: child, key: key, notifier: notifier);

  static double of(BuildContext context) =>
    context.dependOnInheritedWidgetOfExactType<SliderInheritedNotifier>()?.notifier?.readSliderValue ?? 0.0;
}