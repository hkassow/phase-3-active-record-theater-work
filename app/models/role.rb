class Role < ActiveRecord::Base
    has_many :auditions
    def auditions
        Audition.where(role_id:self.id)
    end
    def actors
        auditions.map{|audition| audition.actor}
    end
    def locations
        Set.new(auditions.map{|audition| audition.location}).to_a
    end
    def lead
        Audition.find_by(role_id: self.id, hired: true )
    end
    def understudy
        Audition.where(role_id: self.id, hired: true).second

    end
end