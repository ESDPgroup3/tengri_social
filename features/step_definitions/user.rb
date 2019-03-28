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
        find('#create_nickname').click
    end
   

  end
  
  То("юзер переходит на свою страницу и может посмотреть ленту") do
    # visit("users/#{User.last.id}")
    visit("/posts")
  end