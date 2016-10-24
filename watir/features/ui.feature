Feature: Search In order to use Google users must be able to search for content
  Scenario: Search for a term
    Given I have entered "watir" into the query
    When I click "btnK"
    Then I should see some results
