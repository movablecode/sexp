//   dmy02.js
var express = require('express');
var router = express.Router();

router.get('/', function(req, res, next) {
  // res.send 'dmy01 에 대한 응답.'
  res.render ('index',{
    title: 'DMY-02'
  });
});

module.exports = router;
