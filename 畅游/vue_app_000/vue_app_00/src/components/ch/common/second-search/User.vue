<template>
<div  @click="point">
    <div class="pop-up-box" style="display:none">
            <div class="pop-up">
                <p>举报...</p>
                <p>减少这类帖子</p>
                <p>复制链接...</p>
                <p>分享链接...</p>
            </div>
        </div>
    <div class="up" v-for="(item,i) of user" :key="i">
        <div class="title_box">
            <div class="title" @click="arrows">
                <img src="../../../../assets/arrows.png" alt="">
                <span>{{item.uname}}</span>
            </div>
            <img class="point" src="../../../../assets/point.png" alt="">
        </div>
        <div class="tiezi">
            <img :src="'http://127.0.0.1:3000/'+item.uheadurl" alt="">
            <div>
                <span class="num">{{item.post}}</span>
                <span>帖子</span>
            </div>
            <div>
                <span class="num">{{item.fans}}</span>
                <span>粉丝</span>
            </div>
            <div>
                <span class="num">{{item.uattents}}</span>
                <span>已关注</span>
            </div>
        </div>
        <div class="user">
            <span>{{item.uname}}</span>
        </div>
        <div class="btn">
            <mt-button @click="focus" id="focus" size="large" type="primary">关注</mt-button>
            <mt-button size="large" type="default">发消息</mt-button>
        </div>
    </div>
    <div class="img_box">
        <div  class="img_list" v-for="(item , i) of imgs" :key="i">
        <img :src="'http://127.0.0.1:3000/'+item.uimgurl" alt="">
    </div>
    </div>
    </div>
</template>

<script>
export default {
    data(){
        return{
            imgs:[],
            user:[],
        }
    },
    props:["uid","did","j"],
    methods: {
        focus(e){
            var btn=document.getElementById("focus");
            if(e.target===btn&&btn.innerHTML==="关注"){
                btn.innerHTML="已关注"
            }else{
                btn.innerHTML="关注"
            }
        },
        load(){
            var obj={did:this.did,uid:this.uid}
            this.axios("user",{params:obj})
            .then(res=>{
                // console.log(res);
                this.user=res.data.user;
                this.imgs=res.data.img;
                // console.log(this.user);
            })
        },
        // 弹窗
        point(e){
            var point=document.getElementsByClassName("point")[0];
            var pop=document.getElementsByClassName("pop-up-box")[0];
                // console.log(pop);
            if(e.target==point){
                // console.log(1);
                pop.style.display="";
            }else{
                pop.style.display="none";
            }
        },
        // 箭头
        arrows(){
            var id=this.$route.params.umid;
            var j=this.$route.params.j;
            console.log(id);
            console.log(j);
            // console.log(this.did);
            this.$router.push(`/userdetailes/${j}/${id}/5`);
        }
    },
    created() {
        this.load();
    },

}
</script>

<style scoped>
   /* p标签样式 */
    p{
        margin: 5px;
    }
    .up{
        background: #eee;
    }
    /* 标题 */
    .title_box{
        display: flex;
        justify-content: space-between
    }
    .title{
        display: flex;
        align-items: center;
        padding-left: 10px;
    }
    /* 箭头 */
    .title>img{
        width: 30px;
    }
    /* 用户名 */
    .title>span{
        font-size: 24px;
        color: #333;
        font-weight: bolder;
        margin-left: 20px;
    }
    /* 右侧三点 */
    .point{
        width: 30px;
        height: 30px;
        margin-top: 10px;
    }
    /* 帖子 */
    .tiezi{
        display: flex;
        justify-content: space-around;
        margin-top: 20px;
    }
    /* 头像 */
    .tiezi>img{
        width: 80px;
        height: 80px;
        border-radius: 40px;
    }
    .tiezi div{
        display: flex;
        /* align-items: center; */
        flex-direction: column;
        margin-top: 15px;
    }
    .tiezi div span{
        font-size: 18px;
    }
    /* 数字 */
    .num{
        font-size: 24px;
        color: #333;
        font-weight: bolder;
    }
    /* 用户名 */
    .user{
        margin: 20px;
    }
    /* 按钮 */
    .btn{
        display: flex;
        justify-content: space-between;
    }
    /* 图片列表 */
    .img_box{
        margin-top: 10px;
    }
    .img_list{
        
        display: inline-block;
    }
    .img_list img{
        height: 80px;
        width: 117px;
        margin-left: 2px;
    }

    /* 弹窗 */
    .pop-up-box{
        position: absolute;
        z-index: 1;
        width: 360px;
        height: 660px;
        background: rgb(0, 0, 0,0.4);
    }
    .pop-up{
        position: absolute;
        z-index: 2;
        width: 130px;
        height: 180px;
        background: #fff;
        top: 220px;
        left: 100px;
        display: flex;
        flex-direction: column;
        padding-top: 30px;
        padding-left: 20px;
    }
</style>
