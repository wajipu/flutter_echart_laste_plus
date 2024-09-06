import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_win_floating/webview_win_floating.dart';
class WinFlutterEcharts extends StatefulWidget {
  var option;
  WinFlutterEcharts({
    super.key,
    required this.option
  });

  @override
  State<WinFlutterEcharts> createState() => _WinFlutterEchartsState();
}
class _WinFlutterEchartsState extends State<WinFlutterEcharts> {
  final  winController = WinWebViewController();
  @override
  void initState() {
    // TODO: implement initState
    if(GetPlatform.isWindows){
      winController.loadHtmlString(setHTML(widget.option));
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     return WinWebViewWidget(
         controller: winController,
    );
  }
}
String setHTML(var option,) {
  final Random random = Random();
  int randomNumber = random.nextInt(1000);
  return ('''<html lang="zh-CN"><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0"><script src="https://cdn.bootcdn.net/ajax/libs/echarts/5.3.3/echarts.min.js"></script><style>@font-face {font-family: "阿里巴巴普惠体 2.0 35 Thin";font-weight: 250;src: url("//at.alicdn.com/wf/webfont/rltBL8jc3qX1/wdKhH0y1hoJ7.woff2") format("woff2"),url("//at.alicdn.com/wf/webfont/rltBL8jc3qX1/hOnOj7fPZ1Nm.woff") format("woff");font-display: swap;}body, html, #chart-$randomNumber {height: 100%;width: 100%;margin: 0;background: transparent;font-family: "阿里巴巴普惠体 2.0 35 Thin", sans-serif;}div {-webkit-tap-highlight-color: rgba(255,255,255,0);}</style></head><body><div id="chart-$randomNumber"></div><script>var myChart = echarts.init(document.getElementById('chart-$randomNumber'));var option = $option;myChart.setOption(option);</script></body></html>''');
}
