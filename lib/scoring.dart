import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Image;
import 'package:image_picker/image_picker.dart';
import 'package:image_pixels/image_pixels.dart';
import 'package:pineapple_target/bloc/score_event.dart';
import "arrow_mark.dart";
import 'game.dart';
import 'end_score.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pineapple_target/event/score.dart';
import 'package:pineapple_target/bloc/scoreBloc.dart';

class ScoringScreen extends StatefulWidget {
  const ScoringScreen({Key key, this.game}) : super(key: key);
  final Game game;

  @override
  _ScoringScreenState createState() => _ScoringScreenState();
}

class _ScoringScreenState extends State<ScoringScreen> {
  final picker = ImagePicker();
  AssetImage scoringImage = AssetImage('assets/wa_5_ring.png');

  Positioned dropper = Positioned(
    child: Container(width: 0.0, height: 0.0),
  );
  Color targetRingColor;
  int currentSelection;

  @override
  Widget build(BuildContext context) {
    scoringImage = AssetImage('assets/${widget.game.image}');
    //print(scoringImage);
    return Scaffold(
        //appBar: AppBar(title: Text(widget.game.title)),
        body: Center(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 4),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1.0),
                ),
              ),
              child: EndScoring(),
            ),
            Stack(
              children: <Widget>[
                ImagePixels(
                    imageProvider: scoringImage,
                    builder: (BuildContext context, ImgDetails img) {
                      return GestureDetector(
                        child: Image(image: scoringImage),
                        onPanUpdate: (DragUpdateDetails details) {
                          _screenTouched(
                              details, img, context.findRenderObject());
                        },
                        onTapDown: (TapDownDetails details) {
                          _screenTouched(
                              details, img, context.findRenderObject());
                        },
                      );
                    }),
                dropper,
              ],
            ),
          ],
        ),
      ),
    ));
  }

  void _screenTouched(dynamic details, ImgDetails img, RenderBox box) {
    double widgetScale = box.size.width / img.width;
    final Offset localOffset = box.globalToLocal(details.globalPosition);
    var x = (localOffset.dx / widgetScale).round();
    var y = (localOffset.dy / widgetScale).round();
    bool flippedX = box.size.width -localOffset.dx < ArrowMark.totalWidth;
    bool flippedY = localOffset.dy < ArrowMark.totalHeight;
    if (box.size.height - localOffset.dy > 0 && localOffset.dy > 0) {
      targetRingColor= img.pixelColorAt(x,y);
      setState(() {
        createDropper(localOffset.dx, box.size.height -localOffset.dy,
            img.pixelColorAt(x,y), flippedX, flippedY);
      });
    }
    if(targetRingColor == Color(0xff00b4e4)){
      currentSelection = 6;
    }
    else if(targetRingColor == Color(0xffee323b)){
      currentSelection = 8;
    }
    else if(targetRingColor == Color(0xffffe552)){
      currentSelection = 10;
    }

    BlocProvider.of<ScoreBloc>(context).add(ScoreEvent.add(Score(currentSelection)));
  }

  void createDropper(left, bottom, Color colour,bool flipX, bool flipY ){
    dropper = Positioned(
      left:left,
      bottom: bottom,
      child: ArrowMark(colour,flipX,flipY)
    );
  }
}
