require 'rails_helper'

RSpec.feature "Homepages", type: :feature do

    feature 'sign in on the homepage' do

        scenario 'signing in and getting authorisation' do
            visit '/'

            click_link 'Sign in with Twitter'
            page.should have_content 'Hello, @fake_test_user!'
        end

    end

end
