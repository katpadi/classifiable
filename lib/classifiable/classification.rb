  class Classification < ActiveRecord::Base
    # So we can have many classifications per classifiable
    belongs_to :classifiables_classifications
  end