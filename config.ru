# 1. We have to call 'run' on some object
# 2. That object must respond to a method called 'call'
# 3. The call method should return an array with three items - the status code, headers, and the body
require_relative 'config/environment'


my_app = Application.new
run my_app
