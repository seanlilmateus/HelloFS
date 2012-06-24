#
#  AppDelegate.rb
#  HelloFS
#
#
framework 'MacFUSE'

class AppDelegate
    attr_accessor :window, :fs
    
    KGMUserFileSystemDidMount = "kGMUserFileSystemDidMount"
    KGMUserFileSystemDidUnmount = "kGMUserFileSystemDidUnmount"
    KGMUserFileSystemMountPathKey = "mountPath"
    
    def applicationDidFinishLaunching(notification)
      center = NSNotificationCenter.defaultCenter
      center.addObserver(self, selector:'did_mount:', name: KGMUserFileSystemDidMount, object:nil)
      center.addObserver(self, selector:'did_unmount:', name: KGMUserFileSystemDidUnmount, object:nil)

      mount_path = "/Volumes/Hello"
      hello = HelloFuseFileSystem.new
      @fs = GMUserFileSystem.alloc.initWithDelegate(hello, isThreadSafe:true)
      icon = NSBundle.mainBundle.pathForResource('Fuse', ofType:'icns')
      opts = ["rdonly", "volname=HelloFS", "volicon=#{icon}"]
      @fs.mountAtPath(mount_path, withOptions:opts)
    end
    
    def did_mount(notification)
      user_info = notification.userInfo
      mount_path = user_info[KGMUserFileSystemMountPathKey]
      parent_path = mount_path.stringByDeletingLastPathComponent
      NSWorkspace.sharedWorkspace.selectFile(mount_path, inFileViewerRootedAtPath:parent_path)
    end

    def did_unmount(notification)
      NSApplication.sharedApplication.terminate(nil)
    end

    def applicationShouldTerminate(sender)
      NSNotificationCenter.defaultCenter.removeObserver(self)
      @fs.unmount
      NSTerminateNow
    end
end

