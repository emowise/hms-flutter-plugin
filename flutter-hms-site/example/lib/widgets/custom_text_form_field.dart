/*
    Copyright 2020-2021. Huawei Technologies Co., Ltd. All rights reserved.

    Licensed under the Apache License, Version 2.0 (the "License")
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        https://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
*/

import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;

  CustomTextFormField({
    required this.labelText,
    required this.controller,
  });

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 5),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            setState(() {
              errorText = 'A value must be provided.';
            });
            return errorText;
          }
          return null;
        },
        controller: widget.controller,
        decoration: InputDecoration(
          labelText: widget.labelText,
          errorText: errorText ?? null,
          border: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
        ),
      ),
    );
  }
}
