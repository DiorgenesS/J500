import common
import edify_generator

def RemoveDeviceAssert(info):
  edify = info.script
  for i in xrange(len(edify.script)):
    if "ro.product" in edify.script[i]:
      edify.script[i] = """assert(getprop("ro.product.device") == "j5lte" || getprop("ro.build.product") == "j5lte" || getprop("ro.product.device") == "j5lteub" || getprop("ro.build.product") == "j5lteub" || abort("This package is for device: j5lte,j5lteub; this device is " + getprop("ro.product.device") + "."););
unmount("/data");
unmount("/system");"""
      return

def ModifyMountData(edify):
    for i in xrange(len(edify.script)):
        if "mount(" in edify.script[i] and "by-name/userdata" in edify.script[i]:
            edify.script[i] = 'run_program("/sbin/busybox", "mount", "/data");'

def ModifyCommand(edify):
    for i in xrange(len(edify.script)):
        if "package_extract_dir(" in edify.script[i] and "recovery" in edify.script[i]:
            edify.script[i] = 'ui_print("Installing system...");'

def WritePolicyConfig(info):
  try:
    file_contexts = info.input_zip.read("META/file_contexts")
    common.ZipWriteStr(info.output_zip, "file_contexts", file_contexts)
  except KeyError:
    print "warning: file_context missing from target;"


def FullOTA_InstallEnd(info):
    edify = info.script
    RemoveDeviceAssert(info)
    ModifyMountData(edify)
    ModifyCommand(edify)
    WritePolicyConfig(info)

def IncrementalOTA_InstallEnd(info):
    RemoveDeviceAssert(info)
