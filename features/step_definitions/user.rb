Допустим("я регистрируюсь с номером телефона {string} и паролем {string}") do |phone, password|
    visit("/")
    within("#show_form") do
        fill_in('phone', with: phone)
        click_link('#submit')
    end

    within("#new_user") do
        fill_in('user_password', with: password)
        click_link('#create_password')
    end
  end
  
  Если("прошло успешло - добавляем никнейм {string}") do |nickname|
    visit("/authentication/add_nickname")
    within("#nickname") do
        fill_in('user_nickname', with: nickname)
        click_link('#create_nickname')
    end
  end
  
  То("юзер переходит на свою страницу") do
    visit("users/'#{User.last.id}'")
  end