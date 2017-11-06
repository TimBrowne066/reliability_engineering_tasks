class Apple < ApplicationRecord
  include Blending
end

class Orange < ApplicationRecord
  include Blending
end

module Blending
  def self.included(Apple)
    Apple.after_save :make_juice
  end

  def make_juice
    puts 'makes juice'
  end
end
