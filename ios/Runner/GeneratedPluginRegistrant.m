//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"
#import <audio_recorder2/AudioRecorder2Plugin.h>
#import <fluttie/FluttiePlugin.h>
#import <intro_slider/IntroSliderPlugin.h>
#import <path_provider/PathProviderPlugin.h>
#import <share/SharePlugin.h>
#import <simple_permissions/SimplePermissionsPlugin.h>
#import <webview_flutter/WebViewFlutterPlugin.h>

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [AudioRecorder2Plugin registerWithRegistrar:[registry registrarForPlugin:@"AudioRecorder2Plugin"]];
  [FluttiePlugin registerWithRegistrar:[registry registrarForPlugin:@"FluttiePlugin"]];
  [IntroSliderPlugin registerWithRegistrar:[registry registrarForPlugin:@"IntroSliderPlugin"]];
  [FLTPathProviderPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTPathProviderPlugin"]];
  [FLTSharePlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTSharePlugin"]];
  [SimplePermissionsPlugin registerWithRegistrar:[registry registrarForPlugin:@"SimplePermissionsPlugin"]];
  [FLTWebViewFlutterPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTWebViewFlutterPlugin"]];
}

@end
