import 'package:flutter/material.dart';
import 'package:stuventmobil/model/event.dart';

class EventWidget extends StatefulWidget {
  final Event event;

  const EventWidget({Key key, this.event}) : super(key: key);

  @override
  _EventWidgetState createState() => _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.event.title,
      child: FadeInImage.assetNetwork(
        placeholder: "assets/loading.gif",
        image: widget.event.imageURL,
        height: 320,
        width: 320,
        fit: BoxFit.cover,
      ),
    );
  }
}
