class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.column :name, :string
      t.column :email, :string
      t.column :username, :string
      t.column :password_digest, :string
      t.column :question_id, :integer

      t.timestamps
    end
  end
end
