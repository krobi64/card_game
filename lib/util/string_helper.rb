module Util
  module StringHelper
    def pluralize(word)
      if word.to_s.end_with?("s")
        word
      else
        word << "s"
      end
      word
    end
  end
end