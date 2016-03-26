
/**
 * Module dependencies.
 */

import express      from 'express';
import path         from 'path';
import favicon      from 'serve-favicon';
import logger       from 'morgan';
import cookieParser from 'cookie-parser';
import bodyParser   from 'body-parser';

import routes       from './routes/index';
// import users        from './routes/users';

// var express = require('express')
//   , routes = require('./routes');

let app = module.exports = express.createServer();

// Configuration

app.configure( ()=>{
  app.set('views', __dirname + '/views');
  app.set('view engine', 'jade');
  app.use(express.bodyParser());
  app.use(express.methodOverride());
  app.use(app.router);
  app.use(express.static(__dirname + '/public'));
});

app.configure('development', ()=>{
  app.use(express.errorHandler({ dumpExceptions: true, showStack: true }));
});

app.configure('production', ()=>{
  app.use(express.errorHandler());
});

// Routes

app.get('/', routes.index);

app.listen(3002, ()=>{
  console.log("Express server listening on port %d in %s mode", app.address().port, app.settings.env);
});
