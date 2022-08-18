class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    # Dev#freebies
    # Dev#devs

    def received_one? (item_name)
        match_freebie = self.freebies.find { 
            |freebie| freebie.item_name == item_name 
        }
        return match_freebie != nil
    end

    def give_away (dev, freebie)
        if freebie.dev == self
            freebie.dev = dev
            freebie.save
        end
    end
end
