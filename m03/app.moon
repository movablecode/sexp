lapis = require "lapis"

class extends lapis.Application
  "/": =>
    "??? 엔진엑스 What ??? #{require "lapis.version"}!"
