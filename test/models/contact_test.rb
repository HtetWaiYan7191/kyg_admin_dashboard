require "test_helper"

class ContactTest < ActiveSupport::TestCase
  def setup
    @contact_one = contacts(:one)
    unless  @contact_one.valid?
      puts @contact_one.errors.full_messages
    end
  end

  test ' contact should be valid' do
    assert @contact_one.valid?
  end

  test 'phone number should be correct format' do
    @contact_one.phone_number = 'hello'
    assert_not @contact_one.valid?
    @contact_one.phone_number = '1' * 13
    assert_not @contact_one.valid?
    @contact_one.phone_number = '094563258'
    assert @contact_one.valid?
  end

  test 'email should be the right format' do
    @contact_one.email = 'hello'
    assert_not @contact_one.valid?
    @contact_one.email = 'hello@gmail.com'
    assert @contact_one.valid?
  end
end
