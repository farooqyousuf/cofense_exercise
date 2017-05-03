module ErrorMessages

  def error_on(field)
    value = (all('.error')[field]['class'])
    ["field text left-half error",
     "field text right-half error",
     "field text error",
     "field select affiliation error",
     "field text left-half error",
     "field text right-half error",
     "field select error",
     "field text error"].include?(value)
  end
end
