#!/usr/bin/env lsc -cj
author: 'Chia-liang Kao'
name: 'ly-crx'
description: 'ly-crx'
version: '0.0.1'
homepage: 'https://github.com/g0v/ly-crx'
repository:
  type: 'git'
  url: 'https://github.com/g0v/ly-crx'
engines:
  node: '0.8.x'
  npm: '1.1.x'
scripts:
  prepublish: 'PATH=./node_modules/.bin:$PATH lsc -cj package.ls'
dependencies: {}
devDependencies:
  LiveScript: '1.1.x'
  grunt: '0.4.x'
  'grunt-contrib-uglify': \*
  'grunt-contrib-clean': \*
  'grunt-livescript': \*
  'grunt-shell': \*
