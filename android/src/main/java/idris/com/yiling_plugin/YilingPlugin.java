package idris.com.yiling_plugin;

import idris.com.yiling_plugin.handler.YiLingHandler;
import idris.com.yiling_plugin.handler.YiLingRequestHandler;
import idris.com.yiling_plugin.handler.YiLingResponseHandler;
import idris.com.yiling_plugin.wty.nrdemo.DevManager;
import idris.com.yiling_plugin.wty.nrdemo.MyApplication;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** YilingPlugin */
public class YilingPlugin implements MethodCallHandler {
  /** Plugin registration. */

  Registrar registrar;
  MethodChannel channel;

  private YilingPlugin(Registrar registrar, MethodChannel channel){
    this.registrar = registrar;
    this.channel = channel;
  }

  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "yiling_plugin");
    YiLingHandler.setRegistrar(registrar);
    YiLingRequestHandler.setRegistrar(registrar);
    YiLingResponseHandler.setMethodChannel(channel);
    MyApplication.setInstance(registrar);

    DevManager.getActivity(registrar.activity());

    channel.setMethodCallHandler(new YilingPlugin(registrar, channel));
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    }  else if (call.method.equals("startScan")) {
      YiLingHandler.startScan(call,result);
    }  else if (call.method.equals("getBt")) {
      YiLingHandler.getBt(call,result);
    }  else if (call.method.equals("getTF")) {
      YiLingHandler.getTF(call,result);
    }  else if (call.method.equals("syncRTC")) {
      YiLingHandler.syncRTC(call,result);
    } else if (call.method.equals("startXinDian")) {
      YiLingHandler.startXinDian(call,result);
    } else if (call.method.equals("goXinDian")) {
      YiLingHandler.goXinDian(call,result);
    } else if (call.method.equals("stopXinDian")) {
      YiLingHandler.stopXinDian(call,result);
    } else if (call.method.equals("startCunKa")) {
        YiLingHandler.startCunKa(call,result);
    } else if (call.method.equals("stopCunKa")) {
        YiLingHandler.stopCunKa(call,result);
    } else if (call.method.equals("startWiFi")) {
        YiLingHandler.startWiFi(call,result);
    } else if (call.method.equals("stopWiFi")) {
        YiLingHandler.stopWiFi(call,result);
    } else if (call.method.equals("startPeiwang")) {
        YiLingHandler.startPeiwang(call,result);
    } else if (call.method.equals("setWiFiName")) {
        YiLingHandler.setWiFiName(call,result);
    } else if (call.method.equals("setWifiPSW")) {
      YiLingHandler.setWiFiPSW(call,result);
    } else if (call.method.equals("connWifi")) {
      YiLingHandler.connWifi(call,result);
    } else if (call.method.equals("wiFiEle")) {
      YiLingHandler.wiFiEle(call,result);
    } else if (call.method.equals("setIp")) {
      YiLingHandler.setIp(call,result);
    } else if (call.method.equals("quesyIpConn")) {
      YiLingHandler.quesyIpConn(call,result);
    } else if (call.method.equals("checkBlePermissionWay")) {
      YiLingHandler.checkBlePermissionWay(call,result);
    } else if (call.method.equals("requestBlePermissionWay")) {
      YiLingHandler.requestBlePermissionWay(call,result);
    } else if (call.method.equals("checkWritePermissionWay")) {
      YiLingHandler.checkWritePermissionWay(call,result);
    } else if (call.method.equals("requestWritePermissionWay")) {
      YiLingHandler.requestWritePermissionWay(call,result);
    } else if (call.method.equals("checkReadPermissionWay")) {
        YiLingHandler.checkReadPermissionWay(call,result);
    } else if (call.method.equals("requestReadPermissionWay")) {
      YiLingHandler.requestReadPermissionWay(call,result);
    } else if (call.method.equals("duKa")) {
      YiLingHandler.duKa(call,result);
    } else if (call.method.equals("duKaAndIntent")) {
      YiLingHandler.duKaAndIntent(call,result);
    } else if (call.method.equals("duKaAndIntent2")) {
        YiLingHandler.duKaAndIntent2(call,result);
    } else {
      result.notImplemented();
    }
  }
}
