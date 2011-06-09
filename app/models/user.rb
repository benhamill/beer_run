class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  # :registerable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  VOTE_NAMES = %w{first second third fourth fifth}

  VOTE_NAMES.each do |name|
    belongs_to "#{name}_place_beer", :class_name => 'Beer'
  end

  def votes=(beers)
    beers.first(5).each_with_index do |beer, idx|
      self.send("#{VOTE_NAMES[idx]}_place_beer_id=", beer.id)
    end
  end
end
