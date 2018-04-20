if ENV["REDIS_URL"]
  Resque.redis = Redis.new(:url => ENV["REDIS_URL"])
else
  Resque.redis = Redis.new
end
