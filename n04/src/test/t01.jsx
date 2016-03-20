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
  it ('두번째: 객체 참조형', ()=>{
    let x = {k1:'KATANA',k2:10};
    let x2 = x;
    x2.k1 = 'BASE';
    x2.k1.should.equal('BASE');
    x.k1.should.equal(x2.k1);
    let f1 = (x)=> {
      x.k1 = 'SWORD';
      return x;
    };
    let x3 = f1(x2);
    x.k1.should.equal('SWORD');
    x2.k1.should.equal(x.k1);
    x3.k1.should.equal(x2.k1);
    //  모든 js 객체는 참조형으로 작동한다.

  });
});
