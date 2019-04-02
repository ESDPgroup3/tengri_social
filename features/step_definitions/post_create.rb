Допустим("я вхожу в приложение {string} и паролем {string}") do |phone, password|
    visit("/")
    within("#show_form") do
        fill_in('phone', with: phone)
        find('#submit').click
    end

    within("#new_user") do
        fill_in('send_password', with: password)
        find('.send-information').click
    end
  end
  
  Если("прошло успешло - создаю пост с текстом {string}") do |post|
    visit("posts/new")
    within("#write_new_post") do
        fill_in('post_description', with: post)
        find('input[name="commit"]').click
    end
  end
  
  То("после создание поста переходим на страницу просмотра") do
    expect(page).to have_content 'Это первый пост'
  end