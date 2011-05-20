[
  User,
  Beer
].each do |model|
  model.delete_all
end

Beer.create :name => 'Independence Convict Hill'
Beer.create :name => 'Natural Bohemian'
Beer.create :name => 'Strongbow (Actually Cider)'
Beer.create :name => 'Negra Modelo'
Beer.create :name => "Fireman's Five"
Beer.create :name => 'Dos XX (lager)'
Beer.create :name => 'Peroni'

User.create :email => 'bob@gmail.com', :password => 'password'
User.create :email => 'jen@gmail.com', :password => 'password'
