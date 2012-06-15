Feature: Registration

  Scenario: User submits valid data for registration
    Given I am an unregistered user
    When I submit the following values for registration:
      | username   | foobar      |
      | email      | foo@bar.com |
      | password   | foobar      |
      | first_name | foo         |
      | last_name  | bar         |
      | dob        | 09/10/1981  |
      | gender     | M           |
    Then I should have a valid user account

  Scenario: User submits missing data for registration
    Given I am an unregistered user
    When I submit the following values for registration:
      | username   |  |
      | email      |  |
      | password   |  |
      | first_name |  |
      | last_name  |  |
      | dob        |  |
      | gender     |  |
    Then I should see required registration errors for each field
