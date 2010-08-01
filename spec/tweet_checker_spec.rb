require File.dirname(__FILE__) + '/spec_helper.rb'

FakeWeb.allow_net_connect = false
FakeWeb.register_uri(:get, 'http://api.twitter.com/1/statuses/public_timeline.json',
                     :body => 'spec/sample.json')
FakeWeb.register_uri(:get, 'http://username:password@api.twitter.com/1/statuses/friends_timeline.json',
                     :body => 'spec/sample.json')

describe TweetChecker, ".public_timeline" do
  before(:all) do
    @tweet = TweetChecker.public_timeline(1).first
  end

  it 'public_timeline should get data from twitter' do
    TweetChecker.new.get_data('public_timeline.json').class.should eql(String)
  end
  it 'public_timeline should return a valid Tweet object' do
    @tweet.should be_an_instance_of(Tweet)
  end
  it 'should populate date' do
    @tweet.date.class.should eql(DateTime)
    @tweet.date.to_s.should eql('2010-07-23T14:47:37+00:00')
  end
  it 'should populate id' do
    @tweet.id.class.should eql(Fixnum)
    @tweet.id.should eql(19344776000)
  end
  it 'should populate text' do
    @tweet.text.class.should eql(String)
    @tweet.text.should eql("This should be something interesting and/or witty")
  end
  it 'should populate source' do
    @tweet.source.class.should eql(String)
    @tweet.source.should eql('web')
  end
  it 'should populate user_name' do
    @tweet.user_name.class.should eql(String)
    @tweet.user_name.should eql('Mike Admire')
  end
  it 'should populate profile_image_url' do
    @tweet.profile_image_url.class.should eql(String)
    @tweet.profile_image_url.should eql('http://example.com/example.jpg')
  end
  it 'should populate screen_name' do
    @tweet.screen_name.class.should eql(String)
    @tweet.screen_name.should eql('mikeadmire')
  end
end

describe TweetChecker, ".friends_timeline" do
  before(:all) do
    @tweet = TweetChecker.new('username','password').friends_timeline(1).first
  end

  it 'friends_timeline should get data from twitter' do
    TweetChecker.new('username','password').get_data('friends_timeline.json', true).class.should eql(String)
  end
  it 'friends_timeline should get a valid tweet object' do
    @tweet.should be_an_instance_of(Tweet)
  end
  it 'should populate date' do
    @tweet.date.class.should eql(DateTime)
    @tweet.date.to_s.should eql('2010-07-23T14:47:37+00:00')
  end
  it 'should populate id' do
    @tweet.id.class.should eql(Fixnum)
    @tweet.id.should eql(19344776000)
  end
  it 'should populate text' do
    @tweet.text.class.should eql(String)
    @tweet.text.should eql("This should be something interesting and/or witty")
  end
  it 'should populate source' do
    @tweet.source.class.should eql(String)
    @tweet.source.should eql('web')
  end
  it 'should populate user_name' do
    @tweet.user_name.class.should eql(String)
    @tweet.user_name.should eql('Mike Admire')
  end
  it 'should populate profile_image_url' do
    @tweet.profile_image_url.class.should eql(String)
    @tweet.profile_image_url.should eql('http://example.com/example.jpg')
  end
  it 'should populate screen_name' do
    @tweet.screen_name.class.should eql(String)
    @tweet.screen_name.should eql('mikeadmire')
  end

end
