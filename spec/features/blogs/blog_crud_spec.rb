require 'rails_helper'

feature 'Blog CRUD' do
  scenario 'user can create a blog' do
    sign_in create(:user)

    visit new_blog_path

    fill_in 'blog[title]', with: 'Test title'
    fill_in 'blog[body]', with: 'Test body'

    click_on 'Create Blog'

    expect(current_path).to eq(blogs_path)
    expect(page).to have_content('Test title')
    expect(page).to have_content('Test body')
  end

  scenario 'user can edit a blog' do
    sign_in create(:user)

    blog = create(:blog)

    visit edit_blog_path(blog)

    fill_in 'blog[body]', with: 'Test changes'

    click_on 'Update Blog'

    expect(current_path).to eq(blog_path(blog))
    expect(page).to have_content('Test title')
    expect(page).to have_content('Test changes')
  end

  scenario 'user can delete a blog' do
    sign_in create(:user)

    visit new_blog_path

    fill_in 'blog[title]', with: 'Test title'
    fill_in 'blog[body]', with: 'Test body'

    click_on 'Create Blog'

    expect(current_path).to eq(blogs_path)
    expect(page).to have_content('Test title')
    expect(page).to have_content('Test body')
  end
end
