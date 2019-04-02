@user = User.create(
    phone: '2222222222', 
    password: '123456789', 
    nickname: 'tm20388'
)
@user1 = User.create(
    phone: '1111111111', 
    password: '123456789', 
    nickname: 'marina'
)
@user.save
@user1.save
