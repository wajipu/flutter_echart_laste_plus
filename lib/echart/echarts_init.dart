import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../source_ios_android/flutter_echarts.dart';
import '../source_windows_web/win_web_fluter.dart';
///二测开发flutter_echarts插件因为需要全平台支持哦。
class EchartsInit extends StatefulWidget {
   EchartsInit({
    super.key,
    required this.option,
  });
  var option = "";
  @override
  State<EchartsInit> createState() => _EchartsInitState();
}

class _EchartsInitState extends State<EchartsInit> {
  @override
  Widget build(BuildContext context) {
    TargetPlatform platform = defaultTargetPlatform;
    if(platform == TargetPlatform.android || platform == TargetPlatform.iOS){
      /// android or ios
      return Echarts(option: widget.option,reloadAfterInit: true);
    }else{
      ///web or windows
      return WinWebFlutterEcharts(option: widget.option);
    }
  }
}
