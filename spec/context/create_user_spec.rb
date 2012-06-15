require 'spec_helper'
require 'context/create_user'
require 'models/user'

describe MyKissList::Context::CreateUser do
  it 'creates a user' do
    post = {
      'username' => 'foobar',
      'email' => 'foo@bar.com',
      'password' => 'foobar',
      'first_name' => 'foo',
      'last_name' => 'bar',
      'dob' => '09/10/1981',
      'gender' => 'M'
    }
    user = MyKissList::Records::User.new
    user.should_receive(:attributes=).with(post)
    Arden::Repository.for(:user).should_receive(:create).with(user)
    subject.execute(user, post)
  end
end
