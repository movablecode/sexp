//  gulpfile.js
var gulp    = require ('gulp');
var babel   = require ('gulp-babel');
var concat  = require ('gulp-concat');
var uglify  = require ('gulp-uglify');
var mocha   = require ('gulp-mocha');

var print   = console.log
var src_lib = 'src/lib/*.jsx';
var src_test = 'src/test/*.jsx';

//	라이브러리 컴파일, 빌드.
gulp.task('build', function () {
  return gulp.src(src_lib)
    .pipe(babel())
    // .pipe(uglify({mangle: {toplevel: true}}))
    .pipe(uglify({mangle:true}))
    .pipe(concat('baset.js'))
    .pipe(gulp.dest('dist'));
});

//	테스트 컴파일, 빌드.
gulp.task('test_compile', function () {
  return gulp.src(src_test)
    .pipe(babel())
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
  gulp.watch(src_lib,['build'])
  gulp.watch(src_test,['test'])
});

gulp.task('default', ['build','test_compile','test','watch']);
