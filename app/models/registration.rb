class Registration < ActiveRecord::Base
  belongs_to :membership
  has_one :card
  accepts_nested_attributes_for :card

  validates :name, :ic_number, :date_of_birth,  :contact_number, :email, :instagram_account, presence: true

  serialize :notification_params, Hash
  def paypal_url(return_path)
    values = {
        business: "halalfoodhunt@gmail.com",
        currency_code: "SGD",
        upload: 1,
        no_shipping: 1,
        return: "#{Rails.application.secrets.app_host}#{return_path}",
        notify_url: "#{Rails.application.secrets.app_host}/hook",
        invoice: id,
        item_name: membership.name
    }
    values = if membership.recurring
               values.merge(
                   cmd: "_xclick-subscriptions",
                   a3: membership.price,
                   p3: 1,
                   srt: membership.cycles,
                   t3: membership.period.first
               )
             else
               values.merge(
                   cmd: "_xclick",
                   amount: membership.price,
                   item_number: membership.id,
                   quantity: '1'
               )
             end

    "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
  end

  def payment_method
    "paypal"
  end
end
