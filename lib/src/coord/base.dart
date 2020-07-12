import 'dart:ui';

import 'package:meta/meta.dart';
import 'package:graphic/src/common/typed_map.dart';
import 'package:graphic/src/common/base_classes.dart';

enum CoordType {
  cartesian,
  polar,
}

class CoordState with TypedMap {
  Rect get plot => this['plot'] as Rect;
  set plot(Rect value) => this['plot'] = value;

  bool get transposed => this['transposed'] as bool ?? false;
  set transposed(bool value) => this['transposed'] = value;
}

abstract class CoordComponent<S extends CoordState> extends Component<S> {
  CoordComponent([TypedMap props]) : super(props) {
    assert(state.plot != null);
  }
  
  @protected
  List<double> get rangeX;

  @protected
  List<double> get rangeY;

  Offset convertPoint(Offset point);

  Offset invertPoint(Offset point);

  void setPlot(Rect plot) {
    state.plot = plot;
    onSetPlot();
  }

  @protected
  void onSetPlot() {}
}