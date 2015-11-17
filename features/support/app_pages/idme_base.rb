class IDmeBase

include Capybara::DSL
attr_reader :url

 def initialize(url)
   @url = url
 end

 def visit
   super(url)
 end
 
end