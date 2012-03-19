class User < ActiveRecord::Base
    # create user from facebook
    def self.create_with_omniauth(auth)
        #logger.debug("debug------------------- user model");
        #logger.debug(auth["extra"]["raw_info"]["location"])
        create!do |user|
			logger.debug(auth)
            user.provider              = auth["provider"]
            user.uid                   = auth["uid"]
			user.gender                = auth["extra"]["raw_info"]["gender"]
			user.birth_day              = Date.strptime(auth[:extra][:raw_info][:birthday],'%m/%d/%Y') if auth[:extra][:raw_info][:birthday]
			user.provider_name         = auth["info"]["name"]
			user.provider_screen_name  = auth["info"]["nickname"] || ''
			user.provider_email        = auth["info"]["email"]
			if (auth["extra"]["raw_info"] && auth["extra"]["raw_info"]["location"])
			user.provider_location     = auth["extra"]["raw_info"]["location"]["name"]
			else
				user.provider_location =''
			end
			user.provider_image_url    = auth["info"]["image"]
			user.provider_user_url     = auth["extra"]["raw_info"]["link"]
            user.reg_date =Time.now.to_i
            user.last_login =Time.now.to_i
        end
    end     


    # get user by facebook info
    def self.find_by_provider_and_uid(provider, uid)
        return self.find(:first, :conditions => ['provider = ? and uid = ?', provider, uid])
    end

    #  login
    def login (auth)
        self.last_login =Time.now.to_i
        if self.provider_name != auth["info"]["name"]
            self.provider_name = auth["info"]["name"]
        end
        if self.provider_screen_name != auth["info"]["nickname"]
            self.provider_screen_name = auth["info"]["nickname"]
        end
        if self.provider_email != auth["info"]["email"]
            self.provider_email = auth["info"]["email"]
        end
        if self.provider_location != auth["extra"]["raw_info"]["location"]["name"]
            self.provider_location = auth["extra"]["raw_info"]["location"]["name"]
        end
        if self.provider_image_url != auth["info"]["image"]
            self.provider_image_url = auth["info"]["image"]
        end
        if self.birth_day != auth[:extra][:raw_info][:birthday]
            self.birth_day = auth[:extra][:raw_info][:birthday]
        end

        res = self.save
        logger.info("user_login\t#{self.id}\t#{res}")
    end

    # user deta wrapper
    def display_name
        return  (self.plife_name) ? self.plife_name : self.provider_name
    end

    def email
        return (self.plife_email) ? self.plife_email : self.provider_email
    end

    def image_url
        return (self.plife_image_url) ? self.plife_image_url : self.provider_image_url
    end

    def location
        return (self.plife_location) ? self.plife_location : self.provider_location
    end

    def age
        return (((Time.now - Time.parse(self.birth_day.to_s)) / 60 / 60 / 24)/365).truncate
    end


    def self.add_user_info_by_uid (user_list)
        uids = user_list.map {|user| user['uid'] }
        users = self.where(["uid in (?)", uids])
        user_hash ={}
        users.each{|user|
            user_hash[user['uid']] = user
        }
        user_list.each{|user|
            if (user_hash[user['uid']])
                user['joined'] = 1
            end
        }
    end

end
