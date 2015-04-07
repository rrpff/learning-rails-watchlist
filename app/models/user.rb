class User < ActiveRecord::Base

    has_many :lists
    has_many :watcheds

    validates :uid, :username, :name,
        presence: true

    after_create do
        # Add a "films" list collection on creation
        self.lists << List.new
    end

    def self.create_from_auth(auth)
        User.create uid: auth.uid,
            username: auth.info.nickname,
            name: auth.info.name
    end

    def display_username
        "@" + self.username
    end

    def has_seen?(film)
        self.watcheds.find_by(watchable_id: film.id)
    end

    def to_param
        username
    end

end