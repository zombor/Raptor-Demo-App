Feature: Registration

  Scenario: User submits valid data for registration
    Given I am an unregistered user
    When I submit the following values for registration:
      | email    | foo@bar.com |
      | password | foobar      |
    Then I should have a valid user account

  Scenario Outline: User submits invalid data for registration
    Given I am an unregistered user
    When I submit the following values for registration:
      | email    | <email>    |
      | password | <password> |
    Then I should see a registration error for <error-type>

    Examples:
      | email       | password | error-type |
      | foo@bar.com |          | password   |
      |             | foobar   | email      |
