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
var src_routes = 'src/routes/*.jsx';
var src_root = 'app.jsx';

//  바벨 6 를 위한 옵션
var babel_opt = {presets:['es2015']};

//	공통 라이브러리 컴파일, 빌드.
//    ccset.js 로 최종 단일화.
//    브라우저리파이나 웹팩이 왜 필요한지 알 수 있다.
//    gulp 의 concat 은 그저 합쳐줄 뿐,
//    개별 스크립트 모듈을 이해하고 이름영역을 구분지어주지 못한다.
gulp.task('build_common', function () {
  return gulp.src(src_common)
    .pipe(babel(babel_opt))
    // .pipe(uglify({mangle: {toplevel: true}}))
    .pipe(uglify({mangle:true}))
    // .pipe(concat('ccset.js'))
    // .pipe(gulp.dest('dist'));
    .pipe(gulp.dest('lib'));
});

gulp.task('build_app_root', function () {
  return gulp.src(src_root)
    .pipe(babel(babel_opt))
    .pipe(gulp.dest('./'));
});

gulp.task('build_routes', function () {
  return gulp.src(src_routes)
    .pipe(babel(babel_opt))
    // .pipe(uglify({mangle: {toplevel: true}}))
    // .pipe(uglify({mangle:true}))
    // .pipe(concat('ccset.js'))
    // .pipe(gulp.dest('dist'));
    .pipe(gulp.dest('routes'));
});


gulp.task('build_client', function () {
  return gulp.src(src_clib)
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
  gulp.watch(src_common,['build_client'])
  gulp.watch(src_test,['test'])
});

gulp.task('default', ['build_common','build_routes','build_app_root','build_client','test_compile','test','watch']);
