require 'rails_helper'

RSpec.feature "RegisterUsers", type: :feature do
  context 'I can register' do
    Steps 'To register' do
      Given 'That I am on the registration page' do
        visit '/'
      end
      Then 'I can fill out the form to register' do
        fill_in 'full_name', with: 'Carlos'
        fill_in 'street_address', with: '123 Fake St.'
        fill_in 'city', with: 'San Diego'
        fill_in 'State', with: 'CA'
        fill_in 'postal_code', with: '92909'
        fill_in 'country', with: 'USA'
        fill_in 'email', with: 'cp@hotmail.com'
        fill_in 'user_name', with: 'cpena002'
        fill_in 'password', with: 'damn'
      end
      And 'I can register' do
        click_button 'Register'
      end
    end #Steps
  end #context
  context 'I cant register without a user id and a password' do
    Steps 'To require user id and password to register' do
      Given 'That I am on the registration page' do
        visit '/'
      end
      Then 'I can fill out the form to register' do
        fill_in 'full_name', with: 'Carlos'
        fill_in 'street_address', with: '123 Fake St.'
        fill_in 'city', with: 'San Diego'
        fill_in 'State', with: 'CA'
        fill_in 'postal_code', with: '92909'
        fill_in 'country', with: 'USA'
        fill_in 'email', with: 'cp@hotmail.com'
      end
      Then 'I try to register' do
        click_button 'Register'
      end
      And 'Im told I cant register without a user id and password' do
        save_and_open_page
        expect(page).to have_content "user name and password are required"
      end
    end
  end
end #RSpec
