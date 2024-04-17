require "test_helper"

class TestimonialTest < ActiveSupport::TestCase
  def setup
    @testimonial_one = testimonials(:one)
    unless  @testimonial_one.valid?
      puts @testimonial_one.errors.full_messages
    end
  end

  test 'should be valid 'do
    assert @testimonial_one.valid?
  end

  test 'name should not be nil'do
    @testimonial_one.name = nil
    assert_not @testimonial_one.valid?
  end

  test 'speech should not be nil'do
    @testimonial_one.speech = nil
    assert_not @testimonial_one.valid?
  end
end
