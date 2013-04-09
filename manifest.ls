manifest_version: 2
name: '立法院擴充'
description: 'ly.gov.tw improvements from ly.g0v.tw'
version: '0.3.2'
#background: scripts: <[background.js]>
permissions:
  * 'http://*.ly.gov.tw/*'
  * 'tabs'
  * 'storage'
content_scripts: [
  matches: [
    'http://*.ly.gov.tw/*'
  ]
  js: [
    'jquery.min.js'
    'contentscript.js'
  ]
  run_at: 'document_idle'
  all_frames: true
]
icons:
  48: 'g0v-48.png'
  128: 'g0v-128.png'
