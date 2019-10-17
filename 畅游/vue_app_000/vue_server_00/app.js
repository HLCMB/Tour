//1. 引入第三方模块
const express=require("express");
const mysql=require("mysql");
const cors=require("cors");
const session=require("express-session");

//2. 配置第三方模块
    // 2.1：配置连接池
    var pool=mysql.createPool({
        host:"127.0.0.1",
        user:"root",
        password:"",
        port:3306,
        database:"cy",
        connectionLimit:20  
    });

var server=express();
// 指定静态目录
server.use(express.static("public"));
// 监听端口
server.listen(3000);

    // 2.2:跨域
    server.use(cors({
        origin:[
            "http://127.0.0.1:8080",
            "http://localhost:8080"
        ],
        credentials:true
    }));
    // 2.3:session
    server.use(session({
        secret:"128位字符串",
        resave:true,
        saveUninitialized:true
    }));

//3


//现仅供测试使用
//获取推荐用户的信息
server.get("/cy",(req,res)=>{
    // 数据库获取用户的名字和头像照片地址
    var sql="SELECT uid,uname,uheadurl,uattention FROM cy_user";
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        // console.log(result)
        res.send({code:1,data:result});
    })
})

server.get("/SuggestListAllMsg",(req,res)=>{
    // 数据库获取用户的名字和头像照片地址
    var sql="SELECT uid,uname,uheadurl,uattention FROM cy_attent_user";
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        // console.log(result)
        res.send({code:1,data:result});
    })
})

