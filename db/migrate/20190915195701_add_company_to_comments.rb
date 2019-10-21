class AddCompanyToComments < ActiveRecord::Migration[6.0]
  def change
    add_reference :comments, :company, null: false, foreign_key: true
  end
end
