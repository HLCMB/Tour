SET NAMES UTF8;
DROP DATABASE IF EXISTS cy;
CREATE DATABASE cy CHARSET=UTF8;
USE cy;

#普通用户表
CREATE TABLE cy_user(
  uid INT PRIMARY KEY DEFAULT NULL auto_increment,
  uphone VARCHAR(65) DEFAULT NULL,   #手机
  uemail VARCHAR(65) DEFAULT NULL,   #邮箱
  upwd VARCHAR(128) DEFAULT NULL,    #密码
  uname VARCHAR(65) DEFAULT NULL,    #用户名
  usex BOOL DEFAULT NULL,        #性别
  uage INT DEFAULT NULL,      #年龄
  uheadurl VARCHAR(65) DEFAULT NULL,  #头像路径
  uattention BOOLEAN DEFAULT 0,    #关注标识
  uattents INT DEFAULT NULL,          #关注人数
  uaddress VARCHAR(65) DEFAULT NULL,       #地址
  nickname VARCHAR(65) DEFAULT NULL,      #昵称
  post INT,                               #帖子
  fans INT,                               #粉丝
  qianming VARCHAR(65) DEFAULT NULL     #个性签名
);


INSERT INTO cy_user VALUES
(1,"15555555555","123456@qq.com",md5('123456'),"jack",1,22,"image/head1.jpg",0,78,"北京","tour",57,878,"你好"),
(null,"15555555555","123456@qq.com",md5('123456'),"tom",1,22,"image/head2.jpg",0,66,"河南","tour",145,668,"你好"),
(null,"15555555555","123456@qq.com",md5('123456'),"jack1",1,25,"image/head3.jpg",0,44,"上海","tour",245,618,"你好"),
(null,"15555555555","123456@qq.com",md5('123456'),"jack2",1,55,"image/head4.jpg",0,102,"广州","tour",345,688,"你好"),
(null,"15555555555","123456@qq.com",md5('123456'),"jack3",1,23,"image/head5.jpg",0,64,"天津","tour",445,68,"你好"),
(null,"15555555555","123456@qq.com",md5('123456'),"jack4",1,23,"image/head6.jpg",0,78,"河北","tour",45,468,"你好"),
(null,"15555555555","123456@qq.com",md5('123456'),"jack5",1,45,"image/head7.jpg",0,5,"新疆","tour",645,368,"你好"),
(null,"15555555555","123456@qq.com",md5('123456'),"jack6",1,43,"image/head8.jpg",0,99,"湖南","tour",245,268,"你好"),
(null,"15555555555","123456@qq.com",md5('123456'),"jack7",1,29,"image/head9.jpg",0,75,"湖北","tour",545,168,"你好"),
(null,"15555555555","123456@qq.com",md5('123456'),"jack8",1,23,"image/head10.jpg",0,78,"河北","tour",254,125,"你好"),
(null,"15555555555","123456@qq.com",md5('123456'),"jack9",1,45,"image/head11.jpg",0,5,"新疆","tour",154,1458,"你好"),
(null,"15555555555","123456@qq.com",md5('123456'),"jack10",1,43,"image/head8.jpg",0,99,"湖南","tour",487,15884,"你好"),
(null,"15555555555","123456@qq.com",md5('123456'),"jack11",1,29,"image/head9.jpg",0,75,"湖北","tour",1487,39845,"你好");


#关注用户表
CREATE TABLE cy_attent_user(
  uid INT PRIMARY KEY auto_increment,
  uphone VARCHAR(65),   #???
  uemail VARCHAR(65),   #??
  upwd VARCHAR(128),    #??
  uname VARCHAR(65),
  usex BOOL,        #性别
  uage INT,      #年龄
  uheadurl VARCHAR(65),  #头像路径
  uattention BOOLEAN,    #关注标识
  uattents INT,          #关注人数
  uaddress VARCHAR(65)      #地址
);
INSERT INTO cy_attent_user VALUES
(null,"15555555555","123456@qq.com",md5('123456'),"jack",1,22,"image/head1.jpg",1,78,"北京"),
(null,"15555555555","123456@qq.com",md5('123456'),"tom",1,22,"image/head2.jpg",1,66,"河南"),
(null,"15555555555","123456@qq.com",md5('123456'),"jack1",1,25,"image/head3.jpg",1,44,"上海");



#推荐用户表
CREATE TABLE cy_user_recommend(
  uid INT PRIMARY KEY auto_increment,
  uphone VARCHAR(65),   #???
  uemail VARCHAR(65),   #??
  upwd VARCHAR(128),    #??
  uname VARCHAR(65),
  usex BOOL,        #性别
  uage INT,      #年龄
  uheadurl VARCHAR(65),  #头像路径
  uattention BOOLEAN DEFAULT 0,    #关注标识
  uattents INT,          #关注人数
  uaddress VARCHAR(65),       #地址
  nickname VARCHAR(65)      #昵称
);


INSERT INTO cy_user_recommend VALUES(null,"15555555555","123456@qq.com",md5('123456'),"jack2",1,55,"image/head4.jpg",0,102,"广州","tour"),
(null,"15555555555","123456@qq.com",md5('123456'),"jack3",1,23,"image/head5.jpg",0,64,"天津","tour"),
(null,"15555555555","123456@qq.com",md5('123456'),"jack4",1,23,"image/head6.jpg",0,78,"河北","tour"),
(null,"15555555555","123456@qq.com",md5('123456'),"jack5",1,45,"image/head7.jpg",0,5,"新疆","tour"),
(null,"15555555555","123456@qq.com",md5('123456'),"jack6",1,43,"image/head8.jpg",0,99,"湖南","tour"),
(null,"15555555555","123456@qq.com",md5('123456'),"jack7",1,29,"image/head9.jpg",0,75,"湖北","tour"),
(null,"15555555555","123456@qq.com",md5('123456'),"jack2",1,55,"image/head4.jpg",0,102,"广州","tour"),
(null,"15555555555","123456@qq.com",md5('123456'),"jack3",1,23,"image/head5.jpg",0,64,"天津","tour"),
(null,"15555555555","123456@qq.com",md5('123456'),"jack4",1,23,"image/head6.jpg",0,78,"河北","tour"),
(null,"15555555555","123456@qq.com",md5('123456'),"jack5",1,45,"image/head7.jpg",0,5,"新疆","tour"),
(null,"15555555555","123456@qq.com",md5('123456'),"jack6",1,43,"image/head8.jpg",0,99,"湖南","tour"),
(null,"15555555555","123456@qq.com",md5('123456'),"jack7",1,29,"image/head9.jpg",0,75,"湖北","tour"),
(null,"15555555555","123456@qq.com",md5('123456'),"jack8",1,23,"image/head10.jpg",0,78,"河北","tour"),
(null,"15555555555","123456@qq.com",md5('123456'),"jack9",1,45,"image/head11.jpg",0,5,"新疆","tour"),
(null,"15555555555","123456@qq.com",md5('123456'),"jack10",1,43,"image/head8.jpg",0,99,"湖南","tour"),
(null,"15555555555","123456@qq.com",md5('123456'),"jack11",1,29,"image/head9.jpg",0,75,"湖北","tour");




#用户上传图片表
CREATE TABLE user_img(
  umid INT PRIMARY KEY auto_increment,
  uid INT,        #用户id       
  uimgurl VARCHAR(128),   #图片路径
  praise INT         #点赞次数
);
INSERT INTO user_img VALUES(null,1,"image/food1.jpg",66),
(null,1,"image/food2.jpg",69),
(null,1,"image/food3.jpg",69),
(null,1,"image/food4.jpg",69),
(null,1,"image/food5.jpg",69),
(null,1,"image/food6.jpg",69),
(null,1,"image/food7.jpg",69),
(null,1,"image/food8.jpg",69),
(null,1,"image/food9.jpg",69),
(null,2,"image/shop1.jpg",69),
(null,2,"image/shop2.jpg",69),
(null,2,"image/shop3.jpg",69),
(null,2,"image/shop4.jpg",69),
(null,2,"image/shop5.jpg",69),
(null,2,"image/shop6.jpg",69),
(null,2,"image/shop7.jpg",69),
(null,2,"image/shop8.jpg",69),
(null,2,"image/shop9.jpg",69),
(null,3,"image/house1.jpg",69),
(null,3,"image/house2.jpg",69),
(null,3,"image/house3.jpg",69),
(null,3,"image/house4.jpg",69),
(null,3,"image/house5.jpg",69),
(null,3,"image/house6.jpg",69),
(null,3,"image/house7.jpg",69),
(null,3,"image/house8.jpg",69),
(null,3,"image/house9.jpg",69),
(null,4,"image/build1.jpg",69),
(null,4,"image/build2.jpg",69),
(null,4,"image/build3.jpg",69),
(null,4,"image/build4.jpg",69),
(null,4,"image/build5.jpg",69),
(null,4,"image/build6.jpg",69),
(null,4,"image/build7.jpg",69),
(null,4,"image/build8.jpg",69),
(null,4,"image/build9.jpg",69),
(null,5,"image/scenery1.jpg",69),
(null,5,"image/scenery2.jpg",69),
(null,5,"image/scenery3.jpg",69),
(null,5,"image/scenery4.jpg",69),
(null,5,"image/scenery5.jpg",69),
(null,5,"image/scenery6.jpg",69),
(null,5,"image/scenery7.jpg",69),
(null,5,"image/scenery8.jpg",69),
(null,5,"image/scenery9.jpg",69);





#用户详情表
CREATE TABLE cy_user_detail(
  did INT PRIMARY KEY auto_increment,
  ddid INT,
  uid INT,
  uphone VARCHAR(65),   #手机
  uemail VARCHAR(65),   #邮箱
  upwd VARCHAR(128),    #密码
  uname VARCHAR(65),    #用户名
  usex BOOL,        #性别
  uage INT,      #年龄
  uheadurl VARCHAR(65),  #头像路径
  uattention BOOLEAN,    #关注标识
  uattents INT,          #关注人数
  uaddress VARCHAR(65),       #地址
  uimgurl VARCHAR(128),   #图片路径
  post INT,                               #帖子
  fans INT                                #粉丝
);


INSERT INTO cy_user_detail VALUES
(null,990,1,"15555555555","123456@qq.com",md5('123456'),"jack1",1,22,"image/head1.jpg",0,78,"北京","image/food1.jpg",66,188),
(null,991,1,"15555555555","123456@qq.com",md5('123456'),"jack2",1,22,"image/head2.jpg",0,66,"河南","image/food2.jpg",66,188),
(null,992,1,"155555house5","123456@qq.com",md5('123456'),"jack3",1,25,"image/head3.jpg",0,44,"上海","image/food3.jpg",66,188),
(null,993,1,"155555house5","123456@qq.com",md5('123456'),"jack4",1,55,"image/head4.jpg",0,102,"广州","image/food4.jpg",66,188),
(null,994,1,"15555555555","123456@qq.com",md5('123456'),"jack5",1,23,"image/head5.jpg",0,64,"天津","image/food5.jpg",66,188),
(null,995,1,"15555555555","123456@qq.com",md5('123456'),"jack6",1,23,"image/head6.jpg",0,78,"河北","image/food6.jpg",66,188),
(null,996,1,"15555555555","123456@qq.com",md5('123456'),"jack7",1,45,"image/head7.jpg",0,5,"新疆","image/food7.jpg",66,188),
(null,997,1,"15555555555","123456@qq.com",md5('123456'),"jack8",1,43,"image/head8.jpg",0,99,"湖南","image/food8.jpg",66,188),
(null,998,1,"15555555555","123456@qq.com",md5('123456'),"jack9",1,29,"image/head9.jpg",0,75,"湖北","image/food9.jpg",66,188),

(null,999,2,"15555555555","123456@qq.com",md5('123456'),"tom1",1,22,"image/head1.jpg",0,78,"北京","image/shop1.jpg",66,188),
(null,9910,2,"15555555555","123456@qq.com",md5('123456'),"tom2",1,22,"image/head2.jpg",0,66,"河南","image/shop2.jpg",66,188),
(null,9911,2,"15555555555","123456@qq.com",md5('123456'),"tom3",1,25,"image/head3.jpg",0,44,"上海","image/shop3.jpg",66,188),
(null,9912,2,"15555555555","123456@qq.com",md5('123456'),"tom4",1,55,"image/head4.jpg",0,102,"广州","image/shop4.jpg",66,188),
(null,9913,2,"15555555555","123456@qq.com",md5('123456'),"tom5",1,23,"image/head5.jpg",0,64,"天津","image/shop5.jpg",66,188),
(null,9914,2,"15555555555","123456@qq.com",md5('123456'),"tom6",1,23,"image/head6.jpg",0,78,"河北","image/shop6.jpg",66,188),
(null,9915,2,"15555555555","123456@qq.com",md5('123456'),"tom7",1,45,"image/head7.jpg",0,5,"新疆","image/shop7.jpg",66,188),
(null,9916,2,"15555555555","123456@qq.com",md5('123456'),"tom8",1,43,"image/head8.jpg",0,99,"湖南","image/shop8.jpg",66,188),
(null,9917,2,"15555555555","123456@qq.com",md5('123456'),"tom9",1,29,"image/head9.jpg",0,75,"湖北","image/shop9.jpg",66,188),
(null,9918,3,"15555555555","123456@qq.com",md5('123456'),"jack11",1,22,"image/head1.jpg",0,78,"北京","image/house1.jpg",66,188),
(null,9919,3,"15555555555","123456@qq.com",md5('123456'),"jack12",1,22,"image/head2.jpg",0,66,"河南","image/house2.jpg",66,188),
(null,9920,3,"15555555555","123456@qq.com",md5('123456'),"jack13",1,25,"image/head3.jpg",0,44,"上海","image/house3.jpg",66,188),
(null,9921,3,"15555555555","123456@qq.com",md5('123456'),"jack14",1,55,"image/head4.jpg",0,102,"广州","image/house4.jpg",66,188),
(null,9922,3,"15555555555","123456@qq.com",md5('123456'),"jack15",1,23,"image/head5.jpg",0,64,"天津","image/house5.jpg",66,188),
(null,9923,3,"15555555555","123456@qq.com",md5('123456'),"jack16",1,23,"image/head6.jpg",0,78,"河北","image/house6.jpg",66,188),
(null,9924,3,"15555555555","123456@qq.com",md5('123456'),"jack17",1,45,"image/head7.jpg",0,5,"新疆","image/house7.jpg",66,188),
(null,9925,3,"15555555555","123456@qq.com",md5('123456'),"jack18",1,43,"image/head8.jpg",0,99,"湖南","image/house8.jpg",66,188),
(null,9926,3,"15555555555","123456@qq.com",md5('123456'),"jack19",1,29,"image/head9.jpg",0,75,"湖北","image/house9.jpg",66,188),

(null,9927,4,"15555555555","123456@qq.com",md5('123456'),"jack21",1,22,"image/head1.jpg",0,78,"北京","image/build1.jpg",66,188),
(null,9928,4,"15555555555","123456@qq.com",md5('123456'),"jack22",1,22,"image/head2.jpg",0,66,"河南","image/build2.jpg",66,188),
(null,9929,4,"15555555555","123456@qq.com",md5('123456'),"jack23",1,25,"image/head3.jpg",0,44,"上海","image/build3.jpg",66,188),
(null,9930,4,"15555555555","123456@qq.com",md5('123456'),"jack24",1,55,"image/head4.jpg",0,102,"广州","image/build4.jpg",66,188),
(null,9931,4,"15555555555","123456@qq.com",md5('123456'),"jack25",1,23,"image/head5.jpg",0,64,"天津","image/build5.jpg",66,188),
(null,9932,4,"15555555555","123456@qq.com",md5('123456'),"jack26",1,23,"image/head6.jpg",0,78,"河北","image/build6.jpg",66,188),
(null,9933,4,"15555555555","123456@qq.com",md5('123456'),"jack27",1,45,"image/head7.jpg",0,5,"新疆","image/build7.jpg",66,188),
(null,9934,4,"15555555555","123456@qq.com",md5('123456'),"jack28",1,43,"image/head8.jpg",0,99,"湖南","image/build8.jpg",66,188),
(null,9935,4,"15555555555","123456@qq.com",md5('123456'),"jack29",1,29,"image/head9.jpg",0,75,"湖北","image/build9.jpg",66,188),

(null,9936,5,"15555555555","123456@qq.com",md5('123456'),"jack31",1,22,"image/head1.jpg",0,78,"北京","image/scenery1.jpg",66,188),
(null,9937,5,"15555555555","123456@qq.com",md5('123456'),"jack32",1,22,"image/head2.jpg",0,66,"河南","image/scenery2.jpg",66,188),
(null,9938,5,"15555555555","123456@qq.com",md5('123456'),"jack33",1,25,"image/head3.jpg",0,44,"上海","image/scenery3.jpg",66,188),
(null,9939,5,"15555555555","123456@qq.com",md5('123456'),"jack34",1,55,"image/head4.jpg",0,102,"广州","image/scenery4.jpg",66,188),
(null,9940,5,"15555555555","123456@qq.com",md5('123456'),"jack35",1,23,"image/head5.jpg",0,64,"天津","image/scenery5.jpg",66,188),
(null,9941,5,"15555555555","123456@qq.com",md5('123456'),"jack36",1,23,"image/head6.jpg",0,78,"河北","image/scenery6.jpg",66,188),
(null,9942,5,"15555555555","123456@qq.com",md5('123456'),"jack37",1,45,"image/head7.jpg",0,5,"新疆","image/scenery7.jpg",66,188),
(null,9943,5,"15555555555","123456@qq.com",md5('123456'),"jack38",1,43,"image/head8.jpg",0,99,"湖南","image/scenery8.jpg",66,188),
(null,9944,5,"15555555555","123456@qq.com",md5('123456'),"jack39",1,29,"image/head9.jpg",0,75,"湖北","image/scenery9.jpg",66,188),

(null,9936,6,"15555555555","123456@qq.com",md5('123456'),"jack41",1,22,"image/head1.jpg",0,78,"北京","image/scenery1.jpg",66,188),
(null,9937,6,"15555555555","123456@qq.com",md5('123456'),"jack42",1,22,"image/head2.jpg",0,66,"河南","image/scenery2.jpg",66,188),
(null,9938,6,"15555555555","123456@qq.com",md5('123456'),"jack43",1,25,"image/head3.jpg",0,44,"上海","image/scenery3.jpg",66,188),
(null,9939,6,"15555555555","123456@qq.com",md5('123456'),"jack44",1,55,"image/head4.jpg",0,102,"广州","image/scenery4.jpg",66,188),
(null,9940,6,"15555555555","123456@qq.com",md5('123456'),"jack45",1,23,"image/head5.jpg",0,64,"天津","image/scenery5.jpg",66,188),
(null,9941,6,"15555555555","123456@qq.com",md5('123456'),"jack46",1,23,"image/head6.jpg",0,78,"河北","image/scenery6.jpg",66,188),
(null,9942,6,"15555555555","123456@qq.com",md5('123456'),"jack47",1,45,"image/head7.jpg",0,5,"新疆","image/scenery7.jpg",66,188),
(null,9943,6,"15555555555","123456@qq.com",md5('123456'),"jack48",1,43,"image/head8.jpg",0,99,"湖南","image/scenery8.jpg",66,188),
(null,9944,6,"15555555555","123456@qq.com",md5('123456'),"jack49",1,29,"image/head9.jpg",0,75,"湖北","image/scenery9.jpg",66,188),

(null,9936,7,"15555555555","123456@qq.com",md5('123456'),"jack51",1,22,"image/head1.jpg",0,78,"北京","image/scenery1.jpg",66,188),
(null,9937,7,"15555555555","123456@qq.com",md5('123456'),"jack52",1,22,"image/head2.jpg",0,66,"河南","image/scenery2.jpg",66,188),
(null,9938,7,"15555555555","123456@qq.com",md5('123456'),"jack53",1,25,"image/head3.jpg",0,44,"上海","image/scenery3.jpg",66,188),
(null,9939,7,"15555555555","123456@qq.com",md5('123456'),"jack54",1,55,"image/head4.jpg",0,102,"广州","image/scenery4.jpg",66,188),
(null,9940,7,"15555555555","123456@qq.com",md5('123456'),"jack55",1,23,"image/head5.jpg",0,64,"天津","image/scenery5.jpg",66,188),
(null,9941,7,"15555555555","123456@qq.com",md5('123456'),"jack56",1,23,"image/head6.jpg",0,78,"河北","image/scenery6.jpg",66,188),
(null,9942,7,"15555555555","123456@qq.com",md5('123456'),"jack57",1,45,"image/head7.jpg",0,5,"新疆","image/scenery7.jpg",66,188),
(null,9943,7,"15555555555","123456@qq.com",md5('123456'),"jack58",1,43,"image/head8.jpg",0,99,"湖南","image/scenery8.jpg",66,188),
(null,9944,7,"15555555555","123456@qq.com",md5('123456'),"jack59",1,29,"image/head9.jpg",0,75,"湖北","image/scenery9.jpg",66,188),

(null,9936,8,"15555555555","123456@qq.com",md5('123456'),"jack61",1,22,"image/head1.jpg",0,78,"北京","image/scenery1.jpg",66,188),
(null,9937,8,"15555555555","123456@qq.com",md5('123456'),"jack62",1,22,"image/head2.jpg",0,66,"河南","image/scenery2.jpg",66,188),
(null,9938,8,"15555555555","123456@qq.com",md5('123456'),"jack63",1,25,"image/head3.jpg",0,44,"上海","image/scenery3.jpg",66,188),
(null,9939,8,"15555555555","123456@qq.com",md5('123456'),"jack64",1,55,"image/head4.jpg",0,102,"广州","image/scenery4.jpg",66,188),
(null,9940,8,"15555555555","123456@qq.com",md5('123456'),"jack65",1,23,"image/head5.jpg",0,64,"天津","image/scenery5.jpg",66,188),
(null,9941,8,"15555555555","123456@qq.com",md5('123456'),"jack66",1,23,"image/head6.jpg",0,78,"河北","image/scenery6.jpg",66,188),
(null,9942,8,"15555555555","123456@qq.com",md5('123456'),"jack67",1,45,"image/head7.jpg",0,5,"新疆","image/scenery7.jpg",66,188),
(null,9943,8,"15555555555","123456@qq.com",md5('123456'),"jack68",1,43,"image/head8.jpg",0,99,"湖南","image/scenery8.jpg",66,188),
(null,9944,8,"15555555555","123456@qq.com",md5('123456'),"jack69",1,29,"image/head9.jpg",0,75,"湖北","image/scenery9.jpg",66,188),

(null,9936,9,"15555555555","123456@qq.com",md5('123456'),"jack71",1,22,"image/head1.jpg",0,78,"北京","image/scenery1.jpg",66,188),
(null,9937,9,"15555555555","123456@qq.com",md5('123456'),"jack72",1,22,"image/head2.jpg",0,66,"河南","image/scenery2.jpg",66,188),
(null,9938,9,"15555555555","123456@qq.com",md5('123456'),"jack73",1,25,"image/head3.jpg",0,44,"上海","image/scenery3.jpg",66,188),
(null,9939,9,"15555555555","123456@qq.com",md5('123456'),"jack74",1,55,"image/head4.jpg",0,102,"广州","image/scenery4.jpg",66,188),
(null,9940,9,"15555555555","123456@qq.com",md5('123456'),"jack75",1,23,"image/head5.jpg",0,64,"天津","image/scenery5.jpg",66,188),
(null,9941,9,"15555555555","123456@qq.com",md5('123456'),"jack76",1,23,"image/head6.jpg",0,78,"河北","image/scenery6.jpg",66,188),
(null,9942,9,"15555555555","123456@qq.com",md5('123456'),"jack77",1,45,"image/head7.jpg",0,5,"新疆","image/scenery7.jpg",66,188),
(null,9943,9,"15555555555","123456@qq.com",md5('123456'),"jack78",1,43,"image/head8.jpg",0,99,"湖南","image/scenery8.jpg",66,188),
(null,9944,9,"15555555555","123456@qq.com",md5('123456'),"jack79",1,29,"image/head9.jpg",0,75,"湖北","image/scenery9.jpg",66,188),

(null,9945,10,"15555555555","123456@qq.com",md5('123456'),"jack1",1,22,"image/head1.jpg",0,78,"北京","image/food1.jpg",66,188),
(null,9946,10,"15555555555","123456@qq.com",md5('123456'),"jack2",1,22,"image/head2.jpg",0,66,"河南","image/food2.jpg",66,188),
(null,9947,10,"155555house5","123456@qq.com",md5('123456'),"jack3",1,25,"image/head3.jpg",0,44,"上海","image/food3.jpg",66,188),
(null,9948,10,"155555house5","123456@qq.com",md5('123456'),"jack4",1,55,"image/head4.jpg",0,102,"广州","image/food4.jpg",66,188),
(null,9949,10,"15555555555","123456@qq.com",md5('123456'),"jack5",1,23,"image/head5.jpg",0,64,"天津","image/food5.jpg",66,188),
(null,9950,10,"15555555555","123456@qq.com",md5('123456'),"jack6",1,23,"image/head6.jpg",0,78,"河北","image/food6.jpg",66,188),
(null,9951,10,"15555555555","123456@qq.com",md5('123456'),"jack7",1,45,"image/head7.jpg",0,5,"新疆","image/food7.jpg",66,188),
(null,9952,10,"15555555555","123456@qq.com",md5('123456'),"jack8",1,43,"image/head8.jpg",0,99,"湖南","image/food8.jpg",66,188),
(null,9953,10,"15555555555","123456@qq.com",md5('123456'),"jack9",1,29,"image/head9.jpg",0,75,"湖北","image/food9.jpg",66,188),

(null,9954,11,"15555555555","123456@qq.com",md5('123456'),"tom1",1,22,"image/head1.jpg",0,78,"北京","image/shop1.jpg",66,188),
(null,9956,11,"15555555555","123456@qq.com",md5('123456'),"tom2",1,22,"image/head2.jpg",0,66,"河南","image/shop2.jpg",66,188),
(null,9957,11,"15555555555","123456@qq.com",md5('123456'),"tom3",1,25,"image/head3.jpg",0,44,"上海","image/shop3.jpg",66,188),
(null,9958,11,"15555555555","123456@qq.com",md5('123456'),"tom4",1,55,"image/head4.jpg",0,102,"广州","image/shop4.jpg",66,188),
(null,9959,11,"15555555555","123456@qq.com",md5('123456'),"tom5",1,23,"image/head5.jpg",0,64,"天津","image/shop5.jpg",66,188),
(null,9960,11,"15555555555","123456@qq.com",md5('123456'),"tom6",1,23,"image/head6.jpg",0,78,"河北","image/shop6.jpg",66,188),
(null,9961,11,"15555555555","123456@qq.com",md5('123456'),"tom7",1,45,"image/head7.jpg",0,5,"新疆","image/shop7.jpg",66,188),
(null,9962,11,"15555555555","123456@qq.com",md5('123456'),"tom8",1,43,"image/head8.jpg",0,99,"湖南","image/shop8.jpg",66,188),
(null,9963,11,"15555555555","123456@qq.com",md5('123456'),"tom9",1,29,"image/head9.jpg",0,75,"湖北","image/shop9.jpg",66,188),
(null,9964,12,"15555555555","123456@qq.com",md5('123456'),"jack11",1,22,"image/head1.jpg",0,78,"北京","image/house1.jpg",66,188),
(null,9965,12,"15555555555","123456@qq.com",md5('123456'),"jack12",1,22,"image/head2.jpg",0,66,"河南","image/house2.jpg",66,188),
(null,9966,12,"15555555555","123456@qq.com",md5('123456'),"jack13",1,25,"image/head3.jpg",0,44,"上海","image/house3.jpg",66,188),
(null,9967,12,"15555555555","123456@qq.com",md5('123456'),"jack14",1,55,"image/head4.jpg",0,102,"广州","image/house4.jpg",66,188),
(null,9968,12,"15555555555","123456@qq.com",md5('123456'),"jack15",1,23,"image/head5.jpg",0,64,"天津","image/house5.jpg",66,188),
(null,9969,12,"15555555555","123456@qq.com",md5('123456'),"jack16",1,23,"image/head6.jpg",0,78,"河北","image/house6.jpg",66,188),
(null,9970,12,"15555555555","123456@qq.com",md5('123456'),"jack17",1,45,"image/head7.jpg",0,5,"新疆","image/house7.jpg",66,188),
(null,9971,12,"15555555555","123456@qq.com",md5('123456'),"jack18",1,43,"image/head8.jpg",0,99,"湖南","image/house8.jpg",66,188),
(null,9972,12,"15555555555","123456@qq.com",md5('123456'),"jack19",1,29,"image/head9.jpg",0,75,"湖北","image/house9.jpg",66,188),

(null,9973,13,"15555555555","123456@qq.com",md5('123456'),"jack21",1,22,"image/head1.jpg",0,78,"北京","image/build1.jpg",66,188),
(null,9974,13,"15555555555","123456@qq.com",md5('123456'),"jack22",1,22,"image/head2.jpg",0,66,"河南","image/build2.jpg",66,188),
(null,9975,13,"15555555555","123456@qq.com",md5('123456'),"jack23",1,25,"image/head3.jpg",0,44,"上海","image/build3.jpg",66,188),
(null,9976,13,"15555555555","123456@qq.com",md5('123456'),"jack24",1,55,"image/head4.jpg",0,102,"广州","image/build4.jpg",66,188),
(null,9977,13,"15555555555","123456@qq.com",md5('123456'),"jack25",1,23,"image/head5.jpg",0,64,"天津","image/build5.jpg",66,188),
(null,9978,13,"15555555555","123456@qq.com",md5('123456'),"jack26",1,23,"image/head6.jpg",0,78,"河北","image/build6.jpg",66,188),
(null,9979,13,"15555555555","123456@qq.com",md5('123456'),"jack27",1,45,"image/head7.jpg",0,5,"新疆","image/build7.jpg",66,188),
(null,9980,13,"15555555555","123456@qq.com",md5('123456'),"jack28",1,43,"image/head8.jpg",0,99,"湖南","image/build8.jpg",66,188),
(null,9981,13,"15555555555","123456@qq.com",md5('123456'),"jack29",1,29,"image/head9.jpg",0,75,"湖北","image/build9.jpg",66,188),

(null,9982,14,"15555555555","123456@qq.com",md5('123456'),"jack31",1,22,"image/head1.jpg",0,78,"北京","image/scenery1.jpg",66,188),
(null,9983,14,"15555555555","123456@qq.com",md5('123456'),"jack32",1,22,"image/head2.jpg",0,66,"河南","image/scenery2.jpg",66,188),
(null,9984,14,"15555555555","123456@qq.com",md5('123456'),"jack33",1,25,"image/head3.jpg",0,44,"上海","image/scenery3.jpg",66,188),
(null,9985,14,"15555555555","123456@qq.com",md5('123456'),"jack34",1,55,"image/head4.jpg",0,102,"广州","image/scenery4.jpg",66,188),
(null,9986,14,"15555555555","123456@qq.com",md5('123456'),"jack35",1,23,"image/head5.jpg",0,64,"天津","image/scenery5.jpg",66,188),
(null,9987,14,"15555555555","123456@qq.com",md5('123456'),"jack36",1,23,"image/head6.jpg",0,78,"河北","image/scenery6.jpg",66,188),
(null,9988,14,"15555555555","123456@qq.com",md5('123456'),"jack37",1,45,"image/head7.jpg",0,5,"新疆","image/scenery7.jpg",66,188),
(null,9989,14,"15555555555","123456@qq.com",md5('123456'),"jack38",1,43,"image/head8.jpg",0,99,"湖南","image/scenery8.jpg",66,188),
(null,9990,14,"15555555555","123456@qq.com",md5('123456'),"jack39",1,29,"image/head9.jpg",0,75,"湖北","image/scenery9.jpg",66,188),

(null,9991,15,"15555555555","123456@qq.com",md5('123456'),"jack41",1,22,"image/head1.jpg",0,78,"北京","image/scenery1.jpg",66,188),
(null,9992,15,"15555555555","123456@qq.com",md5('123456'),"jack42",1,22,"image/head2.jpg",0,66,"河南","image/scenery2.jpg",66,188),
(null,9993,15,"15555555555","123456@qq.com",md5('123456'),"jack43",1,25,"image/head3.jpg",0,44,"上海","image/scenery3.jpg",66,188),
(null,9994,15,"15555555555","123456@qq.com",md5('123456'),"jack44",1,55,"image/head4.jpg",0,102,"广州","image/scenery4.jpg",66,188),
(null,9995,15,"15555555555","123456@qq.com",md5('123456'),"jack45",1,23,"image/head5.jpg",0,64,"天津","image/scenery5.jpg",66,188),
(null,9996,15,"15555555555","123456@qq.com",md5('123456'),"jack46",1,23,"image/head6.jpg",0,78,"河北","image/scenery6.jpg",66,188),
(null,9997,15,"15555555555","123456@qq.com",md5('123456'),"jack47",1,45,"image/head7.jpg",0,5,"新疆","image/scenery7.jpg",66,188),
(null,9998,15,"15555555555","123456@qq.com",md5('123456'),"jack48",1,43,"image/head8.jpg",0,99,"湖南","image/scenery8.jpg",66,188),
(null,9999,15,"15555555555","123456@qq.com",md5('123456'),"jack49",1,29,"image/head9.jpg",0,75,"湖北","image/scenery9.jpg",66,188);






#用户上传图片表
CREATE TABLE user_images(
  umid INT PRIMARY KEY auto_increment,
  uid INT,        #用户id       
  uimgurl VARCHAR(128),   #图片路径
  praise INT         #点赞次数
);
INSERT INTO user_images VALUES
(null,45,"image/food1.jpg",66),
(null,44,"image/food2.jpg",69),
(null,43,"image/food3.jpg",69),
(null,14,"image/food4.jpg",69),
(null,15,"image/food5.jpg",69),
(null,16,"image/food6.jpg",69),
(null,17,"image/food7.jpg",69),
(null,18,"image/food8.jpg",69),
(null,19,"image/food9.jpg",69),
(null,21,"image/shop1.jpg",69),
(null,22,"image/shop2.jpg",69),
(null,23,"image/shop3.jpg",69),
(null,24,"image/shop4.jpg",69),
(null,25,"image/shop5.jpg",69),
(null,26,"image/shop6.jpg",69),
(null,27,"image/shop7.jpg",69),
(null,28,"image/shop8.jpg",69),
(null,29,"image/shop9.jpg",69),
(null,31,"image/house1.jpg",69),
(null,32,"image/house2.jpg",69),
(null,33,"image/house3.jpg",69),
(null,34,"image/house4.jpg",69),
(null,35,"image/house5.jpg",69),
(null,36,"image/house6.jpg",69),
(null,37,"image/house7.jpg",69),
(null,38,"image/house8.jpg",69),
(null,39,"image/house9.jpg",69),
(null,42,"image/build1.jpg",69),
(null,41,"image/build2.jpg",69),

(null,41,"image/build3.jpg",69),
(null,42,"image/build4.jpg",69),
(null,43,"image/build5.jpg",69),
(null,44,"image/build6.jpg",69),
(null,45,"image/build7.jpg",69),
(null,42,"image/build8.jpg",69),
(null,41,"image/build9.jpg",69),
(null,45,"image/scenery1.jpg",69),
(null,45,"image/scenery2.jpg",69),
(null,45,"image/scenery3.jpg",69),
(null,45,"image/scenery4.jpg",69),
(null,45,"image/scenery5.jpg",69),
(null,44,"image/scenery6.jpg",69),
(null,44,"image/scenery7.jpg",69),
(null,44,"image/scenery8.jpg",69),
(null,43,"image/scenery9.jpg",69),

(null,4,"image/build3.jpg",69),
(null,4,"image/build4.jpg",69),
(null,4,"image/build5.jpg",69),
(null,4,"image/build6.jpg",69),
(null,4,"image/build7.jpg",69),
(null,4,"image/build8.jpg",69),
(null,4,"image/build9.jpg",69),
(null,5,"image/scenery1.jpg",69),
(null,5,"image/scenery2.jpg",69),
(null,5,"image/scenery3.jpg",69),
(null,5,"image/scenery4.jpg",69),
(null,5,"image/scenery5.jpg",69),
(null,5,"image/scenery6.jpg",69),
(null,5,"image/scenery7.jpg",69),
(null,5,"image/scenery8.jpg",69),
(null,5,"image/scenery9.jpg",69),
(null,13,"image/food1.jpg",66),
(null,14,"image/food2.jpg",69),
(null,13,"image/food3.jpg",69),
(null,12,"image/food4.jpg",69),
(null,11,"image/food5.jpg",69),
(null,10,"image/food6.jpg",69),
(null,21,"image/food7.jpg",69),
(null,31,"image/food8.jpg",69),
(null,41,"image/food9.jpg",69),

(null,21,"image/shop1.jpg",69),
(null,22,"image/shop2.jpg",69),
(null,23,"image/shop3.jpg",69),
(null,24,"image/shop4.jpg",69),
(null,25,"image/shop5.jpg",69),
(null,26,"image/shop6.jpg",69),
(null,27,"image/shop7.jpg",69),
(null,29,"image/shop8.jpg",69),
(null,29,"image/shop9.jpg",69),
(null,30,"image/house1.jpg",69),
(null,31,"image/house2.jpg",69),
(null,32,"image/house3.jpg",69),
(null,33,"image/house4.jpg",69),
(null,28,"image/house5.jpg",69),
(null,35,"image/house6.jpg",69),
(null,36,"image/house7.jpg",69),
(null,37,"image/house8.jpg",69),
(null,38,"image/house9.jpg",69),
(null,41,"image/build1.jpg",69),
(null,42,"image/build2.jpg",69),
(null,43,"image/build3.jpg",69),
(null,44,"image/build4.jpg",69),
(null,45,"image/build5.jpg",69),
(null,40,"image/build6.jpg",69),
(null,41,"image/build7.jpg",69),
(null,42,"image/build8.jpg",69),
(null,43,"image/build9.jpg",69),
(null,11,"image/scenery1.jpg",69),
(null,12,"image/scenery2.jpg",69),
(null,13,"image/scenery3.jpg",69),
(null,14,"image/scenery4.jpg",69),
(null,15,"image/scenery5.jpg",69),
(null,16,"image/scenery6.jpg",69),
(null,17,"image/scenery7.jpg",69),
(null,18,"image/scenery8.jpg",69),
(null,19,"image/scenery9.jpg",69),
(null,11,"image/food1.jpg",66),
(null,12,"image/food2.jpg",69),
(null,13,"image/food3.jpg",69),
(null,14,"image/food4.jpg",69),
(null,15,"image/food5.jpg",69),
(null,16,"image/food6.jpg",69),
(null,17,"image/food7.jpg",69),
(null,18,"image/food8.jpg",69),
(null,19,"image/food9.jpg",69),
(null,21,"image/shop1.jpg",69),
(null,22,"image/shop2.jpg",69),
(null,23,"image/shop3.jpg",69),
(null,24,"image/shop4.jpg",69),
(null,25,"image/shop5.jpg",69),
(null,26,"image/shop6.jpg",69),
(null,27,"image/shop7.jpg",69),
(null,22,"image/shop8.jpg",69),
(null,29,"image/shop9.jpg",69),
(null,30,"image/house1.jpg",69),
(null,31,"image/house2.jpg",69),
(null,32,"image/house3.jpg",69),
(null,33,"image/house4.jpg",69),
(null,34,"image/house5.jpg",69),
(null,35,"image/house6.jpg",69),
(null,36,"image/house7.jpg",69),

(null,2,"image/shop1.jpg",69),
(null,2,"image/shop2.jpg",69),
(null,2,"image/shop3.jpg",69),
(null,2,"image/shop4.jpg",69),
(null,2,"image/shop5.jpg",69),
(null,2,"image/shop6.jpg",69),
(null,2,"image/shop7.jpg",69),
(null,2,"image/shop8.jpg",69),
(null,2,"image/shop9.jpg",69),
(null,3,"image/house1.jpg",69),
(null,3,"image/house2.jpg",69),
(null,3,"image/house3.jpg",69),
(null,3,"image/house4.jpg",69),
(null,3,"image/house5.jpg",69),
(null,3,"image/house6.jpg",69),
(null,3,"image/house7.jpg",69),
(null,3,"image/house8.jpg",69),
(null,3,"image/house9.jpg",69),
(null,4,"image/build1.jpg",69),
(null,4,"image/build2.jpg",69),
(null,4,"image/build3.jpg",69),
(null,4,"image/build4.jpg",69),
(null,4,"image/build5.jpg",69),
(null,4,"image/build6.jpg",69),
(null,4,"image/build7.jpg",69),
(null,4,"image/build8.jpg",69),
(null,4,"image/build9.jpg",69),
(null,5,"image/scenery1.jpg",69),
(null,5,"image/scenery2.jpg",69),
(null,5,"image/scenery3.jpg",69),
(null,5,"image/scenery4.jpg",69),
(null,5,"image/scenery5.jpg",69),
(null,5,"image/scenery6.jpg",69),
(null,5,"image/scenery7.jpg",69),
(null,5,"image/scenery8.jpg",69),
(null,5,"image/scenery9.jpg",69),
(null,1,"image/food1.jpg",66),
(null,1,"image/food2.jpg",69),
(null,1,"image/food3.jpg",69),
(null,1,"image/food4.jpg",69),
(null,1,"image/food5.jpg",69),
(null,1,"image/food6.jpg",69),
(null,1,"image/food7.jpg",69),
(null,1,"image/food8.jpg",69),
(null,1,"image/food9.jpg",69),
(null,2,"image/shop1.jpg",69),
(null,2,"image/shop2.jpg",69),
(null,2,"image/shop3.jpg",69),
(null,2,"image/shop4.jpg",69),
(null,2,"image/shop5.jpg",69),
(null,2,"image/shop6.jpg",69),
(null,2,"image/shop7.jpg",69),
(null,2,"image/shop8.jpg",69),
(null,2,"image/shop9.jpg",69),
(null,3,"image/house1.jpg",69),
(null,3,"image/house2.jpg",69),
(null,3,"image/house3.jpg",69),
(null,3,"image/house4.jpg",69),
(null,3,"image/house5.jpg",69),
(null,3,"image/house6.jpg",69),
(null,3,"image/house7.jpg",69),

(null,21,"image/house8.jpg",69),
(null,20,"image/house9.jpg",69),
(null,19,"image/build1.jpg",69),
(null,18,"image/build2.jpg",69),
(null,17,"image/build3.jpg",69),
(null,16,"image/build4.jpg",69),
(null,15,"image/build5.jpg",69),
(null,14,"image/build6.jpg",69),
(null,13,"image/build7.jpg",69),
(null,12,"image/build8.jpg",69),
(null,11,"image/build9.jpg",69),
(null,10,"image/scenery1.jpg",69),
(null,6,"image/scenery2.jpg",69),
(null,7,"image/scenery3.jpg",69),
(null,28,"image/scenery4.jpg",69),

(null,8,"image/scenery4.jpg",69),

(null,9,"image/scenery5.jpg",69),
(null,9,"image/scenery6.jpg",69),
(null,8,"image/scenery7.jpg",69),
(null,7,"image/scenery8.jpg",69),

(null,6,"image/scenery9.jpg",69);



#定位地点表
CREATE TABLE cy_place(
  pid INT PRIMARY KEY,
  site VARCHAR(128),  #主标题
  sites VARCHAR(128)   #副标题
);
INSERT INTO cy_place VALUES
(0,"重庆","China"),
(1,"重庆",""),
(2,"重庆洪崖洞","洪崖洞,Chongqing,China"),
(3,"重庆北城天街","china"),
(4,"重庆市解放碑","china"),
(5,"解放碑步行街","china"),
(6,"重庆两路口","china"),
(7,"重庆红旗河沟","china"),
(8,"重庆江北城","china"),
(9,"重庆","china"),
(10,"重庆","china");



