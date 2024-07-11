import 'dart:convert';
import 'package:flutter/cupertino.dart';
import "package:webview_universal/webview_universal.dart";


///用于处理win及web端Echarts图像
class WinWebFlutterEcharts extends StatefulWidget {
  var option; ///要加载的Echarts
  WinWebFlutterEcharts({
    super.key,
    required this.option ///页面传递值
  });

  @override
  State<WinWebFlutterEcharts> createState() => _WinWebFlutterEchartsState();
}

class _WinWebFlutterEchartsState extends State<WinWebFlutterEcharts> {

  WebViewController webViewController = WebViewController();

  @override
  void initState() {
    // TODO: implement initState
    webViewController.is_init = false;
    webViewController.init(
      context: context,
      setState: setState,
      uri: Uri.dataFromString(
          setHTML(widget.option),
          mimeType: 'text/html',
          encoding: Encoding.getByName('utf-8')
      ),
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return WebView(
      controller: webViewController,
    );
  }
}

String setHTML(var option) {
  return ('''
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Gauge Chart Example</title>
  <!-- 引入 ECharts -->
  <script src="https://cdn.bootcdn.net/ajax/libs/echarts/5.3.3/echarts.min.js"></script>
  <style>
    /* 样式可以根据需要进行调整 */
    #chart {
      width: 100%;
      height: 100%;
      margin: 0 auto;
    }
  </style>
</head>
<body>
  <!-- 图表容器 -->
  <div id="chart"></div>

  <script>
    // 初始化echarts实例
    var myChart = echarts.init(document.getElementById('chart'));

    // 配置选项
    var option = $option;

    // 使用配置项设置图表
    myChart.setOption(option);

  </script>
</body>
</html>

       ''');
}
