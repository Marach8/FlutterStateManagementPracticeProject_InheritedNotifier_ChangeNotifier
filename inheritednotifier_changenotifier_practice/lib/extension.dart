import 'package:flutter/material.dart';

extension Marach on Iterable<Widget>{
  Iterable<Widget> expandEqually(double opacity) => 
    map<Widget>((widget) => Expanded(child: Opacity(opacity: opacity, child: widget,),));
}