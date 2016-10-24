Feature: Hello cumcumber

  Scenario Outline: Some cukes
    Given ID = <id>, BOND = <bond>
    When I request API 'bond-web/api/bond/users/ID/comparisons/singlebond'
    Then code is '200', message is 'success'

    Examples:
      | id | bond |
      | 500196 | 103028255 |
      | 500000 | 100000000 |
