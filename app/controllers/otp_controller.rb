class OtpController < ApplicationController
    def create
        code = Array.new(6){rand(10)}.join
        Rails.cache.fetch("otp/#{params[:user_id]}", expire_in: 5.minutes) do
            code    
        end
        render status: 200, body: {otp_code: code}

        # SmsClient.send(user_id, code)
    end

    def verify
        key = "otp/#{params[:user_id]}"
        code = Rails.cache.fetch(key)
        
        if code == params[:code]
            Rails.cache.delete(key)
            render status: 200
        end
        render status: 500 
    end

    private
    def permitted_params
        params.permit(:user_id, :code)
    end

end
