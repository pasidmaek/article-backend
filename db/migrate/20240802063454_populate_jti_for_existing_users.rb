class PopulateJtiForExistingUsers < ActiveRecord::Migration[7.1]
  def up
    User.where(jti: nil).find_each do |user|
      user.update!(jti: SecureRandom.uuid)
    end
  end
end