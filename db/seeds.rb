[
  User,
  Beer
].each do |model|
  model.delete_all
end

Beer.create name: 'Independence Convict Hill'
Beer.create name: 'Natural Bohemian'
Beer.create name: 'Strongbow (Actually Cider)'
Beer.create name: 'Negra Modelo'
Beer.create name: "Fireman's Four"
Beer.create name: 'Dos XX (lager)'
Beer.create name: 'Peroni'

User.create email: 'bob@gmail.com', password: 'password'
User.create email: 'jen@gmail.com', password: 'password'
User.create email: 'ted@gmail.com', password: 'password'

User.find_each do |user|
  beers = Beer.order('random()').limit(5)
  user.update_attribute :votes, beers
end
