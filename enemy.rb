# coding: utf-8

class Enemy < Sprite
attr_accessor :vanished

  def initialize(x,y,img)
    super
    @vanished = false
  end

  def update
    self.y += 0.5
    if self.y >= Window.height - self.image.height
      self.vanish
    @vanished = true
    end
  end

  # 他のオブジェクトから衝突された際に呼ばれるメソッド
  def hit(obj)
    self.vanish
  end
end