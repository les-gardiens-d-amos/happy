require "bcrypt"

user_one_id = SecureRandom.uuid

User.create({
              id: user_one_id,
              email: "toto@gmail.com",
              name: "toto",
              password: BCrypt::Password.create("totototo")
            })

user_two_id = SecureRandom.uuid

User.create({
              id: user_two_id,
              email: "yoyo@gmail.com",
              name: "yoyo",
              password: BCrypt::Password.create("yoyoyoyo")
            })

amo_one_id = SecureRandom.uuid

Amo.create({
             id: amo_one_id,
             user_id: user_one_id,
             animal_id: 1,
             species: "Chat",
             amos_type: "Mammifère",
             name: "chatchat",
             image_path: "./fake/image"
           })

amo_two_id = SecureRandom.uuid

Amo.create({
             id: amo_two_id,
             user_id: user_two_id,
             animal_id: 2,
             species: "Chien",
             amos_type: "Mammifère",
             name: "chienchien",
             image_path: "./fake/image"
           })

Catch.create({
               id: SecureRandom.uuid,
               amos_id: amo_one_id,
               long: 1,
               lat: 2,
               altitude: 3,
               accuracy: 4
             })

Catch.create({
               id: SecureRandom.uuid,
               amos_id: amo_two_id,
               long: 1,
               lat: 2,
               altitude: 3,
               accuracy: 4
             })
