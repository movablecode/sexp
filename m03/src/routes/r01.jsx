//  r01.jsx
let express = require('express');
let router = express.Router();

router.get('/', (req, res, next) => {
  // res.send 'dmy03 에 대한 응답.'
  // res.render ('r01', {title: 'React 01'});
  let tst = require('../v/r01');
  res.render ('r01', tst);
});

module.exports = router;
