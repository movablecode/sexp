import bc from 'babel-core/register';
import gulp from 'gulp';
import babel from 'gulp-babel';
import imba from 'gulp-imba';
import concat from 'gulp-concat';
import uglify from 'gulp-uglify';
import mocha from 'gulp-mocha';

const babel_opt = {presets:['react','es2015']};

const src_components = 'src/components/*.jsx';

gulp.task('build_client', ()=> {
  gulp.src(src_components)
    // .pipe(imba())
    .pipe(babel(babel_opt))
    .pipe(gulp.dest('public'));
    // .pipe(uglify({mangle: {toplevel: true}}))
    // .pipe(uglify({mangle:true}))
});

//  파일 변경 감시
gulp.task('watch', ()=> {
  gulp.watch(src_components,['build_client']);
});

// gulp.task('default', ['build_client','build_routes','build_app_root','test_compile','test','watch']);
gulp.task('default', ['build_client','watch']);
