class Article < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	validates :title, presence: true,
					  length: {minimum: 5}
	default_scope {order('created_at DESC')}
	acts_as_taggable

	def marked_text
		markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true)
		markdown.render(text)
	end
end
