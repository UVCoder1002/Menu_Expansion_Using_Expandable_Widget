import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';

class ExpansionChipList<T> extends StatefulWidget {
  final String name;
  final List<T> listOfObj;
  ExpansionChipList({required this.name, required this.listOfObj});

  @override
  State<ExpansionChipList> createState() => _ExpansionChipListState();
}

class _ExpansionChipListState extends State<ExpansionChipList> {
  List<Widget> chipWidgetList() {
    List<Chip> chipList = [];
    widget.listOfObj.forEach((obj) {
      chipList.add(_createChipWidget(jsonDecode(jsonEncode(obj))[widget.name]));
    });
    return chipList;
  }

  Chip _createChipWidget(String? label) {
    return Chip(
      label: Text(
        label ?? '',
        style: TextStyle(color: Colors.cyan),
      ),
      backgroundColor: Colors.black,
      padding: EdgeInsets.all(8.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> chipList = chipWidgetList();
    return chipList.length > 0
        ? ExpandableNotifier(
            child: Column(
            children: [
              Expandable(
                  collapsed: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: chipList.length <= 2
                          ? Wrap(
                              children: chipList,
                              spacing: 4.0,
                            )
                          : Wrap(
                              children: [
                                chipList[0],
                                chipList[1],
                                ExpandableButton(
                                    child: _createChipWidget(
                                        '+${chipList.length - 2}'))
                              ],
                              spacing: 4.0,
                            )),
                  expanded: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          flex: 2,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Wrap(
                                children: chipList,
                                spacing: 4.0,
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ExpandableButton(
                                child: Icon(
                                  Icons.arrow_drop_up_sharp,
                                  size: 40.0,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          ))
        : Container();
  }
}
