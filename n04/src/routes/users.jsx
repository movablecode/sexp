import express      from 'express';
import fs           from 'fs';
let router = express.Router();

router.get('/',(req, res, next)=>{
  res.render('users', { title: 'YES', files:['case'] })
});

router.get('/xxx',(req, res, next)=>{
  let files = fs.readdirSync('./routes');
  res.render('users', { title: 'Users XXX', files:files })
});

module.exports = router;
