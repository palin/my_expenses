require 'authlogic/test_case'
include Authlogic::TestCase

describe SessionsController do
  setup :activate_authlogic

  let(:user_session) { {} }

  describe "POST create" do
    subject { post :create, user_session: user_session}

    let(:user) { create :user }

    before do
      User.stub(:koala).and_return(user)
    end

    context "with user" do
      its(:status) { should redirect_to(new_dashboard_expense_path) }
    end

    context "without user" do
      its(:status) { should render_template(:new) }
    end
  end

  describe "DELETE destroy" do
    subject { delete :destroy, user_session: user_session}

    context "with existing user session" do
      before { log_in(user) }

      let(:user) { create :user }

      its(:status) { should redirect_to(root_url) }
    end

    context "without user session" do
      its(:status) { should redirect_to(root_url) }
    end
  end
end