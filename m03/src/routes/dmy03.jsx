//  dmy03.jsx
let express = require('express');
let router = express.Router();

router.get('/', (req, res, next) => {
  // res.send 'dmy03 에 대한 응답.'
  res.render ('dmy03', {title: 'DMY-03'});
});

module.exports = router;
