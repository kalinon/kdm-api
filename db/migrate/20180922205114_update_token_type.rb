class UpdateTokenType < ActiveRecord::Migration[5.1]
  def change
    change_column :oauth_access_tokens, :token, :text
  end
end
