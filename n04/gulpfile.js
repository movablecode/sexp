//  gulpfile.js
var gulp    = require ('gulp');
var babel   = require ('gulp-babel');
var concat  = require ('gulp-concat');
var uglify  = require ('gulp-uglify');
var mocha   = require ('gulp-mocha');

var print   = console.log
var src_slib = 'src/slib/*.jsx';
var src_clib = 'src/clib/*.jsx';
var src_common = 'src/common/*.jsx';
var src_test = 'src/test/*.jsx';

var babel_opt = {presets:['es2015']};

//	공통 라이브러리 컴파일, 빌드.
gulp.task('build_common', function () {
  return gulp.src(src_common)
    .pipe(babel(babel_opt))
    // .pipe(uglify({mangle: {toplevel: true}}))
    .pipe(uglify({mangle:true}))
    .pipe(concat('ccset.js'))
    .pipe(gulp.dest('dist'));
});

//	테스트 컴파일, 빌드.
gulp.task('test_compile', function () {
  return gulp.src(src_test)
    .pipe(babel(babel_opt))
    .pipe(concat('test.js'))
    .pipe(gulp.dest('dist'));
});

//  테스트 수행
gulp.task('test', ['test_compile'], function () {
  return gulp.src('dist/test.js')
    // .pipe(mocha({reporter:'nyan'}));
    .pipe(mocha());
});

//	파일 변경 감시
gulp.task('watch', function () {
  gulp.watch(src_common,['build_common'])
  gulp.watch(src_test,['test'])
});

gulp.task('default', ['build_common','test_compile','test','watch']);
