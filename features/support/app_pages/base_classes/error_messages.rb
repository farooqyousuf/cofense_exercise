module ErrorMessages

  def error_on(field)
  	value = (all('.error')[field]['class']) 
    ["error", 
     "select2-container government-affiliation error", 
     "select2-container state-select error", 
     "select2-container dd214-component error",
     "select2-container dd214-branch error",
     "select2-container dd214-officer error"].include?(value)
  end

end