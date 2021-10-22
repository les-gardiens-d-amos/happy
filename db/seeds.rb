require 'bcrypt'

User.create({
    :id => SecureRandom.uuid,
    :email => "toto@gmail.com",
    :name => "toto",
    :password => BCrypt::Password.create("totototo") 
})

User.create({
    :id => SecureRandom.uuid,
    :email => "yoyo@gmail.com",
    :name => "yoyo",
    :password => BCrypt::Password.create("yoyoyoyo") 
})
