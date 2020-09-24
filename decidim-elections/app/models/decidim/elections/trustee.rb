# frozen_string_literal: true

module Decidim
  module Elections
    # The data store for a trustee in the Decidim::Elections component. It stores a
    # public key and has a reference to Decidim::User.
    class Trustee < ApplicationRecord
      belongs_to :user, foreign_key: "decidim_user_id", class_name: "Decidim::User"
      has_many :elections_trustees, foreign_key: "decidim_elections_trustee_id", dependent: :destroy
      has_many :elections, through: :elections_trustees
      has_many :trustees_participatory_spaces, foreign_key: "decidim_elections_trustee_id", dependent: :destroy
      has_many :participatory_spaces, through: :trustees_participatory_spaces, source_type: name
    end
  end
end
