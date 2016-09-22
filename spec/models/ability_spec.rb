require 'rails_helper'

module Account
  RSpec.describe Ability, type: :model do
    before :each do
      @user        = create(:user)
      @adminuser   = create(:adminuser)
      @manageruser = create(:manageruser)
    end

    it { Abilities::AdminUser.should include(CanCan::Ability) }
    it { Abilities::AdminUser.should respond_to(:new).with(1).argument }

    it { Abilities::ManagerUser.should include(CanCan::Ability) }
    it { Abilities::ManagerUser.should respond_to(:new).with(1).argument }

    it { Abilities::MemberUser.should include(CanCan::Ability) }
    it { Abilities::MemberUser.should respond_to(:new).with(1).argument }

    it { Abilities::Guest.should include(CanCan::Ability) }
    it { Abilities::Guest.should respond_to(:new).with(1).argument }

    context 'Administrator' do
      it 'can manage objects' do
        Abilities::AdminUser.any_instance.should_receive(:can).with(:manage, :all)
        Abilities::AdminUser.any_instance.should_receive(:cannot).with(:make_manager, ::User, id: @adminuser.id)
        Abilities::AdminUser.any_instance.should_receive(:cannot).with(:make_member, ::User, id: @adminuser.id)
        Abilities::AdminUser.any_instance.should_receive(:cannot).with([:activate, :deactivate], ::User, id: @adminuser.id)

        Abilities::AdminUser.new @adminuser
      end
    end

    context 'Manager' do
      it 'can manage objects' do
        Abilities::ManagerUser.any_instance.should_receive(:can).with(:update, ::User, id: @manageruser.id)
        Abilities::ManagerUser.any_instance.should_receive(:can).with(:read, :all)

        Abilities::ManagerUser.any_instance.should_receive(:cannot).with(:make_admin, ::User, id: @manageruser.id)
        Abilities::ManagerUser.any_instance.should_receive(:cannot).with(:make_member, ::User, id: @manageruser.id)
        Abilities::ManagerUser.any_instance.should_receive(:cannot).with([:activate, :deactivate], ::User, id: @manageruser.id)
        Abilities::ManagerUser.new @manageruser
      end
    end

    context 'Member' do
      it 'can manage objects' do
        Abilities::MemberUser.any_instance.should_receive(:can).with(:update, ::User, id: @user.id)
        Abilities::MemberUser.any_instance.should_receive(:can).with(:read, ::User, id: @user.id)
        Abilities::MemberUser.new @user
      end
    end

    context 'guest' do
      it 'can read objects' do
        Abilities::Guest.new @user
      end
    end
  end
end
