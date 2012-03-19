use tweek 
Drop table if exists users;
CREATE TABLE users (
	id                     int(10) unsigned not null AUTO_INCREMENT,
	provider               varchar(128) not null,
	uid                    varchar(128) not null,
	gender                 varchar(8),
	birth_day              date,

	provider_name          varchar(512) not null,
	provider_screen_name   varchar(512) not null,
	provider_email         varchar(512), 
	provider_location      varchar(512),
	provider_image_url     varchar(512),
	provider_user_url      varchar(512),

	plife_name             varchar(512),
	plife_email            varchar(512),
	plife_location         varchar(512),
	plife_image_url        varchar(512),

	comment_num            int(10) unsigned DEFAULT 0,
	like_num               int(10) unsigned DEFAULT 0,
	recieve_like_num       int(10) unsigned DEFAULT 0,
	plan_post_num          int(10) unsigned DEFAULT 0,
	spot_post_num          int(10) unsigned DEFAULT 0,
	event_join_num         int(10) unsigned DEFAULT 0,
	friend_num             int(10) unsigned DEFAULT 0,
	invite_num             int(10) unsigned DEFAULT 0,
	fav_plan_num           int(10) unsigned DEFAULT 0,
	fav_spot_num           int(10) unsigned DEFAULT 0,
	fav_user_num           int(10) unsigned DEFAULT 0,
	reg_date               int(10) unsigned DEFAULT 0,
	last_login             int(10) unsigned DEFAULT 0,
	primary key(id),
	unique key provider_uid (provider, uid)
) ENGINE=InnoDB;
