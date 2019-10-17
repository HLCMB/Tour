//vue_server_00/app.js  node 程序
//1.加载第三方模块
//服务器
const express = require("express");
//mysql驱动
const mysql = require("mysql");
//跨域
const cors = require("cors");
//session
const session = require("express-session");
//2.配置数据库连接池：提高数据效率
var pool = mysql.createPool({
    host: "127.0.0.1",//数据库地址
    user: "root",//数据库用户名
    password: "",//数据库密码
    port: 3306,//数据库端口
    database: "cy",//数据库名称
    connectionLimit: 15//连接数量
});

var server = express();
//3.配置跨域模块
server.use(cors({
    //允许跨域访问程序地址列表
    origin: ["http://127.0.0.1:8080", "http://localhost:8080"],
    credentials: true//请求验证
}))

//4.配置seesion模块
server.use(session({
    secret: "128为字符串",//安全字符串进行加密
    resave: true,         //每次请求都更新数据
    saveUninitialized: true//保存初始数据
}))
//4.1配置项目的静态目录
server.use(express.static("public"));

server.listen(3000);


// 1.登录
server.get("/login", (req, res) => {
    // 获取用户名
    var phone = req.query.phone;
    // 获取密码
    var upwd = req.query.upwd;
    // 获取邮箱
    var email = req.query.email;
    console.log(email);
    // 创建sql语句
    var sql = ""
    if (phone === undefined) {
        sql = `SELECT uid FROM cy_user WHERE uemail='${email}' AND upwd=md5(?)`;
    } else if (email === undefined) {
        sql = `SELECT uid FROM cy_user WHERE uphone=${phone} AND upwd=md5(?)`;
    }
    pool.query(sql, [upwd], (err, result) => {
        if (err) throw err;
        if (result.length == 0) {

            res.send({ code: -1, msg: "用户名密码有误" });
        } else {
            //登录成功
            //1.将登录成功凭据保存session
            //result=[{id:1}]
            req.session.uid = result[0].uid;
            // console.log(req.session);
            //2.将成功消息发送脚手架
            res.send({ code: 1, msg: "登录成功" })

        }
    })
})

// 2.注册
server.get("/regist", (req, res) => {
    var find = {
        result1: "",
        result2: ""
    };
    // 获取用户名
    var phone = req.query.phone;
    // 获取邮箱
    var email = req.query.email;
    // 获取用户密码
    var upwd = req.query.upwd;
    // 查询是否有相同的手机号或邮箱
    // 创建sql语句
    // console.log(phone);
    if (phone === undefined) {
        sql = `SELECT uid FROM cy_user WHERE uemail='${email}'`;
    } else if (email === undefined) {
        sql = `SELECT uid FROM cy_user WHERE uphone=${phone}`;
    }

    pool.query(sql, (err, result) => {
        if (err) throw err;
        console.log(phone);
        console.log(upwd);
        console.log(email);
        if (result.length > 0 && phone === undefined && upwd === undefined) {
            find.result1 = ({ code: -1, "msg": "邮箱已经被注册" });
        } else {
            find.result1 = ({ code: 1, "msg": "邮箱可用" });

            if (result.length > 0 && email === undefined) {
                find.result1 = ({ code: -1, "msg": "手机号已经被注册" });
            } else {
                find.result1 = ({ code: 1, "msg": "手机号可用" });
            }
        }

        if (result.length === 0 && upwd !== undefined) {

            if (phone === undefined) {
                sql = `INSERT INTO cy_user VALUES(null,"",'${email}',md5(${upwd}),"",0,0,"",0,0,"","")`;
            } else if (email === undefined) {
                sql = `INSERT INTO cy_user VALUES(null,${phone},"",md5(${upwd}),"",0,0,"",0,0,"","")`;
            }
            pool.query(sql, (err, result) => {
                if (err) throw err;
                res.send({ code: 1, "msg": "注册成功" });
            });
        } else {
            res.send(find.result1);
        }





    });

});

// 李
server.get("/user", (req, res) => {
    // 定义返回的总的结果
    var count = {
        user: [],
        img: []
    }
    // 获取id

    var did = req.query.did;
    // 创建sql
    var sql = "SELECT * FROM cy_user_detail WHERE did=?";
    pool.query(sql, [did], (err, result) => {
        if (err) throw err;
        count.user = result;
        // 创建sql语句
        var sql = "SELECT * FROM user_images WHERE uid=?";
        pool.query(sql, [did], (err, result) => {
            if (err) throw err;
            count.img = result;

            var uid = req.query.uid;
            // 创建sql
            var sql = "SELECT * FROM cy_user WHERE uid=?";
            pool.query(sql, [uid], (err, result) => {
                if (err) throw err;
                count.user = result;
                // 创建sql语句
                var sql = "SELECT * FROM user_img WHERE uid=?";
                pool.query(sql, [uid], (err, result) => {
                    if (err) throw err;
                    count.img = result;
                    res.send(count);
                });
            })
        })
    })
})

// 获取地点
server.get("/place", (req, res) => {
    // 创建sql语句
    var sql = "SELECT * FROM cy_place";
    pool.query(sql, (err, result) => {
        if (err) throw err;
        res.send(result);
    })
})




// 搜索页图片
server.get("/cy", (req, res) => {

    // 创建sql语句
    var results = {
        result1: [],
        result2: [],//获取所有推荐用户信息数组
        result3: [],//获取用户详情信息数组

    };


    var uid3 = req.query.uid; //获取删除推荐用户列表 // 贾

    var sql = "SELECT * FROM user_img";
    pool.query(sql, (err, result) => {
        if (err) throw err;
        results.result1 = result;


        // console.log(uid);
        var sql = "SELECT * FROM user_img";
        pool.query(sql, (err, result) => {
            if (err) throw err;
            results.result1 = result;

            // console.log(result);

            // 贾  《---
            // 数据库获取用户的名字和头像照片地址


            //返回results
            // res.send({ code: 1, data: results });


            var sql = "SELECT uid,uname,uheadurl,uattention FROM cy_user";
            pool.query(sql, (err, result) => {
                if (err) throw err;
                results.result2 = result;
                // console.log(result)




                var sql1 = "SELECT * FROM cy_user_recommend";
                pool.query(sql1, (err, result) => {
                    if (err) throw err;
                    results.result2 = result;
                    // console.log(result)  

                    var sql3 = "DELETE FROM cy_user_recommend WHERE uid=?";
                    pool.query(sql3, [uid3], (err, result) => {
                        if (err) throw err;

                        //---》


                        //返回results
                        res.send({ code: 1, data: results });
                    })


                    //返回results
                    // res.send({ code: 1, data: results });
                })
            })
        })
    });
})

server.get("/detailes", (req, res) => {
    var uid = req.query.uid;
    var sql = "SELECT * FROM cy_user_detail WHERE uid=?";
    pool.query(sql, [uid], (err, result) => {
        if (err) throw err;
        res.send(result);
        // console.log(uid);
    })
})




//贾
//获取已关注用户的信息 -- 聊天页面
server.get("/ChatFunction", (req, res) => {
    // 数据库获取用户的名字和头像照片地址
    var sql = "SELECT uid,uname,uheadurl FROM cy_attent_user";
    pool.query(sql, (err, result) => {
        if (err) throw err;
        res.send({ code: 1, data: result });
    })
})

//条件查询符合查询的用户
server.get("/ChatFunction2", (req, res) => {
    var uname = req.query.uname;//条件搜索用户
    var sql = `SELECT uid,uname,uheadurl FROM cy_attent_user WHERE uname LIKE '%${uname}%' ORDER BY uname`;
    pool.query(sql, [uname], (err, result) => {
        if (err) throw err;
        res.send({ code: 1, data: result });
    })
})

// //修改用户的关注状态

// server.get("/SuggestListAllMsg", (req, res) => {
//     var uid = req.query.uid;//获取事件用户的id
//     var uphone = req.query.uphone;
//     var uemail = req.query.uemail;
//     var upwd = req.query.upwd;
//     var uname = req.query.uname;
//     var usex = req.query.usex;
//     var uage = req.query.uage;
//     var uheadurl = req.query.uheadurl;
//     var uattention = req.query.uattention;
//     var uattents = req.query.uattents;
//     var uaddress = req.query.uaddress;

//     //修改该事件用户的关注状态，并从 cy_user_recommend 推荐列表中删除该用户，使其在推荐用户中删除
//     var sql = "UPDATE cy_user_recommend SET uattention=? WHERE uid=?"
//     pool.query(sql, [uattention, uid], (err, result) => {
//         if (err) throw err;
//         //修改成功后，把该用户添加到 cy_attent_user 已关注用户列表中
//     })
// })



//贾
//获取已关注用户的信息 -- 聊天页面
server.get("/ChatFunction", (req, res) => {
    // 数据库获取用户的名字和头像照片地址
    var sql = "SELECT uid,uname,uheadurl FROM cy_attent_user";
    pool.query(sql, (err, result) => {
        if (err) throw err;
        res.send({ code: 1, data: result });
    })
})

//条件查询符合查询的用户
server.get("/ChatFunction2", (req, res) => {
    var uname = req.query.uname;//条件搜索用户
    var sql = `SELECT uid,uname,uheadurl FROM cy_attent_user WHERE uname LIKE '%${uname}%' ORDER BY uname`;
    pool.query(sql, [uname], (err, result) => {
        if (err) throw err;
        res.send({ code: 1, data: result });
    })
})





//贾
//获取已关注用户的信息 -- 聊天页面
server.get("/ChatFunction", (req, res) => {
    // 数据库获取用户的名字和头像照片地址
    var uname = req.query.uname;//条件搜索用户
    if (!uname) {
        var sql = "SELECT uid,uname,uheadurl FROM cy_attent_user";
    } else {
        var sql = `SELECT uid,uname,uheadurl FROM cy_attent_user WHERE uname LIKE '%${uname}%'`;
    }
    pool.query(sql, (err, result) => {
        if (err) throw err;
        res.send({ code: 1, data: result });
    })
})


//修改用户的关注状态

server.get("/SuggestListAllMsg", (req, res) => {
    var uid = req.query.uid;//获取事件用户的id
    var uphone = req.query.uphone;
    var uemail = req.query.uemail;
    var upwd = req.query.upwd;
    var uname = req.query.uname;
    var usex = req.query.usex;
    var uage = req.query.uage;
    var uheadurl = req.query.uheadurl;
    var uattention = req.query.uattention;
    var uattents = req.query.uattents;
    var uaddress = req.query.uaddress;
    var ufans = req.query.ufans;

    //修改该事件用户的关注状态，并从 cy_user_recommend 推荐列表中删除该用户，使其在推荐用户中删除
    var sql = "UPDATE cy_user_recommend SET uattention=? WHERE uid=?"
    pool.query(sql, [uattention, uid], (err, result) => {
        if (err) throw err;
        //修改成功后，把该用户添加到 cy_attent_user 已关注用户列表中

        var sql1 = `INSERT INTO cy_attent_user VALUES(null,${uphone},'${uemail}','${upwd}','${uname}',${usex},${uage},'${uheadurl} ',${uattention},${uattents},'${uaddress} ${ufans}')`;
        pool.query(sql1, (err, result) => {
            if (err) throw err;

            //把用户添加成功后从 cy_user_recommend 推荐列表中删除该用户
            var sql2 = "DELETE FROM cy_user_recommend WHERE uid=?";
            pool.query(sql2, [uid], (err, result) => {
                if (err) throw err;


                res.send({ code: 1, msg: "添加成功" })
            })
        })
    })
})

//获取点击用户的信息，并加载相应的信息到对应的聊天页面
server.get("/ChatFunction4", (req, res) => {
    var uid = req.query.uid;
    var sql = "SELECT * FROM cy_attent_user  WHERE uid=?"
    pool.query(sql, [uid], (err, result) => {
        if (err) throw err;
        res.send({ code: 1, data: result });
    })
})

//获取个人信息
server.get("/personinformation", (req, res) => {
    var uid = req.query.uid;
    var sql = "SELECT * FROM cy_user WHERE uid=?";
    pool.query(sql, [uid], (err, result) => {
        if (err) throw err;
        res.send({ code: 1, data: result })
    })
})

//获取全部照片
server.get("/video",(req,res)=>{
    var sql="SELECT * FROM cy_user_detail";
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        res.send({code :1, data: result});
    })
})

//获取点击事件的信息
server.get("/tvvideo2",(req,res)=>{
    var did=req.query.did;
    var sql="SELECT * FROM cy_user_detail WHERE did=?";
    pool.query(sql,[did],(err,result)=>{
        if(err) throw err;
        res.send({code :1, data: result});
    })
})






// 陶
//获取当前登录的用户信息
server.get("/theuser", (req, res) => {
    var uid = req.session.uid;
    console.log(req.session.uid);
    var sql = "SELECT * FROM cy_user WHERE uid=?";
    pool.query(sql, [uid], (err, result) => {
        if (err) throw err;
        var res1=result;
        var sql="SELECT * FROM user_images WHERE uid=?";
        pool.query(sql,[uid],(err,result)=>{
            if(err) throw err;
            var res2=result;
            res.send({code:1,data:[res1,res2]});
        })
    })
    //获取当前用户的详情
   
})

