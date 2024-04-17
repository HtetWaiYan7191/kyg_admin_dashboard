require "test_helper"

class BlogTest < ActiveSupport::TestCase
  def setup 
    @blog_one = blogs(:one)
    unless @blog_one.valid?
      puts @blog_one.errors.full_messages
    end
  end

  test ' blog one should be valid ' do
    assert @blog_one.valid?
  end

  test ' views count should be 0 at default and integer ' do
    assert_equal 0, @blog_one.views_count
    @blog_one.views_count = 'str'
    assert_not @blog_one.valid?
  end

  test 'status should be pending' do
    assert_equal 'pending', @blog_one.blog_status
  end

  test 'delete flg should be true or false'do
    assert_equal false, @blog_one.delete_flg
  end

  test 'title should not be nil' do
    @blog_one.title = nil
    assert_not @blog_one.valid?
  end
end
