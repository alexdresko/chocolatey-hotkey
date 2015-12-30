var gulp = require('gulp');
var argv = require('yargs').argv;
var contains = require('gulp-contains');
var childProcess = require('child_process');

gulp.task('install', function (cb) {
    exec("install", cb)
});

gulp.task('package', function (cb) {
    exec("package", cb)
});

gulp.task('uninstall', function (cb) {
    exec("uninstall", cb)
});

gulp.task('push', function (cb) {
    exec("push", cb)
});

function exec(operation, cb) {
childProcess.exec('cmd /C powershell -File "bin/exec.ps1" -file "' + argv.file + '" -operation ' + operation, function (err, stdout, stderr) {
        console.log(stdout);
        console.log(stderr);
        cb(err);
    });    
}

gulp.task('validate', function () {
    return gulp.src("**/*.ps1").pipe(contains({
        search: /choco|PSScriptRoot|cpack/,
        onFound: function (string, file, cb) {
            console.log("ERROR: found '" + string + "' in ")
            console.log(file.path);
            return false;
        }
    }));
});

gulp.task('watch', function () {
    gulp.watch("**/*", function () {
        console.log("taco")
    });
});