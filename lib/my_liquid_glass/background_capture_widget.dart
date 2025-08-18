import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';

class BackgroundCaptureWidget extends StatefulWidget {
  const BackgroundCaptureWidget(
      {super.key,
      required this.height,
      required this.width,
      required this.backgroundKey,
      this.initialPosition});

  final double height, width;
  final GlobalKey backgroundKey;
  final Offset? initialPosition;

  @override
  State<BackgroundCaptureWidget> createState() =>
      _BackgroundCaptureWidgetState();
}

extension RenderObjExt on RenderObject {
  ContainerLayer? get appLayer => layer;
}

class _BackgroundCaptureWidgetState extends State<BackgroundCaptureWidget> {
  late Offset position;
  bool isCapturing = false;
  ui.Image? capturedBackground;

  //zaczac od 9 minuty

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPersistentFrameCallback((d) {
      _captureBackground();
    });
    position = widget.initialPosition ?? Offset(100, 100);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: position.dy,
      left: position.dx,
      child: Draggable(
        feedback: SizedBox.square(),
        onDragUpdate: (details) {
          setState(() {
            // position = Offset(
            // position.dx + details.delta.dx, position.dy + details.delta.dy);
            position = position + details.delta;
          });
        },
        child: Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: Color.fromARGB(128, 255, 255, 255)),
            child: RawImage(
              image: capturedBackground,
              width: widget.width,
              height: widget.height,
            )),
      ),
    );
  }

  void _captureBackground() async {
    if (isCapturing || !mounted) return;

    isCapturing = true;
    try {
      final boundary = widget.backgroundKey.currentContext?.findRenderObject()
          as RenderRepaintBoundary?;
      final box = context.findRenderObject() as RenderBox?;

      if (boundary == null ||
          box == null ||
          !boundary.attached ||
          !boundary.hasSize ||
          !box.hasSize) {
        return;
      }

      final p1 = box.localToGlobal(Offset.zero);
      final p2 = box.localToGlobal(box.size.bottomRight(Offset.zero));
      final rect = Rect.fromPoints(p1, p2);

      final double pixelRatio = MediaQuery.of(context).devicePixelRatio;
      final OffsetLayer layer = boundary.appLayer as OffsetLayer;

      final ui.Image img = await layer.toImage(Rect.fromLTRB(0, 0, 200, 400),
          pixelRatio: pixelRatio);

      if (mounted) {
        capturedBackground?.dispose();
        capturedBackground = img;
      } else {
        capturedBackground?.dispose();
      }

      // print('capturing');
    } catch (e) {
      debugPrint('error capturing background: $e');
    } finally {
      isCapturing = false;
    }
  }
}
