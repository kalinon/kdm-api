# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_180_922_205_114) do
  create_table 'cause_of_deaths', force: :cascade do |t|
    t.string 'name'
    t.string 'safe_name'
    t.integer 'context', default: 0
    t.integer 'expansion_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['expansion_id'], name: 'index_cause_of_deaths_on_expansion_id'
    t.index ['safe_name'], name: 'index_cause_of_deaths_on_safe_name'
  end

  create_table 'epithets', force: :cascade do |t|
    t.string 'name'
    t.string 'safe_name'
    t.boolean 'selectable', default: true
    t.string 'color', default: '#fff'
    t.string 'bg_color', default: '#fff'
    t.string 'border_color', default: '#333'
    t.integer 'gender'
    t.integer 'expansion_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['expansion_id'], name: 'index_epithets_on_expansion_id'
    t.index ['safe_name'], name: 'index_epithets_on_safe_name'
  end

  create_table 'expansions', force: :cascade do |t|
    t.string 'name'
    t.string 'safe_name'
    t.date 'released'
    t.string 'color'
    t.string 'bg_color'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['safe_name'], name: 'index_expansions_on_safe_name'
  end

  create_table 'gear_types', force: :cascade do |t|
    t.string 'name'
    t.string 'safe_name'
    t.string 'color', default: '#333'
    t.string 'font_color', default: '#fff'
    t.integer 'expansion_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['expansion_id'], name: 'index_gear_types_on_expansion_id'
    t.index ['safe_name'], name: 'index_gear_types_on_safe_name'
  end

  create_table 'locations', force: :cascade do |t|
    t.string 'name'
    t.string 'safe_name'
    t.string 'color'
    t.string 'font_color'
    t.integer 'expansion_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['expansion_id'], name: 'index_locations_on_expansion_id'
    t.index ['safe_name'], name: 'index_locations_on_safe_name'
  end

  create_table 'monsters', force: :cascade do |t|
    t.string 'name'
    t.string 'safe_name'
    t.boolean 'is_quarry'
    t.boolean 'is_nemesis'
    t.boolean 'is_unique'
    t.integer 'expansion_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['expansion_id'], name: 'index_monsters_on_expansion_id'
    t.index ['safe_name'], name: 'index_monsters_on_safe_name'
  end

  create_table 'oauth_access_grants', force: :cascade do |t|
    t.integer 'resource_owner_id', null: false
    t.integer 'application_id', null: false
    t.string 'token', null: false
    t.integer 'expires_in', null: false
    t.text 'redirect_uri', null: false
    t.datetime 'created_at', null: false
    t.datetime 'revoked_at'
    t.string 'scopes'
    t.index ['application_id'], name: 'index_oauth_access_grants_on_application_id'
    t.index ['token'], name: 'index_oauth_access_grants_on_token', unique: true
  end

  create_table 'oauth_access_tokens', force: :cascade do |t|
    t.integer 'resource_owner_id'
    t.integer 'application_id'
    t.text 'token', null: false
    t.string 'refresh_token'
    t.integer 'expires_in'
    t.datetime 'revoked_at'
    t.datetime 'created_at', null: false
    t.string 'scopes'
    t.string 'previous_refresh_token', default: '', null: false
    t.index ['application_id'], name: 'index_oauth_access_tokens_on_application_id'
    t.index ['refresh_token'], name: 'index_oauth_access_tokens_on_refresh_token', unique: true
    t.index ['resource_owner_id'], name: 'index_oauth_access_tokens_on_resource_owner_id'
    t.index ['token'], name: 'index_oauth_access_tokens_on_token', unique: true
  end

  create_table 'oauth_applications', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'uid', null: false
    t.string 'secret', null: false
    t.text 'redirect_uri', null: false
    t.string 'scopes', default: '', null: false
    t.boolean 'confidential', default: true, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['uid'], name: 'index_oauth_applications_on_uid', unique: true
  end

  create_table 'resource_types', force: :cascade do |t|
    t.string 'name'
    t.string 'safe_name'
    t.string 'color'
    t.integer 'expansion_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['expansion_id'], name: 'index_resource_types_on_expansion_id'
    t.index ['safe_name'], name: 'index_resource_types_on_safe_name'
  end

  create_table 'survival_actions', force: :cascade do |t|
    t.string 'name'
    t.string 'safe_name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'username', null: false
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.string 'current_sign_in_ip'
    t.string 'last_sign_in_ip'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  create_table 'weapon_proficiencies', force: :cascade do |t|
    t.string 'name'
    t.string 'safe_name'
    t.integer 'expansion_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['expansion_id'], name: 'index_weapon_proficiencies_on_expansion_id'
    t.index ['safe_name'], name: 'index_weapon_proficiencies_on_safe_name'
  end
end
