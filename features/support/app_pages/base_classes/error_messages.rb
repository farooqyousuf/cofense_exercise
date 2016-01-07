module ErrorMessages

  def error_on(field)
  	value = (all('.error')[field]['class']) 
    ["error", "select2-container government-affiliation error", "select2-offscreen error", "select2-container state-select error"].include?(value)
  end

end