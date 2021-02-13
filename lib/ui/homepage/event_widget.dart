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
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade700,
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Hero(
              tag: widget.event.title,
              child: FadeInImage.assetNetwork(
                placeholder: "assets/loading.gif",
                image: widget.event.imageURL,
                height: 320,
                width: 320,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
