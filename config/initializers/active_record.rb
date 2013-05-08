# -*- encoding : utf-8 -*-
module ActiveRecord
  class Base
    def self.random_record
      offset = rand(self.count)
      rand_record = self.first(:offset => offset)
    end
  end
end
