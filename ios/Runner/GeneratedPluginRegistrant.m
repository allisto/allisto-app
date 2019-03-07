//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"
#import <audio_recorder2/AudioRecorder2Plugin.h>
#import <flutter_webview_plugin/FlutterWebviewPlugin.h>
#import <fluttie/FluttiePlugin.h>
#import <path_provider/PathProviderPlugin.h>
#import <simple_permissions/SimplePermissionsPlugin.h>

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [AudioRecorder2Plugin registerWithRegistrar:[registry registrarForPlugin:@"AudioRecorder2Plugin"]];
  [FlutterWebviewPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterWebviewPlugin"]];
  [FluttiePlugin registerWithRegistrar:[registry registrarForPlugin:@"FluttiePlugin"]];
  [FLTPathProviderPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTPathProviderPlugin"]];
  [SimplePermissionsPlugin registerWithRegistrar:[registry registrarForPlugin:@"SimplePermissionsPlugin"]];
}

@end
