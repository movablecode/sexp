var gulp = require('gulp');
var babel   = require ('gulp-babel');
var imba   = require ('gulp-imba');
var concat  = require ('gulp-concat');
var uglify  = require ('gulp-uglify');
var mocha   = require ('gulp-mocha');

//  바벨 6 를 위한 옵션
var babel_opt = {presets:['es2015']};

var src_components = 'src/components/*.imba';

gulp.task('build_client', function() {
  gulp.src(src_components)
    .pipe(imba())
    .pipe(gulp.dest('public'));
});

//  파일 변경 감시
gulp.task('watch', function () {
  gulp.watch(src_components,['build_client']);
});

// gulp.task('default', ['build_client','build_routes','build_app_root','test_compile','test','watch']);
gulp.task('default', ['build_client','watch']);
