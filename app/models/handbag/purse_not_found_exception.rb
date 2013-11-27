module Handbag
  class PurseNotFoundException < Exception
    def to_s
      "Fatal: The purse must be initiated before proceeding."
    end
  end
end