/*
 * Jesseframework - Computer Expertz Ltd - https://cpxz.us
 * Copyright (C) 2019-2021 Jesseframework
 *
 * This file is part of Jesseframework - https://github.com/jesseframework/j3.
 *
 * Jesseframework is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * any later version. 
 *
 * Jesseframework is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 */

import 'package:flutter/material.dart';

class ListFilter extends StatefulWidget {
  const ListFilter(
      {@required this.placeholder,
      this.filter,
      @required this.onFilterChanged,
      this.function});
  final Function function;
  final String placeholder;
  final String filter;
  final Function(String) onFilterChanged;

  @override
  _ListFilterState createState() => new _ListFilterState();
}

class _ListFilterState extends State<ListFilter> {
  TextEditingController _filterController;
  FocusNode _focusNode;
  String _placeholder = '';

  @override
  void initState() {
    super.initState();

    _filterController = TextEditingController();
    _focusNode = FocusNode()..addListener(onFocusChanged);
    _placeholder = widget.placeholder;
  }

  void onFocusChanged() {
    setState(() {
      //print(_focusNode.hasFocus);
      if (_focusNode.hasFocus) {
        widget.function(_focusNode.hasFocus);
      }

      _placeholder = _focusNode.hasFocus ? '' : widget.placeholder;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _filterController.text = widget.filter;
  }

  @override
  void dispose() {
    _filterController.dispose();
    _focusNode.removeListener(onFocusChanged);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).textTheme.bodyText1.color;
    final isFilterSet = (widget.filter ?? '').isNotEmpty;

    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(5)),
      height: 35,
      child: TextField(
        focusNode: _focusNode,
        textAlign: _focusNode.hasFocus || _filterController.text.isNotEmpty
            ? TextAlign.start
            : TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 8, right: 8, bottom: 5),
          suffixIcon: _focusNode.hasFocus
              ? IconButton(
                  icon: Center(
                    child: Icon(
                      Icons.clear,
                      color: textColor,
                    ),
                  ),
                  onPressed: () {
                    _filterController.text = '';
                    _focusNode.unfocus();
                    widget.onFilterChanged('');

                    setState(() {
                      widget.function(false);
                      _placeholder = widget.placeholder;
                    });
                  },
                )
              : Container(
                  width: 60,
                  margin: EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.search, color: textColor),
                      InkWell(
                        child: Container(
                            margin: EdgeInsets.only(left: 10),
                            height: 25,
                            child: Image.asset('images/filter.png')),
                      )
                    ],
                  ),
                ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          hintText: _placeholder,
        ),
        autocorrect: false,
        onChanged: (value) {
          widget.onFilterChanged(value);
        },
        controller: _filterController,
      ),
    );
  }
}
