require 'testing_template'

class Vetting

  def self.vet(reviews)
    check_template = new
    reviews.each { |r| check_template.verify(r) }
  end
 
  attr_reader :testing_template #for potentially different scenarios of checkings
  
  def initialize(testing_template = TestingTemplate.new)
    @testing_template = testing_template
  end
  
  def verify(review)
    @review = review
    set_review(testing_template.verify(review.text))
  end
  
  private
  def set_review(result)
    @review.vet!
    @review.rejection_reason = result[:message]
    result[:status] ? @review.accept! : @review.reject!
  end
end
