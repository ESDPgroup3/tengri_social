Допустим("я регистрируюсь с номером телефона {string} и паролем {string}") do |phone, password|
    visit("/")
    within("#show_form") do
        fill_in('phone', with: phone)
        click_on('Продолжить')
    end

    within("#new_user") do
        fill_in('user_password', with: password)
        click_on('Продолжить')
    end
  end
  
  Если("прошло успешло - добавляем никнейм {string}") do |nickname|
    visit("/authentication/add_nickname")
    within("#nickname") do
        fill_in('user_nickname', with: nickname)
        click_on('Продолжить')
    end
  end
  
  То("юзер переходит на свою страницу") do
    visit("users/'#{User.last.id}'")
  end