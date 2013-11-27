module Handbag
  class ApplicationController < ActionController::Base
    # 
    # All requests should have a valid purse ready to go
    def current_purse
      #puts "debug current_purse: Current_purse called"
    
      unless @current_purse
        #puts "debug current_purse: There is no current purse"
        if current_user and current_user.purse
          if current_user.purse
            #puts "debug current_purse: Getting the current purse from the user"
            @current_purse = current_user.purse
          else
            @current_purse = Purse.find_or_create_by_token(visitor_token())
          end
        else
          #puts "debug current_purse: Getting the current purse from the scriptive visitor token"
          @current_purse = Purse.find_or_create_by_token(visitor_token())
          #puts "debug current_purse: Returned #{@current_purse}"
        end

      end
      raise PurseNotFoundException.new unless @current_purse
    
      return @current_purse
    end # current_purse
        
    protected
    
    def purse_valid_until
      2.weeks.from_now
    end
    
    def set_signed_visitor_token(token)
      # Freshen the expiration date
      cookies.signed[:token] = {
        :value    => token,
        :expires  => purse_valid_until
      }
    end
  
    def reset_visitor_token
      @token = Purse.random_token
      set_signed_visitor_token(@token)
      return @token 
    end
  
    def visitor_token
      if cookies.signed[:token] && Purse.valid_token?(cookies.signed[:token])
        @token = cookies.signed[:token]
      else
        @token = Purse.random_token 
      end
      set_signed_visitor_token(@token)
      return @token
    end
  end # Application Controller 
end # module Handbag
