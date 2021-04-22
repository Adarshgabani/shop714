import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  final int minValue;
  final int maxValue;
  int counterValue;
  final ValueChanged<int> onChanged;

  Counter(
      {Key key,
      this.minValue = 0,
      this.maxValue = 10,
      this.onChanged,
      this.counterValue = 1})
      : super(key: key);

  @override
  State<Counter> createState() => CounterState();
}

class CounterState extends State<Counter> {
  // int counter = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.all(0),
      child: SizedBox(
        height: 20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              constraints: BoxConstraints(maxWidth: 50),
              alignment: Alignment.topLeft,
              icon: Icon(
                Icons.remove_circle_outline,
                color: Colors.black,
              ),
              padding: EdgeInsets.only(left: 0, right: 10, bottom: 0),
              iconSize: 20.0,
              color: Theme.of(context).primaryColor,
              onPressed: () {
                setState(() {
                  if (widget.counterValue > widget.minValue) {
                    widget.counterValue--;
                  }
                  widget.onChanged(widget.counterValue);
                });
              },
            ),
            Text(
              '${widget.counterValue}',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              constraints: BoxConstraints(maxWidth: 50),
              icon: Icon(
                Icons.add_circle_outline,
                color: Colors.black,
              ),
              padding: EdgeInsets.only(left: 10, right: 0),
              iconSize: 20.0,
              color: Theme.of(context).primaryColor,
              onPressed: () {
                setState(() {
                  if (widget.counterValue < widget.maxValue) {
                    widget.counterValue++;
                  }
                  widget.onChanged(widget.counterValue);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
