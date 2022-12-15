require "rails_helper"

RSpec.feature "Users index", :type => :feature do

  scenario 'shows the static text' do
    visit root_path

    expect(page).to have_content('Usuários')
    expect(page).to have_content('Nome')
    expect(page).to have_content('E-mail')
    expect(page).to have_content('Sexo')
  end
end
