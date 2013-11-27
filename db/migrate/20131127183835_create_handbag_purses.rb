class CreateHandbagPurses < ActiveRecord::Migration
  def change
    create_table :handbag_purses do |t|
      t.string :purseholder_type, :null => true
      t.integer :purseholder_id, :null => true
      t.string :token, :null => false
      t.datetime :token_expires_at, :null => false
      t.boolean :locked, :default => false

      t.timestamps
    end
    
    #
    # Indexes to make accessing the Purse fast
    #
    add_index :handbag_purses, :purseholder_type
    add_index :handbag_purses, :purseholder_id
    
    # If you want for a purseholder to be able to old many purses
    #add_index :handbag_purses, [:purseholder_type, :purseholder_id]
    
    # If you want for a purseholder to only have one, and only one, purse.
    # In both PostgreSQL and MySQL, NULL values are not considered equal so this unique index works.
    add_index :handbag_purses, [:purseholder_type, :purseholder_id], :unique => true
    
    #
    # The token is a UUID that cannot be null and must be unique 
    #
    add_index :handbag_purses, :token, :unique => true
  end
end
