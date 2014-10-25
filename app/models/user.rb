class User < ActiveRecord::Base
  has_many :expenses

  acts_as_authentic do |c|
    c.ignore_blank_passwords = true
  end

  def self.koala(auth)
    access_token = auth['token']
    facebook = Koala::Facebook::API.new(access_token)
    fb_user_data = facebook.get_object("me")
    user = self.find_by_uid(fb_user_data['id']) || self.create_from_fb_data(fb_user_data)
    user.update_data(fb_user_data, auth)
    user.reset_persistence_token!
    user
  end

  def self.create_from_fb_data(fb_data, auth)
    self.create(
      name: fb_data["name"],
      uid: fb_data["id"],
      gender: fb_data["gender"],
      email: fb_data["email"]
    )
  end

  def update_data(fb_data, auth)
    [:name, :gender, :email].each do |att|
      update_attribute(att, fb_data[att.to_s]) if read_attribute(att) != fb_data[att.to_s]
    end

    update_attribute(:access_token, auth['token']) if access_token != auth['token']
  end
end
