namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do

    99.times do |n|
      prenom = Faker::Name.first_name 
      nom = Faker::Name.last_name
      fullname = prenom + " " + nom
      email = Faker::Internet.free_email(fullname)
      User.create!(name: fullname, mail: email )
    end
  end

  task relationship: :environment do

    300.times do |n|
      h_id = rand(98)
      f_id = rand(98)
      Relation.create!(home_id: h_id, follow_id:f_id ) if h_id != f_id
    end
  end
end

namespace :db do
  desc "Fill database with sample data"
  task message: :environment do
    users = User.all    
    users.each do |user|
      t = rand(1..3)
      t.times do

        title = ["Hello", "Please", "Tell me", "Could you please?", "Hey man, shut up, will ya?"]
        user2 = User.find(rand(1..User.count))
        if user != user2
          u = [user,user2]
          content = Faker::Lorem.sentences(3).join
          user.send_message(user2, title[rand(0..4)], content)
          c = Conversation.last
          
          r= rand(3)
          r.times do
            content = Faker::Lorem.sentences(3).join
            u[rand(2)].reply_to_conversation(c, content)
          end
        end
      end
    end
  end
end