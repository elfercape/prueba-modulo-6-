class AddUsersToPostulations < ActiveRecord::Migration[7.2]
  def change
    add_reference :postulations, :user, null: false, foreign_key: true
    add_reference :postulations, :offer, null: false, foreign_key: true
  end
end
