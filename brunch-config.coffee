exports.config =

  modules:
    definition: false
    wrapper:    false

  conventions:
    # wrap bower_components into commonjs
    vendor: -> false

  paths:
    watched: [
      'app'
    ]

  files:

    stylesheets:
      joinTo:
        'css/app.css':    /^app/
        'css/vendor.css': /^(bower_components|vendor)/

    javascripts:
      joinTo:
        'js/app.js':    /^app/
        'js/vendor.js': /^(bower_components|vendor)/

    templates:
      joinTo:
        'js/templates.js': /^.+\.jade$/

  plugins:
    jade:
      options:
        pretty: yes
    static_jade:
      extension: '.html.jade'
      asset:     'public'

  modules:
    nameCleaner: (path) ->
      # make index files available as e.g. require('effects')
      # instead of require('effects/index')
      path = path.replace /\/index\.(js|coffee|jade)$/, ''

      # make app files available as e.g. require('templates/...')
      # instead of require('app/templates/...')
      path = path.replace /^app\//, ''

      # make bower components available as e.g. require('underscore')
      # instead of require('bower_componens/underscore/underscore')
      path = path.replace /^bower_components\/(.*\/)?/, ''

      path
