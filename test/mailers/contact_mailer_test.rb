require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  test "should return contact email" do
  mail = ContactMailer.contact_email("bob@me.com",
  "Bob", "1234567890", @message = "Hello")
  assert_equal ['info@mynotes.com'], mail.to
  assert_equal ['info@mynotes.com'], mail.from
  end
end
