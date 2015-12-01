class IDmeBase

include Capybara::DSL

#Readable attributes
#Allows the url attribute to be read/accessed outside of this class
attr_reader :url

 #Constructs IDmeBase's data structure
 #Every IDmeBase object will contain a @url variable
 def initialize(url)
   @url = url
 end

 #calls Capybara's visit method
 def visit
   super(url)
 end
 
end