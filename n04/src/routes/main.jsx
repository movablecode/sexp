import express      from 'express';
let router = express.Router();

router.get('/',(req, res, next)=>{
  res.render('main', { title: 'Express' })
});

router.get('/xxx',(req, res, next)=>{
  res.render('main', { title: 'XXX' })
});

module.exports = router;
