import 'package:flutter/material.dart';

class NumericCounterButton extends StatefulWidget {
  final int minValue;
  final int maxValue;
  int counterValue;

  final ValueChanged<int> onChanged;

  NumericCounterButton(
      {Key key,
      this.minValue = 0,
      this.maxValue = 10,
      this.onChanged,
      this.counterValue = 1})
      : super(key: key);

  @override
  State<NumericCounterButton> createState() => _NumericCounterButtonState();
}

class _NumericCounterButtonState extends State<NumericCounterButton> {
  // int counter = widget.counterValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Select Quantity',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.remove_circle_outline,
                    color: Colors.black,
                  ),
                  padding: EdgeInsets.only(left: 0, right: 25, bottom: 0),
                  iconSize: 24.0,
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
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.add_circle_outline,
                    color: Colors.black,
                  ),
                  padding: EdgeInsets.only(left: 25, right: 0),
                  iconSize: 24.0,
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
        ],
      ),
    );
  }
}
