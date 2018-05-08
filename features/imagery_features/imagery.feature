Feature: Compare AAMVA file to source document

  Scenario: Exact match
    * I compare the master aamva file against a "exact_match" file

  Scenario: Missing field
    * I compare the master aamva file against a "missing_field" file

  Scenario: Missing driver's license
    * I compare the master aamva file against a "missing_dl" file

  Scenario: Missing state
    * I compare the master aamva file against a "missing_state" file
