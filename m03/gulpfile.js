//  gulpfile.js
var gulp    = require ('gulp');
var babel   = require ('gulp-babel');
var concat  = require ('gulp-concat');
var uglify  = require ('gulp-uglify');
//var mocha   = require ('gulp-mocha');

var print   = console.log
var src_lib = 'src/lib/*.jsx';
var src_routes = 'src/routes/*.jsx';

//  routes 컴파일, 빌드.
gulp.task('build_routes', function () {
  return gulp.src(src_routes)
    .pipe(babel())
    .pipe(gulp.dest('routes'));
});

//  파일 변경 감시
gulp.task('watch', function () {
  gulp.watch(src_routes,['build_routes'])
});

gulp.task('default', ['build_routes','watch']);
