# frozen_string_literal: true

module ApplicationCable
  # Module for managing the connections of the application
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    private

    def find_verified_user
      return reject_unauthorized_connection unless logged_in?
      if (verified_user = User.find(user_id))
        verified_user
      else
        reject_unauthorized_connection
      end
    end

    def logged_in?
      user_id.present?
    end

    def user_id
      cookies.signed[:user_id]
    end
  end
end
