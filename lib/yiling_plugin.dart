import 'dart:async';

import 'package:flutter/services.dart';
import 'package:yiling_plugin/model/ka_result.dart';
import 'package:yiling_plugin/model/scan_result.dart';

import 'model/xindian_result.dart';

class YilingPlugin {
}
final MethodChannel _channel =
const MethodChannel('yiling_plugin')..setMethodCallHandler(_handler);

Future<String> get platformVersion async {
  final String version = await _channel.invokeMethod('getPlatformVersion');
  return version;
}

///开始扫描
Future startScan() async {
  String result = await _channel.invokeMethod("startScan");
  return result;
}

///获取电量
Future getBt() async {
  String result = await _channel.invokeMethod("getBt");
  return result;
}

///获取剩余存储空间
Future getTF() async {
  String result = await _channel.invokeMethod("getTF");
  return result;
}

///同步rtc
Future syncRTC() async {
  String result = await _channel.invokeMethod("syncRTC");
  return result;
}

///单导展示，开始检测
Future startXinDian() async {
  String result = await _channel.invokeMethod("startXinDian");
  return result;
}

///展示
Future goXinDian({String fileName,String name,int sex,int age,int mode,String docName,String divName,String ava}) async {
  String result = await _channel.invokeMethod("goXinDian",{
    "fileName" : fileName,
    "name" : name,
    "sex" : sex,
    "age" : age,
    "mode" : mode,
    "docName" : docName,
    "divName" : divName,
    "ava" : ava,
  });
  return result;
}

///单导展示，停止检测
Future stopXinDian() async {
  String result = await _channel.invokeMethod("stopXinDian");
  return result;
}

///启动WiFi模块
Future startWiFi() async {
  String result = await _channel.invokeMethod("startWiFi");
  return result;
}

///停止WiFi模块
Future stopWiFi() async {
  String result = await _channel.invokeMethod("stopWiFi");
  return result;
}

///存卡
Future startCunKa({String fileName,String name,int sex,int age,int mode}) async {
  String result = await _channel.invokeMethod("startCunKa",{
    "fileName" : fileName,
    "name" : name,
    "sex" : sex,
    "age" : age,
    "mode" : mode,
  });
  return result;
}

///停止存卡
Future stopCunKa() async {
  String result = await _channel.invokeMethod("stopCunKa");
  return result;
}

///读卡
Future duKa() async {
  String result = await _channel.invokeMethod("duKa");
  return result;
}

///启动配网模式
Future startPeiwang() async {
  String result = await _channel.invokeMethod("startPeiwang");
  return result;
}

///去配网
Future goPeiwang() async {
  String result = await _channel.invokeMethod("goPeiwang");
  return result;
}

///去读卡
Future duKaAndIntent({int position}) async {
  String result = await _channel.invokeMethod("duKaAndIntent",{
    "position" : position,
  });
  return result;
}

///去读卡
Future duKaAndIntent2({int position}) async {
  String result = await _channel.invokeMethod("duKaAndIntent2",{
    "position" : position,
  });
  return result;
}

///设置WiFi名称
Future setWifiName({String wifiName}) async {
  String result = await _channel.invokeMethod("setWiFiName",{
    "wifiName" : wifiName,
  });
  return result;
}

///设置WiFi密码
Future setWifiPSW({String wifiPSW}) async {
  String result = await _channel.invokeMethod("setWifiPSW",{
    "wifiPSW" : wifiPSW,
  });
  return result;
}

///连接WiFi
Future connWiFi() async {
  String result = await _channel.invokeMethod("connWifi");
  return result;
}

///查看WiFi模块状态
Future wiFiEle() async {
  String result = await _channel.invokeMethod("wiFiEle");
  return result;
}

///设置服务器ip地址&端口
///需按要求传入四个ip字段+端口；
Future setIp({int ip1,int ip2,int ip3,int ip4,int duankou}) async {
  String result = await _channel.invokeMethod("setIp",{
    "ip1" : ip1,
    "ip2" : ip2,
    "ip3" : ip3,
    "ip4" : ip4,
    "duankou" : duankou,
  });
  return result;
}

///查看与服务器的连接状态
Future<bool> quesyIpConn() async {
  bool result = await _channel.invokeMethod("quesyIpConn");
  return result;
}

///检查蓝牙权限
Future<bool> checkBlePermissionWay() async {
  bool result = await _channel.invokeMethod("checkBlePermissionWay", {});
  return result;
}

///打开蓝牙权限
Future requestBlePermissionWay() async {
  String result = await _channel.invokeMethod("requestBlePermissionWay", {});
  return result;
}

///检查读写权限
Future<bool> checkWritePermissionWay() async {
  bool result = await _channel.invokeMethod("checkWritePermissionWay", {});
  return result;
}

///打开读写权限
Future requestWritePermissionWay() async {
  String result = await _channel.invokeMethod("requestWritePermissionWay", {});
  return result;
}

///检查读写权限
Future<bool> checkReadPermissionWay() async {
  bool result = await _channel.invokeMethod("checkReadPermissionWay", {});
  return result;
}

///打开读写权限
Future requestReadPermissionWay() async {
  String result = await _channel.invokeMethod("requestReadPermissionWay", {});
  return result;
}

///扫描结果
StreamController<ScanResult> _scanResultController = new StreamController.broadcast();

Stream<ScanResult> get responseFromScan => _scanResultController.stream;


///设备断开
StreamController<String> _devStopResultController = new StreamController.broadcast();

Stream<String> get responseFromDevStop => _devStopResultController.stream;

///电量
StreamController<double> _btResultController = new StreamController.broadcast();

Stream<double> get responseFromBt => _btResultController.stream;

///储存空间
StreamController<String> _tfResultController = new StreamController.broadcast();

Stream<String> get responseFromTF => _tfResultController.stream;

///RTC
StreamController<String> _rtcResultController = new StreamController.broadcast();

Stream<String> get responseFromRTC => _rtcResultController.stream;

///心电扫描结果
StreamController<XindianResult> _xindianResultController = new StreamController.broadcast();

Stream<XindianResult> get responseFromXindian => _xindianResultController.stream;

///WiFi配置结果
StreamController<String> _WiFiResultController = new StreamController.broadcast();

Stream<String> get responseFromWiFi => _WiFiResultController.stream;

///配置WiFi名称结果
StreamController<String> _SetWifiNameResultController = new StreamController.broadcast();

Stream<String> get responseFromSetWiFiName => _SetWifiNameResultController.stream;

///配置WiFi密码结果
StreamController<String> _SetWifiPSWResultController = new StreamController.broadcast();

Stream<String> get responseFromSetWiFiPSW => _SetWifiPSWResultController.stream;

///连接WiFi结果
StreamController<String> _ConnWifiResultController = new StreamController.broadcast();

Stream<String> get responseFromConnWifi => _ConnWifiResultController.stream;

///wifi模块状态结果
StreamController<String> _WifiStatusResultController = new StreamController.broadcast();

Stream<String> get responseFromWifiStatus => _WifiStatusResultController.stream;

///连接服务器命令回调
StreamController<String> _connIpResultController = new StreamController.broadcast();

Stream<String> get responseFromConnIp => _connIpResultController.stream;

///连接服务器状态回调
StreamController<String> _connIpStatusResultController = new StreamController.broadcast();

Stream<String> get responseFromConnIpStatus => _connIpStatusResultController.stream;

///cunka
StreamController<String> _cunkaResultController = new StreamController.broadcast();

Stream<String> get responseFromCunka => _cunkaResultController.stream;

///duka
StreamController<kaResult> _dukaResultController = new StreamController.broadcast();

Stream<kaResult> get responseFromDuka => _dukaResultController.stream;

///跳转联系医生
StreamController<String> _goLXYSResultController = new StreamController.broadcast();

Stream<String> get responseFromGoLXYS => _goLXYSResultController.stream;

Future<dynamic> _handler(MethodCall methodCall) {
  if ("sendScanResult" == methodCall.method) {
    _scanResultController
        .add(ScanResult.formMap(methodCall.arguments));
  }else if ("sendBtResult" == methodCall.method) {
    _btResultController
        .add(methodCall.arguments);
  }else if ("sendTFResult" == methodCall.method) {
    _tfResultController
        .add(methodCall.arguments.toString());
  }else if ("sendRTCResult" == methodCall.method) {
    _rtcResultController
        .add(methodCall.arguments.toString());
  }else if ("startXinDian" == methodCall.method) {
    _xindianResultController
        .add(XindianResult.formMap(methodCall.arguments));
  }else if ("wifiResult" == methodCall.method) {
    _WiFiResultController
        .add(methodCall.arguments);
  }else if ("cunkaResult" == methodCall.method) {
    _cunkaResultController
        .add(methodCall.arguments);
  }else if ("kaResult" == methodCall.method) {
    _dukaResultController
        .add(kaResult.fromList(methodCall.arguments));
  }else if ("LXYSOrder" == methodCall.method) {
    _goLXYSResultController
        .add(methodCall.arguments);
  }else if ("wifiSetNameResult" == methodCall.method) {
    _SetWifiNameResultController
        .add(methodCall.arguments);
  }else if ("wifiSetPSWResult" == methodCall.method) {
    _SetWifiPSWResultController
        .add(methodCall.arguments);
  }else if ("connWifiResult" == methodCall.method) {
    _ConnWifiResultController
        .add(methodCall.arguments);
  }else if ("WifiStatusResult" == methodCall.method) {
    _WifiStatusResultController
        .add(methodCall.arguments);
  }else if ("connIpResult" == methodCall.method) {
    _connIpResultController
        .add(methodCall.arguments);
  }else if ("connIpStatusResult" == methodCall.method) {
    _connIpStatusResultController
        .add(methodCall.arguments);
  }else if ("searchStopped" == methodCall.method) {
    _devStopResultController
        .add(methodCall.arguments);
  }
  return Future.value(true);

}