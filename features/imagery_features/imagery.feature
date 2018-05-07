Feature: Compare AAMVA file to source document

  Scenario: Successfully compare source document to self
    * I compare an "exact_match" csv file against the source document

  Scenario: Compare source document with missing driver's licenses data
    * I compare an "missing_dl" csv file against the source document

  Scenario: Missing field
    * I compare the master aamva file against an aamva file that has a missing field
