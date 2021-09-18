import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/scoreBloc.dart';
import 'event/score.dart';

class EndScoring extends StatefulWidget {
  @override
  _EndScoreState createState() => _EndScoreState();
}

class _EndScoreState extends State<EndScoring> {
  _EndScoreState();

  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ArrowBoxes(),
        Container(
          height: 50,
          child: VerticalDivider(color: Colors.lightGreen, width: 12),
        ),
      ],
    );
  }
}

class ArrowBox extends StatelessWidget {
  final String boxText;
  final Color color;

  ArrowBox(this.boxText, this.color);

  @override
  Widget build(BuildContext context) {
    return new Container(
      constraints: BoxConstraints.tightFor(height: 30.0, width: 35.0),
      decoration: new BoxDecoration(
          color: color,
          border: new Border.all(
              color: Colors.white, width: 2.0, style: BorderStyle.solid)),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Text(boxText),
      ),
    );
  }
}

class EndTotal extends StatelessWidget {
  final String boxText;
  final Color color;

  EndTotal(this.boxText, this.color);

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text('EndScore'),
          ),
          Container(
            constraints: BoxConstraints.tightFor(height: 30.0, width: 75.0),
            decoration: new BoxDecoration(
                color: color,
                border: Border.all(
                    color: Colors.white, width: 2.0, style: BorderStyle.solid)),
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text(boxText),
            ),
          ),
        ],
      ),
    );
  }
}

class ScoreTotal {
  final String boxText;
  final Color color;

  ScoreTotal(this.boxText, this.color);

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Text('Total Score'),
            ),
          ),
          Container(
            constraints: BoxConstraints.tightFor(height: 30.0, width: 75.0),
            decoration: new BoxDecoration(
                color: color,
                border: Border.all(
                    color: Colors.white, width: 2.0, style: BorderStyle.solid)),
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text(boxText),
            ),
          ),
        ],
      ),
    );
  }
}

class ArrowBoxes extends StatelessWidget{
  int endCount;
  int boxCount;


  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: Container(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                child: Text('End 1'),
              ),
            ),
            Container(
              child: BlocConsumer<ScoreBloc, List<Score>>(
                buildWhen: (List<Score> previous, List<Score> current){
                  return true;
                },
                listenWhen: (List<Score> previous, List<Score> current){
                  if(current.length > previous.length){
                  return true;}
                  return false;
                },
                builder: (context, scoreList){
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.all(16),
                    itemCount: scoreList.length,
                    itemBuilder: (context, index){
                      return ArrowBox(
                        scoreList[index].score.toString(), Colors.grey[350]
                      );
                    },
                  );
                },
                listener: (BuildContext context, scoreList){

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
