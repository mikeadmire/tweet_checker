require 'rubygems'
require 'open-uri'
require 'base64'
require 'json'


module Checker
  def self.included(base)
    base.extend ClassMethods
  end

  def initialize(username = nil, password = nil)
    @username = username
    @password = password
  end

  module ClassMethods
    def public_timeline(max_count = 5)
      s = self.new
      s.parse_data(max_count, s.get_data("public_timeline.json"))
    end
  end

  def friends_timeline(max_count = 5)
    parse_data(max_count, get_data("friends_timeline.json", true))
  end

  def get_data(request_url, auth = false)
    base_url = 'http://api.twitter.com/1/statuses/'
     begin
      timeout(5) do
        if (auth == true)
          return open(base_url + request_url, "Authorization" => "Basic " <<
                      Base64.encode64("#{@username}:#{@password}")).read
        else
          return open(base_url + request_url).read
        end
      end
    rescue TimeoutError
      puts "ERROR: Timeout error while communicating with Twitter"
      exit
    rescue Exception => ex
      puts "ERROR: Exception while communicating with Twitter"
      puts "#{ex.class} #{ex.message} #{ex.backtrace}"
      exit
    end
  end

  def parse_data(max_count, doc)
    tweets = []
    count = 0
    JSON.parse(doc).each do |i|
      break if count >= max_count
      tweets << assign_tweet_data(i)
      count += 1
    end
    tweets
  end

  def assign_tweet_data(blob)
    tweet = Tweet.new
    tweet.date = DateTime.parse(blob['created_at'])
    tweet.id = blob['id']
    tweet.text = blob['text']
    tweet.source = blob['source']
    tweet.in_reply_to_screen_name = blob['in_reply_to_user_id']
    blob['user'].each do |i|
      case i[0]
      when 'name'
        tweet.user_name = i[1]
      when 'profile_image_url'
        tweet.profile_image_url = i[1]
      when 'screen_name'
        tweet.screen_name = i[1]
      end
    end
    tweet
  end

end

class Tweet
  attr_accessor :date, :id, :text, :source, :in_reply_to_screen_name
  attr_accessor :user_name, :screen_name, :profile_image_url
end

class TweetChecker
  include Checker
end
