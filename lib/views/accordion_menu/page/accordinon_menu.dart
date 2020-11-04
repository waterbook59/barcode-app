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
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
        Padding(
        padding: const EdgeInsets.all(8.0),
        child: ConfigurableExpansionTile(
            borderColorStart: Colors.blue,
            borderColorEnd: Colors.orange,
            animatedWidgetFollowingHeader: const Icon(
              Icons.expand_more,
              color: const Color(0xFF707070),
            ),
            headerExpanded:
            Flexible(child: Container(
                height: 50,
                child: Center(child: Text('メニュー')))),
            header: Container(
                height: 50,
                color: Colors.transparent,
                child: Center(child: Text("１日目"))),
            headerBackgroundColorStart: Colors.grey,
            expandedBackgroundColor: Colors.amber,
            headerBackgroundColorEnd: Colors.teal,
            children: [
              Row(children: <Widget>[Text('朝')],),
          const Divider(),
              Row(
                children: <Widget>[const Text('昼')],
              ),
          const Divider(),
          Row(
            children: <Widget>[const Text('間食')]),
              const Divider(),
              Row(
                  children: <Widget>[const Text('夜')]),


            ],
      ),
    )],
    )
    ,
    )
    ,
    );
  }
}
