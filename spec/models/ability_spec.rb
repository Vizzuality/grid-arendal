require 'rails_helper'

module Account
  RSpec.describe Ability, type: :model do
    before :each do
      @user          = create(:user, active: true)
      @adminuser     = create(:adminuser, active: true)
      @publisheruser = create(:publisheruser, active: true)
    end

    it { Abilities::AdminUser.should include(CanCan::Ability) }
    it { Abilities::AdminUser.should respond_to(:new).with(1).argument }

    it { Abilities::PublisherUser.should include(CanCan::Ability) }
    it { Abilities::PublisherUser.should respond_to(:new).with(1).argument }

    it { Abilities::ContributorUser.should include(CanCan::Ability) }
    it { Abilities::ContributorUser.should respond_to(:new).with(1).argument }

    it { Abilities::Guest.should include(CanCan::Ability) }
    it { Abilities::Guest.should respond_to(:new).with(1).argument }

    context 'Administrator' do
      it 'can manage objects' do
        Abilities::AdminUser.any_instance.should_receive(:can).with(:update, ::User, id: @adminuser.id)
        Abilities::AdminUser.any_instance.should_receive(:can).with(:read, ::User, id: @adminuser.id)
        Abilities::AdminUser.any_instance.should_receive(:can).with(:manage, :all)
        Abilities::AdminUser.any_instance.should_receive(:can).with([:activate, :deactivate], ::Event)

        Abilities::AdminUser.any_instance.should_receive(:cannot).with(:make_publisher, ::User, id: @adminuser.id)
        Abilities::AdminUser.any_instance.should_receive(:cannot).with(:make_contributor, ::User, id: @adminuser.id)
        Abilities::AdminUser.any_instance.should_receive(:cannot).with([:activate, :deactivate], ::User, id: @adminuser.id)

        Abilities::AdminUser.new @adminuser
      end
    end

    context 'Publisher' do
      it 'can manage objects' do
        Abilities::PublisherUser.any_instance.should_receive(:can).with(:read, ::User, id: @publisheruser.id)
        Abilities::PublisherUser.any_instance.should_receive(:can).with(:update, ::User, id: @publisheruser.id)
        Abilities::PublisherUser.any_instance.should_receive(:can).with(:manage, ::Partner)
        Abilities::PublisherUser.any_instance.should_receive(:can).with(:manage, ::AboutSection)
        Abilities::PublisherUser.any_instance.should_receive(:can).with(:manage, ::Event)
        Abilities::PublisherUser.any_instance.should_receive(:can).with([:activate, :deactivate], ::Event)
        Abilities::PublisherUser.any_instance.should_receive(:can).with(:manage, ::NewsArticle)
        Abilities::PublisherUser.any_instance.should_receive(:can).with(:manage, ::Activity)
        Abilities::PublisherUser.any_instance.should_receive(:can).with(:manage, ::Publication)

        Abilities::PublisherUser.any_instance.should_receive(:cannot).with(:make_admin, ::User, id: @publisheruser.id)
        Abilities::PublisherUser.any_instance.should_receive(:cannot).with(:make_contributor, ::User, id: @publisheruser.id)
        Abilities::PublisherUser.any_instance.should_receive(:cannot).with([:activate, :deactivate], ::User, id: @publisheruser.id)
        Abilities::PublisherUser.new @publisheruser
      end
    end

    context 'Contributor' do
      it 'can manage objects' do
        Abilities::ContributorUser.any_instance.should_receive(:can).with(:update, ::User, id: @user.id)
        Abilities::ContributorUser.any_instance.should_receive(:can).with(:read, ::User, id: @user.id)
        Abilities::ContributorUser.new @user
      end
    end

    context 'guest' do
      it 'can read objects' do
        Abilities::Guest.new @user
      end
    end
  end
end
