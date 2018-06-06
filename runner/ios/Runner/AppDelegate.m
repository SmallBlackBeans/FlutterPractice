#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];


    FlutterViewController * flutterViewController = (FlutterViewController *)self.window.rootViewController;
    FlutterMethodChannel * channel = [FlutterMethodChannel methodChannelWithName:@"demo.hanxiaocu/battery" binaryMessenger:flutterViewController];

    [channel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        if ([@"getBatteryLevel" isEqualToString:call.method]) {
            int battery = [self getBatteryLevel];
            if (battery == -1) {
                result([FlutterError errorWithCode:@"不可用" message:@"电量信息不可用" details:nil]);
            }else {
                result(@(battery));
            }
        }else {
            result(FlutterMethodNotImplemented);
        }
    }];

  // Override point for customization after application launch.
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}


- (int)getBatteryLevel {
    UIDevice * device = UIDevice.currentDevice;
    device.batteryMonitoringEnabled = YES;
    if (device.batteryState == UIDeviceBatteryStateUnknown) {
        return -1;
    }else {
        return (int)(device.batteryLevel * 100);
    }

}

@end
