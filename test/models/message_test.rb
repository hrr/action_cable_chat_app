require 'test_helper'

class MessageTest < ActiveSupport::TestCase

  def setup
    @user = users(:example);
    @message = @user.messages.build(content: "Lorem ipsum")
    @message_mention = @user.messages.build(content: "@example")
  end

  test "should be valid" do
    assert @message.valid?, @message.errors.full_messages
  end

  test "should not be blank" do
    @message.content = " "
    assert !@message.valid?
  end
  
  test "example user should get mention" do
    assert_equal @message_mention.mentions.count, 1
  end
  
  test "example user shouldn't get mention" do
    assert_equal @message.mentions.count, 0
  end
end
