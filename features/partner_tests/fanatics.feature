@fanatics @partners
Feature: Test the ID.me Fanatics Partner Integration

  Background:
    * I add an item to the cart ("FAN")

  @troop_id @windows @sauce
  Scenario: Test Fanatics Shop Military Partner Integration
    * I apply the Troop ID discount ("FAN")
    * I verify the Troop ID discount has been applied ("FAN")

  @first_responder
  Scenario: Test Fanatics Shop First Responder Partner Integration
    * I apply the First Responder discount ("FAN")
    * I verify the First Responder discount has been applied ("FAN")
