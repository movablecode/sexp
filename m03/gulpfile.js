//  gulpfile.js
var gulp    = require ('gulp');
var babel   = require ('gulp-babel');
var concat  = require ('gulp-concat');
var uglify  = require ('gulp-uglify');
//var mocha   = require ('gulp-mocha');

var print   = console.log
var src_lib = 'src/lib/*.jsx';
var src_routes = 'src/routes/*.jsx';
var src_views = 'src/views/*.jsx';
var src_clients = 'src/clients/*.jsx';

//  routes 컴파일, 빌드.
gulp.task('build_routes', function () {
  return gulp.src(src_routes)
    .pipe(babel())
    .pipe(gulp.dest('routes'));
});

//  views 컴파일, 빌드.
gulp.task('build_views', function () {
  return gulp.src(src_views)
    .pipe(babel())
    .pipe(gulp.dest('v'));
});

//  clients 컴파일, 빌드.
gulp.task('build_clients', function () {
  return gulp.src(src_clients)
    .pipe(babel())
    .pipe(gulp.dest('public/javascripts'));
});

//  파일 변경 감시
gulp.task('watch', function () {
  gulp.watch(src_routes,['build_routes'])
  gulp.watch(src_views,['build_views'])
  gulp.watch(src_clients,['build_clients'])
});

gulp.task('default', ['build_routes','build_views','build_clients','watch']);
