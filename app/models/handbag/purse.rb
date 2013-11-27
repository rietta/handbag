##
# The base for a Purse that you can use in your application
module Handbag
  require 'uuidtools'
  class Purse < ActiveRecord::Base
    
    #
    # A purse belongs to either a purse holder or it has a random token
    #
    belongs_to :purseholder, :polymorphic => true
    has_one :location, :as => :locatable, :autosave => true, :dependent => :destroy

    validates :purseholder_id, :allow_nil => true, :uniqueness => {:allow_nil => true, :scope => :purseholder_type}

    validates :token,
              :allow_nil => false,
              :uniqueness => true, 
              :length => {:allow_nil => true, :minimum => 36, :maximum => 255}

    # Ensure that this purse is actively associated with a purseholder or has a scriptive token
    validate do
      unless locked?
        unless (purseholder_type && purseholder_id && purseholder_id.to_i > 0) || token
          errors.add :token, "This Purse must have a scriptive token set or be owned by a purseholder."
        end
      end
    end

    # Generate a random token when a new Purse is created
    after_initialize do
      unless purseholder
        self.token = random_token() unless self[:token]
      end
    end

    def to_s
      "Purse #{id}"
    end

    def anonymous?
      return purseholder.nil?
    end
  
    def self.valid_token?(token)
      return (token && token.to_s.length >= 36)
    end
      
    protected
    
    def set_random_token
    end
    
    def random_token
      UUIDTools::UUID.random_create.to_s
    end
    
  end # class Purse
end # module Handbag
