import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../source_ios_android/flutter_echarts.dart';
import '../source_windows_web/web_flutter.dart';
import '../source_windows_web/win_fluter.dart';
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
    if(platform == TargetPlatform.android || platform == TargetPlatform.iOS || platform == TargetPlatform.macOS){
      /// android or ios
      return Echarts(option: widget.option,reloadAfterInit: true);
    }else if(GetPlatform.isWeb){
      return WebFlutterEcharts(option: widget.option);
    }else{
      return WinFlutterEcharts(option: widget.option);
    }
  }
}
