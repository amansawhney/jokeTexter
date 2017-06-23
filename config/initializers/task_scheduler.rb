scheduler = Rufus::Scheduler.new
scheduler.every("1m") do
  User.sendMoreJokesBitch
end