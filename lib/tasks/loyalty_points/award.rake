namespace :spree do
  namespace :loyalty_points do
    desc "Credit Mini Points to pending users accounts"
    task award: :environment do
      Spree::Order.credit_loyalty_points_to_user
    end
  end
end
