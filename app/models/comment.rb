class Comment < ActiveRecord::Base
  belongs_to :article
  default_scope {order('created_at DESC')}
end
