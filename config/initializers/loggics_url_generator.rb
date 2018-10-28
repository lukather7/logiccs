if Rails.env.development?
    # 開発時用の処理
    ENV['MY_HOSTNAME'] = ENV['C9_HOSTNAME']
end
 

if Rails.env.production?
    # 本番環境用の処理
    ENV['MY_HOSTNAME'] = ENV['SITE_HOSTNAME']
end
