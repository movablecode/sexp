//  t01.jsx
'use strict';

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }

var _chai = require('chai');

var _chai2 = _interopRequireDefault(_chai);

var print = console.log;

var assert = _chai2['default'].assert;
var expect = _chai2['default'].expect;
var should = _chai2['default'].should;
should();

/*
  es6 의 기본 테스트
*/
describe('기본 es6 - 자바스크립트', function () {
  it('첫번째: 숫자형', function () {
    var x = 10;
    x.should.equal(10);
    x += 15;
    x.should.equal(25);
    x *= 2;
    x.should.equal(50);
  });
});