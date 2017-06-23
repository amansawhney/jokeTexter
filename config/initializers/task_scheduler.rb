scheduler = Rufus::Scheduler.new
scheduler.every("1d") do
  User.sendMoreJokesBitch
end