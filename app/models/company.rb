class Company < ActiveRecord::Base
    has_many :freebies
    has_many :devs, through: :freebies

    # Company#freebies
    # Company#devs

    def give_freebie (dev, item_name, value)
        new_freebie = Freebie.create(item_name: item_name, value: value)
        new_freebie.company = self
        new_freebie.dev = dev
        new_freebie.save
    end

    def self.oldest_company
        min = self.minimum("founding_year")
        self.where("founding_year = ?", min).first
    end
end
