package com.example.runner;

import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Build;
import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {

    private static final String CHANNEL = "demo.hanxiaocu/battery";


    String shareText;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);

        Intent intent = getIntent();
        String action = intent.getAction();
        String type = intent.getType();
        if (Intent.ACTION_SEND.equals(action) && type != null) {
            if ("text/plaun".equals(type)) {
                handleSendText(intent);
            }
        }
        //平台通道
        //数据共享
        new MethodChannel(getFlutterView(), "app.channel.shared.data").setMethodCallHandler(new MethodChannel.MethodCallHandler() {
            @Override
            public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
                if (methodCall.method.contentEquals("getSharedText")) {
                    result.success(shareText);
                    shareText = null;
                }
            }
        });

        //获取电量
        new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(new MethodChannel.MethodCallHandler() {
            @Override
            public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
                if (methodCall.method.equals("getBatteryLevel")) {
                    int batteryLevel = getBatteryLevel();
                    if (batteryLevel != -1) {
                        result.success(batteryLevel);
                    } else {
                        result.error("不可用", "电量获取不到", null);
                    }
                } else {
                    result.notImplemented();
                }
            }
        });

    }

    private int getBatteryLevel() {
        int batteryLevel = -1;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            BatteryManager manager = (BatteryManager) getSystemService(BATTERY_SERVICE);
            batteryLevel = manager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY);
        } else {
            Intent intent = new ContextWrapper(getApplicationContext()).
                    registerReceiver(null, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
            batteryLevel = (intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100) /
                    intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
        }
        return batteryLevel;
    }


    void handleSendText(Intent intent) {
        shareText = intent.getStringExtra(Intent.EXTRA_TEXT);
    }
}
