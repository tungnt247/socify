require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  login_user

  describe 'GET #index' do
    before { get :index }

    it 'populates an array of posts' do
      post = create(:post, user: subject.current_user)
      assigns(:posts).should eq([post])
    end

    it 'render :index view' do
      should render_template(:index)
    end
  end

  describe 'GET #show' do
    let(:post) { create(:post, user: subject.current_user) }
    before { get :show, params: { id: post.id } }

    it 'assigns the requested post to @post' do
      assigns(:post).should eq(post)
    end

    it 'render :show view' do
      should render_template(:show)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'create new post' do
        expect {
          post :create, params: { post: FactoryBot.attributes_for(:post) }, format: 'js'
        }.to change(Post, :count).by(1)
      end

      it 'redirect to list post view' do
        post :create, params: { post: FactoryBot.attributes_for(:post) }, format: 'js'
        response.should redirect_to(posts_path)
      end

      it 'flash successfully when post created' do
        post :create, params: { post: FactoryBot.attributes_for(:post) }, format: 'js'
        flash[:success].should eq('Create successfully!')
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new post' do
        expect {
          post :create, params: { post: FactoryBot.attributes_for(:invalid_post) }, format: 'js'
        }.to_not change(Post, :count)
      end

      it 're-render form create' do
        post :create, params: { post: FactoryBot.attributes_for(:invalid_post) }, format: 'js'
        response.should render_template(:create)
      end
    end
  end

  describe 'PATCH #update' do
    before(:each) { @post = create(:post, user: subject.current_user) }
    
    context 'valid attributes' do
      before(:each) { patch :update, params: { id: @post.id, post: FactoryBot.attributes_for(:post) }, format: 'js' }

      it 'locates the requested @post' do
        assigns(:post).should eq(@post)
      end

      it 'redirect to list post view' do
        response.should redirect_to(posts_path)
      end

      it 'flash successfully when post updated' do
        flash[:success].should eq('Update successfully!')
      end

      it 'should change @post attributes' do
        patch :update, params: { id: @post.id,
          post: FactoryBot.attributes_for(:post,
            title: 'updated title', content: 'updated content') }, format: 'js'
        @post.reload
        @post.title.should eq('updated title')
        @post.content.should eq('updated content')
      end
    end

    context 'invalid attributes' do
      before(:each) { patch :update, params: { id: @post.id, post: FactoryBot.attributes_for(:post) }, format: 'js' }

      it 'locates the requested @post' do
        assigns(:post).should eq(@post)
      end

      it 'should not change @post attributes' do
        patch :update, params: { id: @post.id,
          post: FactoryBot.attributes_for(:post,
            title: nil, content: 'updated content') }, format: 'js'
        @post.reload
        @post.content.should_not eq('updated content')
      end

      it 'should re-render form update' do
        patch :update, params: { id: @post.id,
          post: FactoryBot.attributes_for(:post,
            title: nil, content: 'updated content') }, format: 'js'
        response.should render_template(:update)
      end
    end
  end

  describe 'DELETE #destroy' do
    before(:each) { @post = create(:post, user: subject.current_user) }

    it 'should delete @post' do
      expect{
        delete :destroy, params: { id: @post.id }
      }.to change(Post,:count).by(-1)
    end

    it 'should redirect to index view' do
      delete :destroy, params: { id: @post.id }
      response.should redirect_to(posts_path)
    end

    it 'should flash successfully when @post deleted' do
      flash[:success] = 'Deleted successfully!'
    end
  end
end
