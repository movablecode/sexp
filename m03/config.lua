-- config.lua                            
local config = require("lapis.config")   

config("development", {                  
  port = 80,                           
  num_workers = 1,                       
  secret = "ryse and clickonce",         
  enable_https = true,                   
  --code_cache = "on",                   
  daemon = "off",                        
  notice_log = "logs/notice.log",        
})                                       
