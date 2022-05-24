class Company < ActiveRecord::Base
    has_many :freebies
    has_many :devs, through: :freebies

    def give_freebie(dev, item_name, value)
        freebie = Freebie.create(item_name: item_name, value: value)
        freebie.dev = dev
        freebie.company = self
        freebie.save
    end

    def self.oldest_company
       self.find_by(founding_year: self.all.map {|company| company.founding_year}.min)
    end
end


