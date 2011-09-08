dir = File.dirname(__FILE__) + "/lib"
$LOAD_PATH.unshift(dir)
Dir[File.join(dir, "*.rb")].each {|file| require File.basename(file) }