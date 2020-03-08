import 'dart:ui';

import 'package:vector_math/vector_math_64.dart' show Matrix4;

List<T> _cloneListAttr<T>(List<T> list) {
  if (list is List<List>) {
    final rst = <T>[];
    for (var subList in list) {
      rst.add([...(subList as List)] as T);
    }
    return rst;
  } else {
    return [...list];
  }
}

class Attrs {
  Attrs({
    double strokeAppendWidth,
    Matrix4 matrix,

    double x,
    double y,
    double r,

    bool isAntiAlias,
    Color color,
    BlendMode blendMode,
    PaintingStyle style,
    double strokeWidth,
    StrokeCap strokeCap,
    StrokeJoin strokeJoin,
    double strokeMiterLimit,
    MaskFilter maskFilter,
    FilterQuality filterQuality,
    Shader shader,
    ColorFilter colorFilter,
    ImageFilter imageFilter,
    bool invertColors,
  })
    : _attrs = {
      if (strokeAppendWidth != null) 'strokeAppendWidth': strokeAppendWidth,
      if (matrix != null) 'matrix': matrix,
      if (x != null) 'x': x,
      if (y != null) 'y': y,
      if (r != null) 'r': r,
      if (isAntiAlias != null) 'isAntiAlias': isAntiAlias,
      if (color != null) 'color': color,
      if (blendMode != null) 'blendMode': blendMode,
      if (style != null) 'style': style,
      if (strokeWidth != null) 'strokeWidth': strokeWidth,
      if (strokeCap != null) 'strokeCap': strokeCap,
      if (strokeJoin != null) 'strokeJoin': strokeJoin,
      if (strokeMiterLimit != null) 'strokeMiterLimit': strokeMiterLimit,
      if (maskFilter != null) 'maskFilter': maskFilter,
      if (filterQuality != null) 'filterQuality': filterQuality,
      if (shader != null) 'shader': shader,
      if (colorFilter != null) 'colorFilter': colorFilter,
      if (imageFilter != null) 'imageFilter': imageFilter,
      if (invertColors != null) 'invertColors': invertColors,
    };

  final Map<String, Object> _attrs;

  // element attrs

  bool get strokeAppendWidth => _attrs['strokeAppendWidth'] as bool;
  set strokeAppendWidth(bool value) => _attrs['strokeAppendWidth'] = value;

  Matrix4 get matrix => _attrs['matrix'] as Matrix4;
  set matrix(Matrix4 value) => _attrs['matrix'] = value;

  // shape attrs

  double get x => _attrs['x'] as double;
  set x(double value) => _attrs['x'] = value;

  double get y => _attrs['y'] as double;
  set y(double value) => _attrs['y'] = value;

  double get r => _attrs['r'] as double;
  set r(double value) => _attrs['r'] = value;

  // Paint attrs, api refers to flutter 1.12.13

  bool get isAntiAlias => _attrs['isAntiAlias'] as bool;
  set isAntiAlias(bool value) => _attrs['isAntiAlias'] = value;

  Color get color => _attrs['color'] as Color;
  set color(Color value) => _attrs['color'] = value;

  BlendMode get blendMode => _attrs['blendMode'] as BlendMode;
  set blendMode(BlendMode value) => _attrs['blendMode'] = value;

  PaintingStyle get style => _attrs['style'] as PaintingStyle;
  set style(PaintingStyle value) => _attrs['style'] = value;

  double get strokeWidth => _attrs['strokeWidth'] as double;
  set strokeWidth(double value) => _attrs['strokeWidth'] = value;

  StrokeCap get strokeCap => _attrs['strokeCap'] as StrokeCap;
  set strokeCap(StrokeCap value) => _attrs['strokeCap'] = value;

  StrokeJoin get strokeJoin => _attrs['strokeJoin'] as StrokeJoin;
  set strokeJoin(StrokeJoin value) => _attrs['strokeJoin'] = value;

  double get strokeMiterLimit => _attrs['strokeMiterLimit'] as double;
  set strokeMiterLimit(double value) => _attrs['strokeMiterLimit'] = value;

  MaskFilter get maskFilter => _attrs['maskFilter'] as MaskFilter;
  set maskFilter(MaskFilter value) => _attrs['maskFilter'] = value;

  FilterQuality get filterQuality => _attrs['filterQuality'] as FilterQuality;
  set filterQuality(FilterQuality value) => _attrs['filterQuality'] = value;

  Shader get shader => _attrs['shader'] as Shader;
  set shader(Shader value) => _attrs['shader'] = value;

  ColorFilter get colorFilter => _attrs['colorFilter'] as ColorFilter;
  set colorFilter(ColorFilter value) => _attrs['colorFilter'] = value;

  ImageFilter get imageFilter => _attrs['imageFilter'] as ImageFilter;
  set imageFilter(ImageFilter value) => _attrs['imageFilter'] = value;

  bool get invertColors => _attrs['invertColors'] as bool;
  set invertColors(bool value) => _attrs['invertColors'] = value;

  // Tool members.

  Iterable<String> get keys => _attrs.keys;

  Attrs mix(Attrs src) => this.._attrs.addAll(src._attrs);

  Attrs clone() {
    final rst = Attrs();
    for (var k in _attrs.keys) {
      if (_attrs[k] is List) {
        rst[k] = _cloneListAttr(_attrs[k]);
      } else if(_attrs[k] is Matrix4) {
        rst[k] = (_attrs[k] as Matrix4).clone();
      } else {
        rst[k] = _attrs[k];
      }
    }
    return rst;
  }

  void applyTo(Paint paint) {
    if (blendMode != null) {
      paint.blendMode = blendMode;
    }
    if (color != null) {
      paint.color = color;
    }
    if (colorFilter != null) {
      paint.colorFilter = colorFilter;
    }
    if (filterQuality != null) {
      paint.filterQuality = filterQuality;
    }
    if (imageFilter != null) {
      paint.imageFilter = imageFilter;
    }
    if (invertColors != null) {
      paint.invertColors = invertColors;
    }
    if (isAntiAlias != null) {
      paint.isAntiAlias = isAntiAlias;
    }
    if (maskFilter != null) {
      paint.maskFilter = maskFilter;
    }
    if (shader != null) {
      paint.shader = shader;
    }
    if (strokeCap != null) {
      paint.strokeCap = strokeCap;
    }
    if (strokeJoin != null) {
      paint.strokeJoin = strokeJoin;
    }
    if (strokeMiterLimit != null) {
      paint.strokeMiterLimit = strokeMiterLimit;
    }
    if (strokeWidth != null) {
      paint.strokeWidth = strokeWidth;
    }
    if (style != null) {
      paint.style = style;
    }
  }

  Object operator [](String k) => _attrs[k];

  void operator []=(String k, Object v) => _attrs[k] = v;
}