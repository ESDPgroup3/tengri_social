Допустим("я регистрируюсь с номером телефона {string} и паролем {string}") do |phone, password|
  visit("/")
  within("#show_form") do
      fill_in('phone', with: phone)
      find('#submit').click
    end    

  within("#new_user") do
      fill_in('user_password', with: password)
      find('#create_password').click
  end
end
Если("прошло успешло - добавляем никнейм {string}") do |nickname|
  within("#nickname") do
  fill_in('user_nickname', with: nickname)
  wait_for_ajax
  # expect(page).to have_css('.send-information')
  find('input[name="commit"]').click
  end
end

То("юзер переходит на свою страницу и может посмотреть ленту") do
  visit("/posts")
end