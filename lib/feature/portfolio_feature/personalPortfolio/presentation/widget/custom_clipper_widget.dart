import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_maker/src/Data%20from%20String/sizeFromString.dart';
import 'package:path_maker/src/customPathClipper.dart';
import 'package:path_maker/src/models/PathModel.dart';
import 'package:path_maker/src/widget/getPathModelFromMap.dart';

class CustomClipperWidget extends StatefulWidget {
  final int customPathIndex;
  final Size size;
  final String filePath;
  final Widget? child;
  final Color? bgColor;
  const CustomClipperWidget(
      {super.key,
      required this.filePath,
      required this.size,
      this.child,
      this.bgColor,
      this.customPathIndex = 0});

  @override
  State<CustomClipperWidget> createState() => _CustomClipperWidgetState();
}

class _CustomClipperWidgetState extends State<CustomClipperWidget> {
  Size paintSize = const Size(200, 200);
  int pathModelIndex = 0;
  String errorMessage = "";
  final List<PathModel> _pathModels = [];
  void _openAndLoadFileFromAsset() async {
    paintSize = Size(widget.size.width, widget.size.height);
    String preJsonString = "preJsonString";
    try {
      if (!widget.filePath.contains('.json')) {
        errorMessage = "Only Json File Allowed";
        Fluttertoast.showToast(
            msg: "Please select json file", toastLength: Toast.LENGTH_LONG);
      }
      Uint8List bytes = Uint8List(8);

      try {
        bytes = (await rootBundle.load(widget.filePath)).buffer.asUint8List();
      } catch (e) {
        errorMessage = "Incorrect Path";
      }

      preJsonString = String.fromCharCodes(bytes);

      Map jsonData = {};
      try {
        jsonData = jsonDecode(preJsonString);
      } catch (e) {
        errorMessage = "Problem In JsonDecode";
      }

      try {
        List l = jsonData["pathModels"];
        _pathModels.clear();
        Map firstMap = l.first as Map;
        int pn = 0;

        for (var e in l) {
          PathModel? pathModel = getPathModelFromMap(e);

          pn++;

          _pathModels.add(pathModel!);
        }

        try {
          paintSize = jsonData["size"] != null
              ? sizeFromString(jsonData["size"])
              : widget.size;
        } catch (e) {}
        pathModelIndex = 0;
        if (mounted) {
          setState(() {
            errorMessage = "";
          });
        }
      } catch (e) {
        Fluttertoast.showToast(
            msg: "Json has incorrect data", toastLength: Toast.LENGTH_LONG);
        errorMessage = "Json has incorrect data";
        if (mounted) {
          setState(() {});
        }
      }

      return;
    } catch (e) {}
  }

  @override
  void initState() {
    super.initState();
    _openAndLoadFileFromAsset();
  }

  @override
  Widget build(BuildContext context) {
    return _pathModels.isNotEmpty &&
            (widget.customPathIndex) < _pathModels.length
        ? Container(
            width: widget.size.width,
            height: widget.size.height,
            color: widget.bgColor,
            child: Transform.scale(
              scale: 1,
              child: ClipPath(
                clipper: CustomPathClipper(
                    _pathModels[widget.customPathIndex % _pathModels.length],
                    paintSize),
                child: InkWell(onTap: () {}, child: widget.child),
              ),
            ))
        : const Center(
            child: Text("Error"),
          );
  }
}
