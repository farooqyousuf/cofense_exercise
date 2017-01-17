@desktop @the_limited @top_partners
Feature: Test The Limited Partner Integration
  Background:
    * LIMITED- I visit the shop page
    * LIMITED- I add a item to the cart
    * LIMITED- I visit the checkout flow

  Scenario: Test Limited Military Integration
    * LIMITED- I sign in with my Id.me "military" account
    * LIMITED- I verify my IDme discount was applied

  Scenario: Test Limited Teacher Integration
    * LIMITED- I sign in with my Id.me "teacher" account
    * LIMITED- I verify my IDme discount was applied

  Scenario: Test Limited Student Integration
    * LIMITED- I sign in with my Id.me "student" account
    * LIMITED- I verify my IDme discount was applied
