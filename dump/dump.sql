-- Grant privileges to the 'postgres' user (superuser)
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'Oraclizer2024!@';
flush privileges;

CREATE TABLE member
(
    mb_no int auto_increment NOT NULL comment 'member idx'
        primary key,
    mb_email varchar(50) not null comment 'member 로그인 이메일',
    mb_pass varchar(130) not null comment 'member 비밀번호',
    mb_nickname varchar(100) null comment 'membger 닉네임',
    mb_group enum('ROLE_USER', 'ROLE_ADMIN') default 'ROLE_USER' not null comment 'group( user: 일반회원, O: 최고관리자 )',
    mb_status enum('active', 'leave', 'locked', 'expire', 'dormant') default 'active' not null comment 'memeber 현재 상태',
    regdate timestamp default CURRENT_TIMESTAMP not null comment '생성일',
    `update` datetime null on update CURRENT_TIMESTAMP comment '업데이트일'
);

INSERT INTO database_oc.member (mb_email,mb_pass,mb_nickname,mb_group,regdate,`update`) VALUES
	 ('user@naver.com','$2a$10$4CAO9cdkz.IjFbvorDd8g.8TEEBhva9dYUIAuGDi1clnifO3G/dFa','testuser','ROLE_USER','2022-06-22 16:53:17',NULL),
	 ('adimn@naver.com','$2a$10$4CAO9cdkz.IjFbvorDd8g.8TEEBhva9dYUIAuGDi1clnifO3G/dFa','admin','ROLE_ADMIN','2022-06-22 16:53:17',NULL);

CREATE TABLE email_code (
	email_code_no int auto_increment NOT NULL PRIMARY KEY comment '이메일 인증 코드 PK',
	mb_email	varchar(50) NOT NULL comment '인증코드를 발송한 메일 주소',
	email_code	varchar(10) NOT NULL comment '인증코드',
	code_status	enum('done','yet') DEFAULT 'yet' NOT NULL comment '인증코드 상태 (done : 만료됨, yet : 사용중)',
	regdate timestamp default CURRENT_TIMESTAMP not null comment '생성일',
    `update` datetime null on update CURRENT_TIMESTAMP comment '업데이트일'
);

CREATE TABLE dupli_login_check (
	ck_no int auto_increment NOT NULL PRIMARY KEY,
	mb_no int NOT NULL,
	loginsession varchar(200) NOT NULL,
	regdate timestamp default CURRENT_TIMESTAMP not null comment '생성일',
    `update` datetime null on update CURRENT_TIMESTAMP comment '업데이트일'
);

CREATE TABLE visitstatistics (
	visit_no int auto_increment NOT NULL PRIMARY KEY,
	visit_type enum('none', 'user', 'admin') DEFAULT 'none' NOT NULL,
	visit_ip varchar(15) NOT NULL,
	visit_device enum('Mobile', 'Desktop') NOT NULL,
	regdate timestamp default CURRENT_TIMESTAMP not null comment '생성일',
    `update` datetime null on update CURRENT_TIMESTAMP comment '업데이트일'
);