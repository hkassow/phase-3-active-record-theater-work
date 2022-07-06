class Role < ActiveRecord::Base
    has_many :auditions
    def auditions
        Audition.where(role_id:self.id)
    end
    def actors
        auditions.pluck(:actor)
    end
    def locations
        auditions.pluck(:location)
    end
    def lead
        auditions.find_by(hired: true )
    end
    def understudy
        auditions.where(hired: true).second

    end
end