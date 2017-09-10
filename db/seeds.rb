# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

kdm_manager = JSON.parse(File.read(Rails.root.join('vendor', 'data', 'kdm_manager.json'))).deep_symbolize_keys
cards = JSON.parse(File.read(Rails.root.join('vendor', 'data', 'cards.json')))

kdm_manager[:expansions].each_value do |exp|
  expansion = {
    name: exp[:name],
    released: DateTime.new(2016, 3),
    color: '#333',
    bg_color: '#fff'
  }

  if exp[:flair]
    expansion[:color] = exp[:flair][:color]
    expansion[:bg_color] = exp[:flair][:bgcolor]
  end

  if exp[:released] && exp[:released] =~ /\d+/
    expansion[:released] = DateTime.strptime(exp[:released], '%s')
  end
  # puts expansion

  Expansion.new(expansion).save
end
