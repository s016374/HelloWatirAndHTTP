Feature: Search In order to use Google users must be able to search for content
  Scenario: Search for a term
    Given prepare browser "chrome"
    When I open "google.com", entered "watir" into the query and click search
    Then I should see some results
