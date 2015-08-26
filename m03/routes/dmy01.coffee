#   dmy01.coffee
express = require 'express'
router = express.Router()

router.get '/', (req, res, next) ->
  # res.send 'dmy01 에 대한 응답.'
  res.render 'dmy01',
    title: 'DMY-01'

module.exports = router
