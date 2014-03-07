namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do

    10.times do |n|
      prenom = Faker::Name.first_name 
      nom = Faker::Name.last_name
      fullname = prenom + " " + nom
      email = Faker::Internet.free_email(fullname)
      User.create!(name: fullname, mail: email )
    end
  end

  task relationship: :environment do

    30.times do |n|
      h_id = rand(10)
      f_id = rand(10)
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
          user.send_message(user2, content , title[rand(0..4)] + " " + t.to_s)
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

namespace :db do
  desc "Fill database with sample data"
  task project: :environment do

    action = ["Build", "Smash", "Deploy", "Manage", "Deal"]
    subject = ["the IT department", "the house", "the website", "your life", "your country"]

    5.times do

      project_name = action[rand(4)] + " " + subject[rand(4)]
      content = Faker::Lorem.sentences(3).join

      Project.create(title: project_name , description: content)

    end

    @projects = Project.all
    @projects.each do |project|
      project.users

      r= rand(1..3)
      r.times do
        u = User.find(rand(1..User.count))
        project.users << u unless project.users.include? u == true
      end

      project.users.each do |user|
        r= rand(1..3)
        r.times do
          content = Faker::Lorem.sentences(1).join
          project.comments.create(user_id: user.id, content: content)
        end
      end
    end
  end
end