ENV["RAILS_ROOT"] = File.expand_path("../../", __FILE__)
require File.expand_path("../dummy/config/environment", __FILE__)

Teabag.setup do |config|
  # Driver
  config.driver         = "phantomjs" # available: phantomjs, selenium
  # config.phantomjs_bin  = "/usr/local/bin/phantomjs"

  # Behaviors
  #config.server_timeout = 20 # timeout for starting the server
  config.fail_fast      = true

  # Output
  config.formatters     = "clean"
  #config.suppress_log   = false # suppress logs coming from console[log/error/debug]
  config.color          = true
end
