module V1
  class Authors < Grape::API
    resource :authors do
      desc 'Get all authors'
      get do
        authors = Author.all
        present authors, with: V1::Entities::AuthorEntity
      end

      desc 'Get a specific author'
      params do
        requires :id, type: Integer, desc: 'Author ID'
      end
      get ':id' do
        author = Author.find(params[:id])
        present author, with: V1::Entities::AuthorEntity
      end

      desc 'Create a new author'
      params do
        requires :name, type: String, desc: 'Author name'
        requires :email, type: String, desc: 'Author email'
      end
      post do
        Author.create!(name: params[:name], email: params[:email])
      end

      desc 'Update an author'
      params do
        requires :id, type: Integer, desc: 'Author ID'
        optional :name, type: String, desc: 'Author name'
        optional :email, type: String, desc: 'Author email'
      end
      put ':id' do
        author = Author.find(params[:id])
        author.update!(name: params[:name], email: params[:email])
        author
      end

      desc 'Delete an author'
      params do
        requires :id, type: Integer, desc: 'Author ID'
      end
      delete ':id' do
        author = Author.find(params[:id])
        author.destroy
        { message: 'Author deleted successfully.' }
      end
    end
  end
end
