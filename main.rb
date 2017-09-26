# coding: utf-8
require 'dxruby'

require_relative 'player'
require_relative 'enemy'

Window.width  = 800
Window.height = 600

player_img = Image.load("player.png")
player_img.setColorKey([0, 0, 0])

enemy_img = Image.load("enemy.png")
enemy_img.setColorKey([0, 0, 0])

player = Player.new(400, 500, player_img)

enemies = []
10.times do
  enemies << Enemy.new(rand(800), rand(600), enemy_img)
end


Window.loop do
  break if Input.keyPush?(K_ESCAPE)
  Sprite.update(enemies)
  Sprite.draw(enemies)
  enemies.each{ |enemie|
    if enemie.vanished
    enemies  <<  Enemy.new(rand(800), rand(600), enemy_img)
    enemie.vanished = false
    end
}
  
  player.update
  player.draw

  # 当たり判定
  if Sprite.check(player, enemies)
    enemies  <<  Enemy.new(rand(800), rand(600), enemy_img)
  end
end