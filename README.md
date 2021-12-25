# README

# GEM mới 

* gem stripe : liên quan đến số thẻ hay xác thực thẻ thanh toán 
* gem firago : một gem cho phép thao tác hay sử dụng các biến môi trường 
* gem trix-rails : gem sử dụng cho điền những đoạn văn bản kèm hình ảnh , âm thanh 


# sử dụng gem stripe 

* sau khi chạy terminal tìm trong config/application.yml rồi xem api_key và publicshed_key
* thêm file stripe.rb trong config/initializers nội dung  : 
                Rails.configuration.stripe = { 
                :publishable_key => 'publishable_key', 
                :secret_key =>'secret_key' } 
                Stripe.api_key = Rails.configuration.stripe[:secret_key] 
* cập nhật ví điện tử và các thông tin nhờ controller create : 
                        token = params[:stripeToken]
                        job_type = params[:job_type]
                        job_title = params[:title]
                        card_brand = params[:user][:card_brand]
                        card_exp_month = params[:user][:card_exp_month]
                        card_exp_year  = params[:user][:card_exp_year]
                        card_last = params[:user][:card_last]

                        charge = Stripe::Charge.create(
                        :amount => 30000,
                        :currency => "usd",
                        :description => job_type,
                        :statement_descriptor => job_title,
                        :source => token
                        )

                        current_user.stripe_id = charge.id
                        current_user.card_brand = card_brand
                        current_user.card_exp_month = card_exp_month
                        current_user.card_exp_year = card_exp_year
                        current_user.card_last = card_last
                        current_user.save!

# các hàm bổ trợ 

*       def job_type(job_type)
            if job_type == "Full-time"
            content_tag :span, "#{job_type}", class: "tag is-primary"
            elsif job_type == "Part-time"
            content_tag :span, "#{job_type}", class: "tag is-link"
            elsif job_type == "Freelance"
            content_tag :span, "#{job_type}", class: "tag is-warning"
            elsif job_type == "Contract"
            content_tag :span, "#{job_type}", class: "tag is-info"
            else
            ""
            end
        end
        => phân biệt loại job và tag cho nó 
        content_tag : tạo content_tag 

*       def job_author(job)
            user_signed_in? && current_user.id == job.user_id
        end
        => kiểm tra chủ job nếu người đang đăng nhập bằng user đăng job thì là chủ job


# các hàm lạ trong views

* @job.persisted? : kiểm tra xem biến @job đã được lưu trong database hay chưa 
* current_user.stripe_id.present? : present là ngược của blank tức là kiểm tra :"không phải nil?"
* job_path(:job_type:"ten_job") : đường dẫn tới tất cả các job thuộc loại ten_job
*job.avatar_url(:thumb) : đường dẫn của ảnh và thumb là kiểu ảnh được setup trong uploader

*SanitizeHelper là modul trong Rails cung cấp các methods giúp loại bỏ các phần tử HTML không mong      muốn, đảm bảo an toàn cho website.
Các methods được cung cấp bao gồm: sanitize, sanitize_css, strip_links, strip_tags

*truncate : Đối với những string quá dài, bạn có thể giới hạn độ dài của string đó bằng hàm truncate và phần còn lại sẽ được thay bằng dấu ba chấm

* current_user.try(:admin) : check xem người dùng có phải admin hay k

