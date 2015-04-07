class User < ActiveRecord::Base

    has_one :list

    validates :uid, :username, :name,
        presence: true

    def self.create_from_auth(auth)
        User.create uid: auth.uid,
            username: auth.info.nickname,
            name: auth.info.name
    end

    def display_username
        "@" + self.username
    end

end