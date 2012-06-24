#
#  HelloFuseFileSystem.rb
#  HelloFS
#
#  Created by Mateus Armando on 17.04.12.
#  Copyright 2012 Sean Coorp. INC. All rights reserved.
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