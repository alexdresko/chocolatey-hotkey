var gulp = require('gulp');
var argv = require('yargs').argv;
var contains = require('gulp-contains');

gulp.task('default', function() {
  console.log(argv.file);
});

gulp.task('build', function() {
    console.log(argv.file);   
});

gulp.task('validate', function() {
    return gulp.src("**/*.ps1").pipe(contains({
			search: /choco|PSScriptRoot/,
			onFound: function (string, file, cb) {
                console.log("ERROR: found '" + string + "' in ")
                console.log(file.path);
                return false;
			}
		}));   
});

gulp.task('watch', function()  {
   gulp.watch("*", function() {
      console.log(argv);   
   });
});