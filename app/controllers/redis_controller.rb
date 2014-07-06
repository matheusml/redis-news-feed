require "redis"

class RedisController < ApplicationController
	def redis
		redis = Redis.new

		users = 1..10
		users.each do |user|
			100.times do |t|
				redis.zadd("user:#{user}", 1, t)
				redis.zremrangebyrank("user:#{user}", 100, -1)
			end
		end
		
		@get = redis.zcard("user:1")
	end
end
