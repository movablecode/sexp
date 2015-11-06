//  gulpfile.js
var gulp    = require ('gulp');
var babel   = require ('gulp-babel');
var concat  = require ('gulp-concat');
var uglify  = require ('gulp-uglify');
var mocha   = require ('gulp-mocha');

var print   = console.log
var src_lib = 'src/lib/*.jsx';
var src_test = 'src/routes/*.jsx';
