Если("прошло успешло - редактирую пост текстом {string}") do |post|
    visit("posts")
    first('.dropdown-toggle').click
    first('.dropdown-item').click
    within("#edit_post") do
        fill_in('post_description', with: post)
        find('input[name="commit"]').click
    end
  end
  
  То("после редактирования поста пост изменяется") do
    expect(page).to have_content('теперь редактированный')
    visit("/posts")
    expect(page).to have_content('теперь редактированный')
  end