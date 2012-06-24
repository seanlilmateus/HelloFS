#
#  HelloFuseFileSystem.rb
#  HelloFS
#

class HelloFuseFileSystem
  HelloStr = "Hello World From MacRuby!\n"
  HelloPath = "/hello.txt"
  
  def contentsOfDirectoryAtPath(path, error:error)
    [HelloPath.lastPathComponent]
  end
  
  def contentsAtPath(path)
    return HelloStr.dataUsingEncoding(NSUTF8StringEncoding) if path == HelloPath
    nil
  end
  
  def finderAttributesAtPath(path, error:error)
    if path == HelloPath
      file = NSBundle.mainBundle.pathForResource("hellodoc", ofType:"icns")
      return { KGMUserFileSystemCustomIconDataKey => NSData.dataWithContentsOfFile(file) }
    end
    nil
  end
end