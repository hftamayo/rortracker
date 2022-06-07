class Project < ApplicationRecord
    #model association
    has_many :milestones, dependent: :destroy

    #validations
    validates_presence_of :title, :created_by

    def as_json(options = nil)
        super(:include => [:milestones])
    end
end
