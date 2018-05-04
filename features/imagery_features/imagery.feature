Feature:  Compare excel documents

  Scenario: Exact match
    * I compare a exact match csv file against the original csv document

  Scenario: Missing driver's licenses
    * I compare a missing driver's licenses csv file against the original csv document

  Scenario: Missing field
    * I compare the master aamva file against an aamva file that has a missing field
