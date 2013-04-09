#!/usr/bin/env lsc -c
module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    livescript:
      lsfiles:
        options: {bare: true}
        expand: true
        cwd: 'src'
        src: ['*.ls']
        dest: 'dist/'
        ext: '.js'
    shell:
      manifest:
        command: 'lsc -cj < manifest.ls > dist/manifest.json'
      assets:
        command: 'cp -rf assets/* dist/'
      bower:
        command: 'bower install'
      bowerdist:
        command: 'cp -f components/jquery/jquery.min.js dist/'
      zip:
        command: 'cd dist; zip -r ../ly.g0v.tw.zip .'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-livescript'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-shell'

  grunt.registerTask 'default', ['livescript', 'shell']
