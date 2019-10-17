<template>
    <div id="suggestlistallmsg-2">
        <div class="suggestlistallmsg-2-nav">
            <div class="suggestlistallmsg-2-nav-1" >
                <span >{{suggest1}}</span>
            </div>
            <div class="suggestlistallmsg-2-nav-2" @click="liaison2">
                <span class="span-suggestlist-3">{{suggest2}}</span>
            </div>
        </div>
        <div id="addresslist">
            <img class="addresslistimg" :src="addresslistimg" />
            <div id="addresslist-h5">
                <h4>{{suggest3}}</h4>
                <h5>{{suggest4}}</h5>
            </div>
            <a href="javascript:;" class="addresslista" @click="connection">{{suggest5}}</a>
        </div>
        <div id="allsuggestlist">
            <h4>所有推荐</h4>
            <div id="suggest-msg-111" v-for="(item,i) of list" :key="i">
                <!-- 删除图片 -->
                <img class="suggestdel-1" 
                :src="suggestdelicon" 
                :data-id="item.uid"
                @click="deleterecommend"/>
                <!-- 头像图片 -->
                <img class="msgimg-1" :src="'http://127.0.0.1:3000/'+item.uheadurl" />
                <!-- 用户名字 -->
                <span class="msgname-1">{{item.uname}}</span>
                <!-- <a class="suggest-a" href="javascript:;" 
                :data-id="item.lid" 
                :data-attention="item.attention" 
                @click="attentions" >{{attentiontext}}</a> -->
                <a
                :data-id="item.uid"
                :data-phone="item.uphone"
                :data-email="item.uemail"
                :data-pwd="item.upwd"
                :data-name="item.uname"
                :data-sex="item.usex"
                :data-age="item.uage"
                :data-headurl="item.uheadurl"
                :data-attention="item.uattention"
                :data-attents="item.uattents"
                :data-address="item.uaddress"
                class="suggest-a-1" @click="attentions">
                    <!-- <span v-if="item.uattention">已关注</span>
                    <span v-else>关注</span> -->
                    {{attentionindex[item.uattention]}}
                </a>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data(){
        return{
            suggest1:"推荐",
            suggest2:"联系人",
            suggest3:"绑定通讯录",
            suggest4:"关注认识的用户",
            suggest5:"绑定",
            list:[],// 创建一个空数组，接收后台传回的所需用户的数据
            attentionindex:["关注","已关注"]
        }
    },
    methods: {
        loadmore(){
            // 请求服务器网址
            var url="cy";
            // 发送ajax请求获取数据
            this.axios.get(url).then(result=>{
                var list=result.data.data.result2;
                this.list=list;
            })
        },
        attentions(e){//判断是否已关注
            var id=e.target.dataset.id;
            var phone=e.target.dataset.phone;
            var email=e.target.dataset.email;
            var pwd=e.target.dataset.pwd;
            var name=e.target.dataset.name;
            var sex=e.target.dataset.sex;
            var age=e.target.dataset.age;
            var headurl=e.target.dataset.headurl;
            var attention=e.target.dataset.attention;
            var attents=e.target.dataset.attents;
            var address=e.target.dataset.address;
            attention=1;//修改默认关注的状态变为1
            // console.log(id,phone,email,pwd,name,sex,age,headurl,attention,attents,address);
            
            var url="SuggestListAllMsg";
            var obj={uid:id,uphone:phone,uemail:email,upwd:pwd,uname:name,usex:sex,uage:age,uheadurl:headurl,uattention:attention,uattents:attents,uaddress:address}
            this.axios.get(url,{params:obj}).then(result=>{
                // this.$messagebox("关注成功");
                this.loadmore();//调用loadmore函数，相当于加载页面
            })
        },
        deleterecommend(e){//删除点击事件在推荐表中的信息
            // var id=e.target.dataset.id;
            // console.log(id)
            // var url="cy";
            // var obj={uid:id}
            // this.axios.get(url,{params:obj}).then(result=>{
            //     // this.$messagebox("1","删除成功");
            //     this.loadmore();
            // })
            var div=e.target.parentNode;//获取点击事件的父元素
            div.style.display="none";//该元素隐藏
        }
    },
    props:{
        addresslistimg:{default:""},//通讯录图
        suggestdelicon:{default:""},//删除图
        liaison2:{type:Function},//联系人点击事件
        connection:{type:Function}
    },
    // 加载页面
    created(){
        this.loadmore();
    }
}
</script>

<style>
    #suggestlistallmsg-2{
        float: left;
        /* opacity: .2; */
    }
    .suggestlistallmsg-2-nav{
        position: relative;
        height:50px;
    }
    .suggestlistallmsg-2-nav-1,.suggestlistallmsg-2-nav-2{
        width:180px;
        height:50px;
        text-align: center;
        line-height: 50px;
        font-size: 16px;
        font-weight: 700;
        background: #f3f1f1;
    }
    .suggestlistallmsg-2-nav-1{
        position: absolute;
        border-bottom: 1px solid #000;
    }
    .suggestlistallmsg-2-nav-2{
        position: absolute;
        left:180px;
    }
    h5,h4{
        width:200px;
        margin: 1px 0;
    }
    #addresslist{
        position: relative;
        border-bottom: 1px solid #0000003d;
        width:359px;
        height:65px;
    }
    #addresslist-h5{
        position: absolute;
        width:30px;
        top:10px;
        left: 70px;;
    }
    .addresslistimg{
        position: absolute;
        top:13px;
        left: 24px;;
    }
    .addresslista{
        position: absolute;
        top:16px;
        left:260px;
        width:80px;
        height:30px;
        font-size: 16px;
        line-height: 30px;
        text-align: center;
        color: #fff;
        background:#038fff;
        border-radius: 3px;
    }
    #allsuggestlist{
        position: relative;
        padding:10px;
        min-height:400px;
    }
    /* 推荐网友信息 */
    #suggest-msg-111{
        position: relative;/*相对定位*/
        width:337px;
        height:80px;
        background: #fff;
        margin-top:15px;
        margin-bottom:10px;
        border-radius: 5px;
        border: 1px solid #0000003d;
    }
    /* 用户头像 */
    .msgimg-1{
        position: absolute;/*绝对定位*/
        top:10px;
        left:10px;;
        width:60px;
        height:60px;
        border-radius: 50%;/*画圆*/

    }
    /* 关注按钮样式 */
    .suggest-a-1{
        position: absolute;/*绝对定位*/
        top:25px;
        left:242px;
        width:55px;
        height:30px;
        border-radius: 3px;/*圆角*/
        background: #038fff;/*背景色*/
        text-align: center;/*文字水平居中*/
        font-size: 16px;/*字体大小*/
        line-height: 30px;/*行高*/
        color:#fff;/*字体颜色*/
    }
    /* 用户姓名 */
    .msgname-1{
        position: absolute;
        top:24px;
        left:86px;
        width:95px;;
        height:32px;
        padding: 2px;
        overflow: hidden;
        font-size: 12px;
    }
    /* 删除图片 */
    .suggestdel-1{
        position: absolute;
        top:6px;
        right:6px;
        width:16px;
        height:16px;
    }
</style>