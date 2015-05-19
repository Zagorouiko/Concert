class Venue < ActiveRecord::Base
  validates(:name, {:presence => true, :length => {:maximum => 50}})
    before_save(:capitalize_name)
    has_and_belongs_to_many(:bands)

    private

    define_method(:capitalize_name) do
      self.name=(name().capitalize())
    end
  end
