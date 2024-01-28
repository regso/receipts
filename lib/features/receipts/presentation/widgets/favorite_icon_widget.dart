import 'package:flutter/material.dart';
import 'package:receipts/config/app_theme.dart';

class FavoriteIconWidget extends StatelessWidget {
  final int count;

  const FavoriteIconWidget({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    final clipper = _FlagCustomClipper();
    return CustomPaint(
      painter: _ClipShadowPainter(
        clipper: clipper,
        shadow: Shadow(
          blurRadius: 3,
          color: AppTheme.shadowColor,
          offset: const Offset(0, 2),
        ),
      ),
      child: ClipPath(
        clipper: clipper,
        child: Container(
          width: 60,
          height: 20,
          color: AppTheme.accentColor,
          child: Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Text('$count  ',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.inverseTextColor,
                )),
          ),
        ),
      ),
    );
  }
}

class _FlagCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(size.height, size.height / 2)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class _ClipShadowPainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;

  _ClipShadowPainter({required this.shadow, required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    var clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
