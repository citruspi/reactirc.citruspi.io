var gulp = require('gulp');
var usemin = require('gulp-usemin');
var minify = require('gulp-minify-css');
var uglify = require('gulp-uglify');

gulp.task('build', function(){
    gulp.src('src/index.html')
        .pipe(usemin({
            css: [minify(), 'concat'],
            js: [uglify(), 'concat']
        }))
        .pipe(gulp.dest('dist'));
    gulp.src('src/fonts/*')
        .pipe(gulp.dest('dist/fonts'))
});

gulp.task('default', ['build']);
