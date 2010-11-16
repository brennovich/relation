#  
#  Copyright (c) 2010 Tomás D'Stefano
#  
#  Permission is hereby granted, free of charge, to any person obtaining
#  a copy of this software and associated documentation files (the
#  "Software"), to deal in the Software without restriction, including
#  without limitation the rights to use, copy, modify, merge, publish,
#  distribute, sublicense, and/or sell copies of the Software, and to
#  permit persons to whom the Software is furnished to do so, subject to
#  the following conditions:
#  
#  The above copyright notice and this permission notice shall be
#  included in all copies or substantial portions of the Software.
#  
#  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
#  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
#  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
#  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
#  LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
#  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
#  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

require 'mkmf'

extension_name = 'relation_table'
dir_config(extension_name)

RELATION_HEADER_PATH = File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', '..', '..', 'source'))
RELATION_HEADER_FLAG = "-I #{RELATION_HEADER_PATH}"

object_files  = Dir["*.o", "#{RELATION_HEADER_PATH}/*.o", "#{RELATION_HEADER_PATH}/*/*.o"]
$objs = object_files

with_cflags(RELATION_HEADER_FLAG) do
    create_makefile(extension_name)
end