<template>
<div class="box">
    <div v-for="(item,j) of userlist" :key="j" @click="point">
        <!-- 三个点的弹窗 -->
        <div class="pop-up-box" style="display:none">
            <div class="pop-up">
                <p>举报...</p>
                <p>减少这类帖子</p>
                <p>复制链接...</p>
                <p>分享链接...</p>
            </div>
        </div>
        <div>
            <div class="title_box">
                <img @click="arrows"  src="../../../../assets/arrows.png" alt="" class="arrows">
                <h3 class="title">发现</h3>
            </div>
        <div class="detaile">
            <div class="head_box">
                <div class="head">
                    <img class="head" :src="'http://127.0.0.1:3000/'+item.uheadurl" alt="">
                    <div class="user_div">
                        <div>
                            <router-link :to="`user/${item.did}/${j}`"><span class="user">{{item.uname}} ·</span></router-link><span class="reccommend">关注</span>
                        </div>
                        <span class="address">{{item.uaddress}}</span>
                    </div>
                </div>
                
                <img class="point" :data-pid="item.ddid*1000" :id="item.ddid*1000" src="../../../../assets/point.png" alt="">
                
            </div>
            <img class="photo" :src="'http://127.0.0.1:3000/'+item.uimgurl" alt="">
            <div class="love"   @click="change">
                <div>
                    <div style="display:inline" >
                        <img :data-did="item.did" :id="item.did" src="../../../../assets/praise.png" alt="">
                        <img  style="display:none" src="../../../../assets/praised.png" alt=""  :data-ddid="item.ddid" :id="item.ddid">
                    </div>
                    <img src="../../../../assets/discuss.png" alt="">
                    <img src="../../../../assets/plain.png" alt="" style="height:30px;">
                </div>
                <div style="display:inline"  >
                    <img :data-did="item.did*10" :id="item.did*10" src="../../../../assets/label.png" alt="">
                        <img  style="display:none" src="../../../../assets/label2.png" alt=""  :data-ddid="item.ddid*10" :id="item.ddid*10">
                </div>
            </div>
            <p class="praise"><span>{{item.uattents}}次赞</span>
            </p>
            <p><router-link :to="`user/${item.did}/${i}`"><span class="user">{{item.uname}}</span></router-link> jidnfdffdijfjspa <span>更多</span></p>
            <p class="similar">2天前·你赞过相似的照片</p>
        </div>
        </div>
    </div>
    </div>
</template>


<script>
export default {
    data(){
        return{
            userlist:[],
        }
    },
    props:["uid","umid","i"],

    methods: {
        point(e){
            var pid=e.target.dataset.pid;
            var point=document.getElementById(pid);
            var pop=document.getElementsByClassName("pop-up-box")[0];
            if(e.target==point){
                pop.style.display="";
            }else{
                pop.style.display="none"
            }
        },
        //点赞功能
        change(e){
            var did=e.target.dataset.did;
            var ddid=e.target.dataset.ddid;
            var imgpraised1=document.getElementById(ddid);
            var imgpraise=document.getElementById(did);
            if(e.target==imgpraise){
                var imgpraised=imgpraise.nextSibling;
                imgpraise.style.display="none";
                imgpraised.style.display="inline-block";
            }else if(e.target==imgpraised1){
                var imgpraise=imgpraised1.previousSibling;
                imgpraised1.style.display="none";
                imgpraise.style.display="inline-block";
            }
            

            var did=(e.target.dataset.did);
            var ddid=(e.target.dataset.ddid);
            var imgpraised2=document.getElementById(ddid);
            var imgpraise2=document.getElementById(did);
            if(e.target==imgpraise2){
                var imgpraised3=imgpraise2.nextSibling;
                imgpraise2.style.display="none";
                imgpraised3.style.display="inline-block";
            }else if(e.target==imgpraised2){
                var imgpraise3=imgpraised1.previousSibling;
                imgpraised2.style.display="none";
                imgpraise3.style.display="inline-block";
            }
        },
        // 请求数据
        load(){
            var obj={uid:this.uid}
            this.axios("detailes",{params:obj}).then(res => {
            // console.log(this.umid);
            // console.log(res.data);
            this.userlist = res.data.slice(this.i);
      });
        },
        arrows(){
            if(this.uid==2){
            this.$router.push(`/shop`);
            }else if(this.uid==1){
            this.$router.push(`/food`);
            }
            else if(this.uid==4){
            this.$router.push(`/build`);
            }
            else if(this.uid==3){
            this.$router.push(`/houseandhome`);
            }
            else if(this.uid==5){
            this.$router.push(`/tour`);
            }
        },
    },
    created() {
        this.load();
    },
}
</script>

<style scoped>

    .box{
        position: relative;
    }
    /* p标签样式 */
    p{
        margin: 5px;
    }
    .head_box{
        display: flex;
        justify-content: space-between;
        position: relative;
    }
    .head{
        display: flex;
        align-items: center;
    }
    /* 顶部标题 */
    div.title_box{
        display: flex;
        justify-content: flex-start;
        background: #f3f1f1;
        align-items: center;
    }
    /* 箭头 */
    .arrows{
        width: 30px;
        height: 30px;
        margin-left: 5px;
    }
    /* 下部内容容器 */
    .detaile{
        margin-top: 20px;
    }
    /* 标题 */
    .title{
        font-size: 20px;
        margin: 10px;
    }
    /* 用户头像div */
    div.user_div{
        display: flex;
        flex-direction: column;
        margin-left: 10px;
    }
    /* 用户头像 */
    .head>img.head{
        width: 40px;
        height: 40px;
        border-radius: 40px;
    }
    /* 用户名 */
    .user{
        color: #333;
    }
    /* 关注 */
    .reccommend{
        color: #1296db;
        padding-left: 5px;
    }
    /* 地址 */
    .address{
        padding-right: 55px;;
    }
    /* 右侧点 */
    .point{
        float: right ;
        width: 20px;
        height: 20px;
        padding-top: 10px;
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
    /* 照片样式 */
    .photo{
        width: 100%;
        height: 250px;
    }
    .love{
        display: flex;
        justify-content: space-between;
    }
    /* 照片下部样式 */
    div.love img{
        width: 30px;
        margin-left: 10px;
    }
    /* 标签样式 */
    .label{
        float: right;
    }
    /* 点赞样式 */
    .praise,.user{
        font-weight: bolder;
    }
    /* 用户名 */
    p.user{
        margin: 0px;
    }
    /* 相似照片 */
    .similar{
        color: #666;
        font-size: 14px;
    }
    .similar>span{
        color: black;
        font-weight: bolder;
    }
    .hiden{
        display:none;
    }
</style>
