
  Если("прошло успешло - перехожу на его страничку и подписывають") do
    visit("users/#{User.last.id}")
    click_link('Подписаться')
  end
  
  То("юзер  появляется на странице моих подписок") do
    visit("/users/#{User.first.id}/follows")
    expect(page).to have_content('marina')
  end