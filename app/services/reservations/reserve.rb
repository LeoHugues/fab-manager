module Reservations
  class Reserve
    attr_accessor :user_id

    def initialize(user_id)
      @user_id = user_id
    end

    def pay_and_save(reservation, payment_method, coupon)
      reservation.user_id = user_id
      if payment_method == :local
        reservation.save_with_local_payment(coupon)
      elsif payment_method == :stripe
        reservation.save_with_payment(coupon)
      end
    end
  end
end