module.exports = (robot) ->
  robot.arm = (type) ->
    require "hubot-#{type}-arm"
