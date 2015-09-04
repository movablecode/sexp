//  gulpfile.js
var gulp    = require ('gulp');
var babel   = require ('gulp-babel');
var concat  = require ('gulp-concat');
var uglify  = require ('gulp-uglify');

var print   = console.log

gulp.task('build', function () {
  return gulp.src('src/*.jsx')
    .pipe(babel())
    // .pipe(uglify({mangle: {toplevel: true}}))
    .pipe(uglify({mangle:true}))
    .pipe(concat('baset.js'))
    .pipe(gulp.dest('dist'));
});

gulp.task('watch', function () {
  gulp.watch('src/*.jsx',['build'])
});

gulp.task('default', ['build','watch']);

