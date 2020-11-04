import 'package:flutter/material.dart';
import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';

class AccordionMenu extends StatefulWidget {
  @override
  _AccordionMenuState createState() => _AccordionMenuState();
}

class _AccordionMenuState extends State<AccordionMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurable Expansion Tile Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ConfigurableExpansionTile(
              borderColorStart: Colors.blue,
              borderColorEnd: Colors.orange,
              animatedWidgetFollowingHeader: const Icon(
                Icons.expand_more,
                color: const Color(0xFF707070),
              ),
              headerExpanded:
              Flexible(child: Center(child: Text("A Header Changed"))),
              header: Container(
                  color: Colors.transparent,
                  child: Center(child: Text("A Header"))),
              headerBackgroundColorStart: Colors.grey,
              expandedBackgroundColor: Colors.amber,
              headerBackgroundColorEnd: Colors.teal,
              children: [
                Row(
                  children: <Widget>[Text("CHILD 1")],
                ),
                Row(
                  children: <Widget>[Text("CHILD 2")],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
