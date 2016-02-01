require_relative '../base_classes/error_messages.rb'

class MilitaryDocFamily < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def required_fields
    [0,1,2,4,5,6,7,8,9,10,11,13]
  end

end

# [1] pry(#<MilitaryDoc>)> all('.error')[0]['class']
# => "error"
# [2] pry(#<MilitaryDoc>)> all('.error')[1]['class']
# => "error"
# [3] pry(#<MilitaryDoc>)> all('.error')[2]['class']
# => "select2-container service-affiliation error"
# [4] pry(#<MilitaryDoc>)> all('.error')[3]['class']
# => "select2-offscreen error"
# [5] pry(#<MilitaryDoc>)> all('.error')[4]['class']
# => "error"
# [6] pry(#<MilitaryDoc>)> all('.error')[5]['class']
# => "error"
# [7] pry(#<MilitaryDoc>)> all('.error')[6]['class']
# => "error"
# [8] pry(#<MilitaryDoc>)> all('.error')[7]['class']
# => "error"
# [9] pry(#<MilitaryDoc>)> all('.error')[8]['class']
# => "error"
# [10] pry(#<MilitaryDoc>)> all('.error')[9]['class']
# => "error"
# [11] pry(#<MilitaryDoc>)> all('.error')[10]['class']
# => "error"
# [12] pry(#<MilitaryDoc>)> all('.error')[11]['class']
# => "select2-container error"
# [13] pry(#<MilitaryDoc>)> all('.error')[12]['class']
# => "select2-offscreen error"
# [14] pry(#<MilitaryDoc>)> all('.error')[13]['class']
# => "error"
