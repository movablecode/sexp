import ReactDOM from 'react-dom';
import React from 'react';

// import App from 'components/App';

// import System from 'systemjs';

System.config({
  baseURL: '/s'
});
System.import('test02.js');

console.log('what ?');


let RD = ReactDOM;


// let rfQry = (dom,addr,param,fn) => {
// // function rfQry(dom,addr,param,fn) {
//   var addr = "/psr/"+addr;
//   $('body').css('curso','progreess');
//   $.post(addr,param,function(data) {
//     $('body').css("cursor","default");
//     console.log("RECEIVE query result");
//     $(dom).html(data.html);
//     if (fn) {fn(data);};
//   });
// };

document.addEventListener('DOMContentLoaded', () => {
  // ReactDOM.render(<App />, document.querySelector('#app'));
  console.log('tested client');
});
