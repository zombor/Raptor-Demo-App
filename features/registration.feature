Feature: Registration

  Scenario: User submits valid data for registration
    Given I am an unregistered user
    When I submit the following values for registration:
      | email       | password |
      | foo@bar.com | foobar   |
    Then I should have a valid user account

