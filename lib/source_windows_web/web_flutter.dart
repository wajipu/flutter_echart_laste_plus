import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebFlutterEcharts extends StatefulWidget {
  var option;
  WebFlutterEcharts({
    super.key,
    required this.option
  });

  @override
  State<WebFlutterEcharts> createState() => _WebFlutterEchartsState();
}
class _WebFlutterEchartsState extends State<WebFlutterEcharts> {
  final webController = WebViewController();
  @override
  void initState() {
    // TODO: implement initState
    if(GetPlatform.isWeb){
      webController.loadHtmlString(setHTML(widget.option));
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
      return WebViewWidget(
          controller: webController
      );
  }
}
String setHTML(var option) {
  return ('''<html lang="en"><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0"><script src="https://cdn.bootcdn.net/ajax/libs/echarts/5.3.3/echarts.min.js"></script><style>#chart{width:100%;height:100%;margin:0 auto;}</style></head><body><div id="chart"></div><script>var myChart=echarts.init(document.getElementById('chart'));var option=$option;myChart.setOption(option);</script></body></html>''');
}
