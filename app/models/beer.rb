class Beer < ActiveRecord::Base
  validates_uniqueness_of :name

  def points
    5 * first_place_votes +
    4 * second_place_votes +
    3 * third_place_votes +
    2 * fourth_place_votes +
    1 * fifth_place_votes
  end

  User::VOTE_NAMES.each do |name|
    define_method("#{name}_place_votes") do
      User.where("#{name}_place_beer_id" => self.id).count
    end
  end
end
