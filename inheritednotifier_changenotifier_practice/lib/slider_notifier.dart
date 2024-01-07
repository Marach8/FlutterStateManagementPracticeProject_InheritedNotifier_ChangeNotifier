import 'package:flutter/material.dart';

class SliderNotifier extends ChangeNotifier{
  double _sliderValue = 0.0;
  get readSliderValue => _sliderValue;
  
  set writeSliderValue (double newValue){
    if(newValue != _sliderValue){
      _sliderValue = newValue; 
      notifyListeners();
    }
  }
}