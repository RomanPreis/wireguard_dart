import 'package:wireguard_dart/key_pair.dart';
import 'package:wireguard_dart/tunnel_statistics.dart';

import 'connection_status.dart';
import 'wireguard_dart_platform_interface.dart';

class WireguardDart {
  Future<KeyPair> generateKeyPair() {
    return WireguardDartPlatform.instance.generateKeyPair();
  }

  Future<void> nativeInit() {
    return WireguardDartPlatform.instance.nativeInit();
  }

  Future<void> setupTunnel(
      {required String bundleId,
      required String tunnelName,
      required String serverAddress,
      required String configuration,
      String? win32ServiceName}) {
    return WireguardDartPlatform.instance.setupTunnel(
      bundleId: bundleId,
      tunnelName: tunnelName,
      win32ServiceName: win32ServiceName,
      serverAddress: serverAddress,
      configuration: configuration,
    );
  }

  Future<void> connect({required String cfg}) {
    return WireguardDartPlatform.instance.connect(cfg: cfg);
  }

  Future<void> disconnect() {
    return WireguardDartPlatform.instance.disconnect();
  }

  Future<ConnectionStatus> status() {
    return WireguardDartPlatform.instance.status();
  }

  Stream<ConnectionStatus> statusStream() {
    return WireguardDartPlatform.instance.statusStream();
  }

  Future<bool> checkTunnelConfiguration({
    required String bundleId,
    required String tunnelName,
    required String serverAddress,
  }) {
    return WireguardDartPlatform.instance.checkTunnelConfiguration(
      bundleId: bundleId,
      tunnelName: tunnelName,
      serverAddress: serverAddress,
    );
  }

  Future<void> removeTunnelConfiguration({
    required String bundleId,
    required String tunnelName,
    required String serverAddress,
  }) {
    return WireguardDartPlatform.instance.removeTunnelConfiguration(
      bundleId: bundleId,
      tunnelName: tunnelName,
      serverAddress: serverAddress,
    );
  }

  Future<TunnelStatistics?> getTunnelStatistics() {
    return WireguardDartPlatform.instance.getTunnelStatistics();
  }
}
