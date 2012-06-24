#
#  HelloFuseFileSystem.rb
#  HelloFS
#

class HelloFuseFileSystem
  MacRubyStr = "MacRuby rocks!\n"
  HelloStr = "Hello World From MacRuby!\n"
  HelloPath = "/hello.txt"
  MacRubyPath = "/macruby.txt"
  
  def contentsOfDirectoryAtPath(path, error:error)
    [HelloPath, MacRubyPath].map(&:lastPathComponent)
  end
  
  def contentsAtPath(path)
    case path
      when HelloPath then HelloStr.dataUsingEncoding(NSUTF8StringEncoding)
      when MacRubyPath then MacRubyStr.dataUsingEncoding(NSUTF8StringEncoding)
    end
  end
  
  def finderAttributesAtPath(path, error:error)
    if path == HelloPath or path == MacRubyPath
      file = NSBundle.mainBundle.pathForResource("hellodoc", ofType:"icns")
      return { KGMUserFileSystemCustomIconDataKey => NSData.dataWithContentsOfFile(file) }
    end
    nil
  end
end