class Watched < ActiveRecord::Base
    belongs_to :watchable
    belongs_to :user

    before_save :reference_user

    validates_presence_of :user_id,
        :watchable_id, :watchable_type

    private

    def reference_user
        unless self.user_id
            return self.user_id = current_user.id if user_signed_in?
            return false
        end
    end
end
