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
  @result[:user].should be_a(MyKissList::Records::User)
  @result[:user].email.should == @params['email']
  @result[:user].password.should == @params['password']
end

Then /^I should see a registration error for (.+)$/ do |field|
  @exception.errors[field.to_sym].should be_true
end
