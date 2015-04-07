require 'rails_helper'

RSpec.describe User, type: :model do

    before :each do
        @auth = OmniAuth.config.mock_auth[:twitter]
    end

    describe 'creating a new user' do
        it 'should register users using OAuth data' do
            user = User.create_from_auth @auth
            user.username.should === 'fake_test_user'
        end
    end

    describe 'instances' do
        it 'should have a film list' do
            user = User.create_from_auth @auth
            user.lists.length.should >= 1
        end
    end

end