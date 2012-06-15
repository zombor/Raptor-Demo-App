require 'spec_helper'
require 'models/user'

describe MyKissList::Records::User do
  context :fields do
    it 'has an id field' do
      subject.id.should be_nil
    end

    it 'has a username field' do
      subject.username.should be_nil
    end

    it 'has an email field' do
      subject.email.should be_nil
    end

    it 'has a password field' do
      subject.password.should be_nil
    end

    it 'has a first name field' do
      subject.first_name.should be_nil
    end

    it 'has a last name field' do
      subject.last_name.should be_nil
    end

    context :dob do
      it 'exists' do
        subject.dob.should be_nil
      end

      it 'is a datetime field' do
        subject.dob = '09/10/1981'
        subject.dob.should == DateTime.parse('09/10/1981')
      end
    end

    it 'has a gender field' do
      subject.gender.should be_nil
    end
  end

  context :validation do
    before :each do
      subject.valid?
    end

    it 'has username validations' do
      subject.errors.on(:username).should_not be_empty
    end
  end
end
