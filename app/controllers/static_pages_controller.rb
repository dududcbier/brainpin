class StaticPagesController < ApplicationController

	def index
		@post = Post.new
		@posts = Post.order(created_at: :desc).all
	end

	def home
		@post = Post.new
		@posts = Post.order(created_at: :desc).all
	end

	def create_post
		@post = Post.create text: params['post']['text'], created_by: current_user.id
		redirect_to root_url
	end
end
