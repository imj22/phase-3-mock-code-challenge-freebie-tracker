class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def recieved_one?(item_name)
        self.freebies.find {|freebie| freebie.item_name == item_name} == nil ? false : true
        # i think there is a ruby method that will do code above for me...
    end

    def give_away(dev, freebie)
        freebie_found = self.freebies.find {|self_freebie| self_freebie == freebie}
        # freebie_found == nil ? "this does not belong to you" : freebie_found.dev = dev
        # freebie_found.save

        if freebie_found == nil
            "this does not belong to you"
        else
            freebie_found.dev = dev
            freebie_found.save
        end
    end

end
