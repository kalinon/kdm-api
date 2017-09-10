# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# @param data [Hash]
def create_expansions(data)
  Expansion.new(name: 'Core', released: DateTime.new(2015, 9)).save

  data.each_value do |exp|
    expansion = {
      name: exp[:name],
      safe_name: exp[:name].parameterize,
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
end

# @param data [Hash]
def create_monsters(data)
  core_exp = Expansion.where(safe_name: 'core').take

  # Quarries
  data[:quarries].each_value do |mon|
    Monster.new(
      name: mon[:name],
      safe_name: mon[:name].parameterize,
      is_quarry: true,
      is_nemesis: false,
      is_unique: false,
      expansion: Expansion.where(safe_name: mon[:expansion]).take || core_exp
    ).save
  end

  # Nemeses
  data[:nemeses].each_value do |mon|
    Monster.new(
      name: mon[:name],
      safe_name: mon[:name].parameterize,
      is_quarry: false,
      is_nemesis: true,
      is_unique: false,
      expansion: Expansion.where(safe_name: mon[:expansion]).take || core_exp
    ).save
  end

  # Unique Quarries
  data[:unique_quarries].each_value do |mon|
    Monster.new(
      name: mon[:name],
      safe_name: mon[:name].parameterize,
      is_quarry: true,
      is_nemesis: false,
      is_unique: true,
      expansion: Expansion.where(safe_name: mon[:expansion]).take || core_exp
    ).save
  end

  # Unique Nemeses
  data[:unique_nemeses].each_value do |mon|
    Monster.new(
      name: mon[:name],
      safe_name: mon[:name].parameterize,
      is_quarry: false,
      is_nemesis: true,
      is_unique: true,
      expansion: Expansion.where(safe_name: mon[:expansion]).take || core_exp
    ).save
  end
end

kdm_manager = JSON.parse(File.read(Rails.root.join('vendor', 'data', 'kdm_manager.json'))).deep_symbolize_keys
# cards = JSON.parse(File.read(Rails.root.join('vendor', 'data', 'cards.json')))

puts "\n== Creating Expansions =="
create_expansions(kdm_manager[:expansions])
puts "\n== Creating Monsters =="
create_monsters(kdm_manager[:monsters])
