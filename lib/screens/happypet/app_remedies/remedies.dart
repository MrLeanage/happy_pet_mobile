import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';

class Remedies extends KFDrawerContent {
  Remedies({
    Key? key,
  });

  @override
  _RemediesState createState() => _RemediesState();
}

class _RemediesState extends State<Remedies> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  child: Material(
                    shadowColor: Colors.transparent,
                    color: Colors.transparent,
                    child: IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.black,
                      ),
                      onPressed: widget.onMenuPressed,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Remedies'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}