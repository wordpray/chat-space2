require 'rails_helper'

describe MessagesController, type: :controller do
  let(:user)            {create(:user)}
  let(:group)           {create(:group)}
  let(:message)         {build(:message)}
  let(:message_params)  {{
                          message: attributes_for(:message),
                          group_id: group.id,
                          user_id: user.id
                        }}
  let(:message_empty)   {{
                          message: attributes_for(:message,{body: nil,image: nil}),
                          group_id: group.id,
                          user_id: user.id
                        }}

  describe 'GET #index' do
    context 'When log in' do
      before do
        login_user user
        get :index, params: { group_id: group.id }
      end
      it "assigns the requested tweet to @message" do
        expect(assigns(:message)).to be_a_new(Message)
      end

      it "assigns the requested tweet to @messages" do
        messages = group.messages
        expect(assigns(:messages)).to match(messages.sort{|a,b| b.created_at <=> a.created_at})
      end

      it "assigns the requested tweet to @group" do
        expect(assigns(:group)).to eq group
      end

      it "assigns the requested tweet to @groups" do
        groups = user.groups
        expect(assigns(:groups)).to eq groups
      end

      it "assigns the requested tweet to @users" do
        users = group.users
        expect(assigns(:users)).to eq users
      end

      it "renders the :index template" do
        expect(response).to render_template :index
      end
    end
    
    context 'When log out' do
      before do
        get :index, params: { group_id: group.id }
      end
      it "is redirected to the intended view" do
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'POST #create' do
    context 'When logged in and save successfully' do
      before do
        login_user user
      end
      it "saves the message" do
        expect {post :create, params: message_params}.to change(Message, :count).by(1)
      end

      it "is redirected to the intended view" do
        post :create, params: message_params
        expect(response).to redirect_to group_messages_path(group.id)
      end
    end

    context 'When logged in and unsaved' do
      before do
        login_user user
      end
      it "is not saved" do
        expect{post :create, params: message_empty}.to_not change(Message, :count)
      end

      it "is redirected to the intended view" do
        post :create, params: message_empty
        expect(response).to render_template :index
      end
    end

    context 'When log out' do
      it "is redirected to the intended view" do
        post :create, params: message_empty
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
