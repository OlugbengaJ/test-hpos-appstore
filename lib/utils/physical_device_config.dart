import 'dart:io';
import 'package:disk_space/disk_space.dart';
import 'package:flutter/cupertino.dart';
import 'package:linux_system_info/linux_system_info.dart';

class PhysicalDeviceConfig {
  final BuildContext context;

  PhysicalDeviceConfig(this.context);

  /// [systemMem] returns the memory size of the physical device
  int? get systemMem {
    if (Platform.isLinux) return MemInfo().mem_total_gb;
    return null;
  }

  /// [osVersion] returns the version of the operating system
  String? get osVersion {
    if (Platform.isLinux) return SystemInfo().os_version;
    return null;
  }

  /// [systemProcessorMHz] returns device processor clock speed
  double? get systemProcessorMHz {
    if (Platform.isLinux) return CpuInfo.getProcessors()[0].cpu_mhz;
    return null;
  }

  /// [systemDisk] return free storage on device
  double? get systemDisk {
    double? diskSpace = 0.0;
    if (Platform.isLinux) DiskSpace.getFreeDiskSpace.then((value) => diskSpace = value);
    return diskSpace;
  }

  /// [screenDimension]
  ScreenDimension? get screenDimension {
    if (Platform.isLinux) return ScreenDimension(context);
    return null;
  }
}

class ScreenDimension {
  BuildContext ctx;
  late double _width;
  late double _height;

  ScreenDimension(this.ctx) {
    _width = MediaQuery.of(ctx).size.width;
    _height = MediaQuery.of(ctx).size.height;
  }

  double get width => _width;

  double get height => height;
}