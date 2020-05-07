require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  login_user
  before(:each) { @post = create(:post, user: subject.current_user) }

  describe 'POST #create' do
    context 'valid attributes' do
      it 'should create new comment of @post' do
        expect {
          post :create, params: { post_id: @post.id, comment: FactoryBot.attributes_for(:comment, post: @post) }
        }.to change(Comment, :count).by(1)
      end
    end

    context 'invalid attributes' do
      it 'does not save the new comment' do
        expect {
          post :create, params: { post_id: @post.id, comment: FactoryBot.attributes_for(:invalid_comment, post: @post) }
        }.to_not change(Comment, :count)
      end
    end
  end

  describe 'PATCH #update' do
    before(:each) { @comment = create(:comment, post: @post) }

    context 'valid attributes' do
      it 'should update @comment attributes' do
        patch :update, params: { post_id: @post.id, id: @comment.id,
          comment: FactoryBot.attributes_for(:comment, content: 'updated content', post: @post) }
        @comment.reload
        @comment.content.should eq('updated content')
      end

      it 'locates the requested @comment' do
        assigns(:comment).should eq(@comment)
      end
    end

    context 'invalid attributes' do
      it 'should not update @comment attributes' do
        patch :update, params: { post_id: @post.id, id: @comment.id,
          comment: FactoryBot.attributes_for(:comment, content: nil, post: @post) }
        @comment.reload
        @comment.content.should_not eq('updated content')
      end

      it 'locates the requested @comment' do
        assigns(:comment).should eq(@comment)
      end
    end
  end

  describe 'DELETE #delete' do
    before(:each) { @comment = create(:comment, post: @post) }

    it 'should delete @comment' do
      expect{
        delete :destroy, params: { post_id: @post.id, id: @comment.id }
      }.to change(Comment,:count).by(-1)
    end

    it 'locates the requested @comment' do
      assigns(:comment).should eq(@comment)
    end
  end
end
