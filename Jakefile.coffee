task 'default', (params) ->
  jake.logger.log 'A set of useful installation scripts for use with Ubuntu.'
  jake.logger.log 'Run "jake -T" to see a list of available installation scripts.'

desc 'Setup development machine'
task 'setup-dev', ['install-jekyll', 'install-vm'], (params) ->
  jake.logger.log 'DONE'

desc 'Install VM requirements'
task 'install-vm', (params) ->
  cmds = [
    'sudo apt-get -y update'
    'sudo apt-get -y upgrade'
    'sudo apt-get -y install ntp' # Install ntp and configure to stop the virtual machine time from drifting out of sync with real time (common problem!). See https://help.ubuntu.com/community/UbuntuTime
  ]
  callback = ->
    jake.logger.log 'DONE'
    complete()
  options =
    printStdout: true
    printStderr: true
  jake.exec cmds, callback, options

desc 'Install Ruby & Gem'
task 'install-ruby', (params) ->
  cmds = [
    'sudo apt-get -y install ruby-dev rubygems'
  ]
  callback = ->
    jake.logger.log 'DONE'
    complete()
  options =
    printStdout: true
    printStderr: true
  jake.exec cmds, callback, options

desc 'Install Jekyll'
task 'install-jekyll', ['install-ruby'], (params) ->
  cmds = [
    'sudo gem install jekyll'
  ]
  callback = ->
    jake.logger.log 'DONE'
    complete()
  options =
    printStdout: true
    printStderr: true
  jake.exec cmds, callback, options
