package io.flutter.plugins;

import io.flutter.plugin.common.PluginRegistry;
import audiorecorder2.audiorecorder2.AudioRecorder2Plugin;
import de.simolus3.fluttie.FluttiePlugin;
import io.flutter.plugins.pathprovider.PathProviderPlugin;
import com.ethras.simplepermissions.SimplePermissionsPlugin;

/**
 * Generated file. Do not edit.
 */
public final class GeneratedPluginRegistrant {
  public static void registerWith(PluginRegistry registry) {
    if (alreadyRegisteredWith(registry)) {
      return;
    }
    AudioRecorder2Plugin.registerWith(registry.registrarFor("audiorecorder2.audiorecorder2.AudioRecorder2Plugin"));
    FluttiePlugin.registerWith(registry.registrarFor("de.simolus3.fluttie.FluttiePlugin"));
    PathProviderPlugin.registerWith(registry.registrarFor("io.flutter.plugins.pathprovider.PathProviderPlugin"));
    SimplePermissionsPlugin.registerWith(registry.registrarFor("com.ethras.simplepermissions.SimplePermissionsPlugin"));
  }

  private static boolean alreadyRegisteredWith(PluginRegistry registry) {
    final String key = GeneratedPluginRegistrant.class.getCanonicalName();
    if (registry.hasPlugin(key)) {
      return true;
    }
    registry.registrarFor(key);
    return false;
  }
}
