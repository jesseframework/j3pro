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

class CheckBoxReuseable extends StatefulWidget {
  final String hintText;
  final bool selectedCheckboxValue = false;

  final onUpdateSelectionValue;

  CheckBoxReuseable(
    this.onUpdateSelectionValue, {
    @required this.hintText,
  });

  @override
  _CheckBoxReuseableState createState() => _CheckBoxReuseableState();
}

class _CheckBoxReuseableState extends State<CheckBoxReuseable> {
  var setSelectedValue = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Checkbox(
          value: widget.selectedCheckboxValue,
          onChanged: (bool newValue) {
            setState(() {
              setSelectedValue = newValue;
              widget.onUpdateSelectionValue(newValue);
            });
          }),
    );
  }
}
