class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  # :registerable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  validate :check_beers

  VOTE_NAMES = %w{first second third fourth fifth}

  VOTE_NAMES.each do |name|
    belongs_to "#{name}_place_beer", :class_name => 'Beer'
  end

  def votes=(beers)
    VOTE_NAMES.each_with_index do |name, idx|
      self.send("#{name}_place_beer=", beers[idx])
    end
  end

  def votes
    VOTE_NAMES.collect do |name|
      self.send("#{name}_place_beer")
    end
  end

  private

  def check_beers
    has_all_five = VOTE_NAMES.all? do |name|
      self.send("#{name}_place_beer")
    end

    has_no_beers = VOTE_NAMES.all? do |name|
      !self.send("#{name}_place_beer")
    end

    if has_all_five or has_no_beers
      return true
    else
      errors.add(:you, 'must select exactly five beers.')
      return false
    end
  end
end
