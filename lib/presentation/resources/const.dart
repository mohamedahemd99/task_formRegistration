import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:math'as math;
TextFormField buildTextFormField(
    BuildContext context, String title, TextEditingController ctr,
    {TextInputType? inputType,
      TextEditingController ?confirmedPassword,
      isPassword = false,
      isConfirmedPassword = false,
      email=false,
      precentage = false}) {
  return TextFormField(
    controller: ctr,
    keyboardType: inputType,
    obscureText: isPassword,
    decoration: InputDecoration(
      hintText: title,
      filled: true,
      contentPadding:const  EdgeInsets.all(16),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return  AppLocalizations.of(context)!.pleaseCompleteTheData;
      }else if(isConfirmedPassword&&value!=confirmedPassword!.text){
        return  AppLocalizations.of(context)!.passwordDoesNotMatch;
      }
      return null;
    },
  );
}


enum CircleAlignment {
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
}

class QuarterCircle extends StatelessWidget {
  final CircleAlignment circleAlignment;
  final Color color;

  const QuarterCircle({
    this.color = Colors.grey,
    this.circleAlignment = CircleAlignment.topLeft,
    Key ?key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: ClipRect(
        child: CustomPaint(
          painter: QuarterCirclePainter(
            circleAlignment: circleAlignment,
            color: color,
          ),
        ),
      ),
    );
  }
}

class QuarterCirclePainter extends CustomPainter {
  final CircleAlignment ?circleAlignment;
  final Color? color;

  const QuarterCirclePainter({this.circleAlignment, this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final radius = math.min(size.height, size.width);
    final offset = circleAlignment == CircleAlignment.topLeft
        ? Offset(.0, .0)
        : circleAlignment == CircleAlignment.topRight
        ? Offset(size.width, .0)
        : circleAlignment == CircleAlignment.bottomLeft
        ? Offset(.0, size.height)
        : Offset(size.width, size.height);
    canvas.drawCircle(offset, radius, Paint()..color = color!);
  }

  @override
  bool shouldRepaint(QuarterCirclePainter oldDelegate) {
    return color == oldDelegate.color &&
        circleAlignment == oldDelegate.circleAlignment;
  }
}