/*
  file read & routes.

*/
import fs           from 'fs';

let routes = {};

routes.load = (path)=> {
  path = path | './routes';
  let files = fs.readdirSync(path);
  return files;
};

module.exports = routes;
