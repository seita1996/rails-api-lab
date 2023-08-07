module V1
  class Posts < Grape::API
    resource :posts do
      desc 'Get all posts'
      get do
        posts = Post.all
        present posts, with: V1::Entities::PostEntity
      end

      desc 'Get a specific post'
      params do
        requires :id, type: Integer, desc: 'Post ID'
      end
      get ':id' do
        post = Post.find(params[:id])
        present post, with: V1::Entities::PostEntity
      end

      desc 'Create a new post'
      params do
        requires :title, type: String, desc: 'Post title'
        requires :content, type: String, desc: 'Post content'
        requires :author_id, type: Integer, desc: 'Author ID'
      end
      post do
        Post.create!(title: params[:title], content: params[:content], author_id: params[:author_id])
      end

      desc 'Update a post'
      params do
        requires :id, type: Integer, desc: 'Post ID'
        optional :title, type: String, desc: 'Post title'
        optional :content, type: String, desc: 'Post content'
      end
      put ':id' do
        post = Post.find(params[:id])
        post.update!(title: params[:title], content: params[:content])
        post
      end

      desc 'Delete a post'
      params do
        requires :id, type: Integer, desc: 'Post ID'
      end
      delete ':id' do
        post = Post.find(params[:id])
        post.destroy
        { message: 'Post deleted successfully.' }
      end
    end
  end
end
