class Freebie < ActiveRecord::Base
    belongs_to :dev 
    belongs_to :company

    # Freebie#dev => already returned by the belongs_to :dev above
    # Freebie#company => already returned by the belongs_to :company above

    def print_details
        "#{self.dev.name} owns a #{self.item_name} from #{self.company.name}"
    end
end
