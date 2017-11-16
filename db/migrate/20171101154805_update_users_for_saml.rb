class UpdateUsersForSaml < ActiveRecord::Migration[5.1]
  def up
    drop_table :users
    create_table :users do |t|

      ## SAML authenticatable
      t.string :username, null: false

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
