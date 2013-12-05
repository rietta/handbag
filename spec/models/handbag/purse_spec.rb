require 'spec_helper'

module Handbag
  

  describe Purse do
  
  
    it "can be built as a stand alone item" do
      p = Purse.new
      p.should be_valid
    
      # It should have a substantial token
      p.token.length == 254
    end
  
    it "must have a purseholder or a handbag token when unlocked" do
      p = Purse.new()
      p.token = nil
      p.locked = false
      p.should be_invalid
    end
  
    it "may be completely disassociated - having neither a purseholder nor a handbag token - when it is locked" do
       p = Purse.new()
       p.token = nil
       p.locked = true
       p.should be_valid
    end
  
    it "does not allow duplicate tokens to be saved" do
      p = Purse.new
      p2 = Purse.new(:token => p.token)
      p.should be_valid
      expect{p.save}.to change{Purse.count}.by(1)
      p2.should be_invalid
      p.destroy
    end
  
    it "the database also enforces the uniqueness of handbag tokens" do
      p = Purse.new
      p2 = Purse.new(:token => p.token)
      p.should be_valid
      expect{p.save}.to change{Purse.count}.by(1)
    
      # This actual test; tell ActiveRecord to skip validations
      expect{p2.save(:validate => false)}.to raise_error(ActiveRecord::RecordNotUnique)
    
      # Cleanup
      p.destroy
    end
  
    it "allows two records that belong to different users to have nil tokens" do
      p1 = Purse.new
      p2 = Purse.new
      p1.purseholder_type = "Blah"
      p1.purseholder_id = 1
      p1.token = nil
      p2.purseholder_type = "Blah"
      p2.purseholder_id = 2
      p2.token = nil
      expect{p1.save}.to change{Purse.count}.by(1)
      p2.should be_valid
      p1.destroy
    end
  
    it "the database also allows two records that belong to different users to have nil tokens" do
      p1 = Purse.new
      p2 = Purse.new
      p1.purseholder_type = "Blah"
      p1.purseholder_id = 1
      p1.token = nil
      p2.purseholder_type = "Blah"
      p2.purseholder_id = 2
      p2.token = nil
      expect{p1.save}.to change{Purse.count}.by(1)
      expect{p2.save}.to change{Purse.count}.by(1)
      p1.destroy
      p2.destroy
    end
  
    it "doesn't allow a singe purseholder to have more than one purse" do
      p1 = Purse.new
      p2 = Purse.new
      p1.purseholder_type = "Blah"
      p1.purseholder_id = 1
      p1.token = nil
      p2.purseholder_type = "Blah"
      p2.purseholder_id = 1
      p2.token = nil
      expect{p1.save}.to change{Purse.count}.by(1)
      p2.should be_invalid
      p1.destroy
    end
  
    it "the database also doesn't allow a singe purseholder to have more than one purse" do
      p1 = Purse.new
      p2 = Purse.new
      p1.purseholder_type = "Blah"
      p1.purseholder_id = 1
      p1.token = nil
      p2.purseholder_type = "Blah"
      p2.purseholder_id = 1
      p2.token = nil
      expect{p1.save}.to change{Purse.count}.by(1)
    
      # This actual test; tell ActiveRecord to skip validations
      expect{p2.save(:validate => false)}.to raise_error(ActiveRecord::RecordNotUnique)
    
      p1.destroy
    end
  
    it "a purse without a purseholder is anonymous" do
      p1 = Purse.new
      p1.should be_anonymous
    end
  
    it "a purse with a purseholder is not anonymous" do
      u = create(:valid_user)
      p2 = u.build_purse
      p2.should_not be_anonymous
      u.destroy
    end
  
    describe "Posessions" do
      
    end

  
  end # Purse specs
  
  
  
end
