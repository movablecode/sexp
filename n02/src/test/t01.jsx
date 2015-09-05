//  t01.jsx
let print = console.log;
import chai from 'chai';
let assert = chai.assert;
let expect = chai.expect;
let should = chai.should;
should();

/*
  es6 의 기본 테스트
*/
describe('기본 es6 - 자바스크립트', ()=>{
  it ('첫번째: 숫자형', ()=>{
    let x = 10;
    x.should.equal(10);
    x+=15;
    x.should.equal(25);
    x*=2;
    x.should.equal(50);
  });
});
