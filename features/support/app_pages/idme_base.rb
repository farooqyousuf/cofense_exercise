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

def code_css
  find("strong")["data-code"]
end

 def fill_in_code(code)
   fill_in("code", :with => code)
 end

def fill_in_email_by_id(email)
  fill_in("user_email", :with => email)
end

 def fill_in_email_by_name(email)
   fill_in("email", :with => email)
 end
 
def fill_in_password(password)
  fill_in("user_password", :with => password)
end

def click_sign_in
  click_button("Sign in")
end
 
def unlock_link
   click_link("here")
end

end