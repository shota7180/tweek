Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :twitter,"Consumer key","Consumer secret"
    if ENV['RAILS_ENV'] == "development"
        provider :facebook,"384628221555228","848039f9f84e0866f831adfacc441105", {:scope => 'publish_stream,offline_access,email, user_birthday '}
		provider :twitter,"oco5avxAQMKBN90xAphJdA","TbrabbyMDE0NAHckO1IjOWRMYDTkb9hoJrxAMYqlfw"
    elsif ENV['RAILS_ENV'] == "test"
        provider :facebook,"384628221555228","848039f9f84e0866f831adfacc441105", {:scope => 'publish_stream,offline_access,email, user_birthday, read_friendlists'}
		provider :twitter,"oco5avxAQMKBN90xAphJdA","TbrabbyMDE0NAHckO1IjOWRMYDTkb9hoJrxAMYqlfw"
    elsif ENV['RAILS_ENV'] == "production"
        provider :facebook,"384628221555228","848039f9f84e0866f831adfacc441105", {:scope => 'publish_stream,offline_access,email, user_birthday, read_friendlists'}
		provider :twitter,"oco5avxAQMKBN90xAphJdA","TbrabbyMDE0NAHckO1IjOWRMYDTkb9hoJrxAMYqlfw"
    end
end

