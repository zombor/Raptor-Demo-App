require 'context/create_user'

Given /^I am an unregistered user$/ do
end

When /^I submit the following values for registration:$/ do |table|
  @params = {}
  table.raw.each do |key, value|
    @params[key] = value
  end

  begin
    @result = MyKissList::Context::CreateUser.execute(
      MyKissList::Records::User.new,
      @params
    )
  rescue Error::Validation => e
    @exception = e
  end
end

Then /^I should have a valid user account$/ do
  puts @exception.errors[:username].inspect
  @result[:user].should be_a(MyKissList::Records::User)
  @result[:user].email.should == @params['email']
  @result[:user].password.should == @params['password']
end

Then /^I should see required registration errors for each field$/ do
  puts @exception.errors.inspect
  @params.each do |key, value|
    @exception.errors[key.to_sym].should_not be_empty
  end
end
