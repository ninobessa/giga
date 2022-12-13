puts "Getting list of users..."
url = "https://randomuser.me/api?page=1&results=30&inc=nat,gender,name,email,Picture&nat=br&seed=giga"
json = JSON.load(URI.open(url))
users = json["results"].map { |v| OpenStruct.new(v) }

puts "Creating #{users.size} users..."
users.each do |user|
  user_name = [user.name["first"], user.name["last"]].join(' ')
  user_picture = URI.parse(user.picture["large"]).open

  User.find_or_create_by(email: user.email, name: user_name) do |u|
    u.gender = user.gender
    u.picture.attach(io: user_picture, filename: "#{user_name.parameterize}_picture.jpg")
  end
end
