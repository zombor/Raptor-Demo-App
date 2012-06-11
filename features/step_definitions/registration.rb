require 'context/create_user'

Given /^I am an unregistered user$/ do
end

When /^I submit the following values for registration:$/ do |table|
  @email = table.raw[1][0]
  @password = table.raw[1][1]
  @result = MyKissList::Context::CreateUser.execute(
    MyKissList::Records::User.new,
    {'email' => @email, 'password' => @password}
  )
end

Then /^I should have a valid user account$/ do
  @result[:user].should be_a(MyKissList::Records::User)
  @result[:user].email.should == @email
  @result[:user].password.should == @password
end
