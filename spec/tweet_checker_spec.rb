require File.dirname(__FILE__) + '/spec_helper.rb'

FakeWeb.allow_net_connect = false
FakeWeb.register_uri(:get, 'http://api.twitter.com/1/statuses/public_timeline.json',
                     :body => 'spec/sample.json')
FakeWeb.register_uri(:get, 'http://username:password@api.twitter.com/1/statuses/friends_timeline.json',
                     :body => 'spec/sample.json')

describe TweetChecker do
  before do
    @tweet = TweetChecker.new('username','password')
  end

  it 'public_timeline should get data from twitter' do
    TweetChecker.new.get_data('public_timeline.json').class.should eql String
  end

  it 'public_timeline should return a valid Tweet object' do
    TweetChecker.public_timeline(1).first.should be_an_instance_of(Tweet)
  end

  it 'public_timeline should have valid datatypes in Tweet attributes' do
    tweet = TweetChecker.public_timeline(1).first
    tweet.date.class.should eql DateTime
    tweet.id.class.should eql Fixnum
    tweet.text.class.should eql String
    tweet.source.class.should eql String
    tweet.user_name.class.should eql String
    tweet.profile_image_url.class.should eql String
    tweet.screen_name.class.should eql String
  end

  it 'friends_timeline should get data from twitter' do
    @tweet.get_data('friends_timeline.json', true).class.should eql String
  end

  it 'friends_timeline should get a valid tweet object' do
    @tweet.friends_timeline(1).first.should be_an_instance_of(Tweet)
  end

  it 'friends_timeline should have valid datatypes in Tweet attributes' do
    tweet = @tweet.friends_timeline(1).first
    tweet.date.class.should eql DateTime
    tweet.id.class.should eql Fixnum
    tweet.text.class.should eql String
    tweet.source.class.should eql String
    tweet.user_name.class.should eql String
    tweet.profile_image_url.class.should eql String
    tweet.screen_name.class.should eql String
  end

end

