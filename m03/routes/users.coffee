express = require 'express'
router = express.Router()

# GET users listing.
router.get '/', (req, res, next) ->
  res.send 'users 에 대한 응답.'

module.exports = router
