require 'rails_helper'

describe Message do
  describe "#create" do
    context "When messages can be saved" do
      it "is valid with a body" do
        message = build(:message, image:nil)
        expect(message).to be_valid
      end
      it "is valid with a image" do
        message = build(:message, body:nil)
        expect(message).to be_valid
      end
      it "is valid with a body and a image" do
        message = build(:message)
        expect(message).to be_valid
      end
    end
    
    context "When you can not save messages" do
      it "is invalid without a body and a text" do
        message = build(:message, body: nil, image: nil)
        message.valid?
        expect(message.errors.full_messages).to include("Body or imageを入力してください")
      end
      it "Can not save it without a group_id" do
        message = build(:message, group_id: nil)
        message.valid?
        expect(message.errors[:group_id]).to include("を入力してください")
      end
      it "Can not save it without a user_id" do
        message = build(:message, user_id: nil)
        message.valid?
        expect(message.errors[:user_id]).to include("を入力してください")
      end
    end
  end
end
