<template>
    <div id="chatfunction-1">
        <!-- 聊天功能页面 -->
        <div id="chatfunction-nav">
            <img class="quiticonimg" :src="chatfunctionicon" @click="chatfunctionquit"/>
            <span class="chatfunctiontext">{{text1}}</span>
            <img class="videoiconimg" :src="chatfunctionvideo" />
            <img class="writeiconimg" :src="chatfunctionwrite" />
        </div>
        <!-- 搜索用户框 -->
        <div id="chatfunction-input">
            <input class="inputchatfunction" type="text" 
            :placeholder="placeholder" 
            @click="searchfriend"
            />
            <img class="searchiconimg" :src="searchiconimg" />
        </div>
        <!-- 已关注用户列表 -->
        <div id="allsuggestlist11">
            <h4>{{attentiontext}}</h4>
            <div id="suggest-msg-1" v-for="(item,i) of list" :key="i">
                <img class="phonesearch" :src="phonesearchicon" />
                <img class="msgimg-1" :src="'http://127.0.0.1:3000/'+item.uheadurl" />
                <span class="msgname-1">{{item.uname}}</span>
                <span 
                :data-id="item.uid"
                :data-name="item.uname"
                :data-headurl="item.uheadurl"
                @click="chatfriend" class="textchatfunction">{{text2}}</span>
            </div>
        </div>
    </div>
</template>

<script>

export default {
    data(){
        return{
            placeholder:"搜索",
            text1:"Direct",
            list:[],
            attentiontext:"已关注",
            text2:"轻触即可聊天",
        }
    },
    props:{//接收 ChatFunction.vue 父组件数据
        chatfunctionicon:{default:""},//退出图标
        chatfunctionquit:{type:Function},//退出返回上一界面函数
        chatfunctionvideo:{default:""},//进入视频聊天界面，
        chatfunctionwrite:{default:""},//进入聊天界面
        searchiconimg:{default:""},//搜索图片
        phonesearchicon:{default:""},//照相照片
    },
    methods: {
        loadmore(){
            // 请求服务器网址
            var url="ChatFunction";
            // 发送ajax请求获取数据
            this.axios.get(url).then(result=>{
                var list=result.data.data;
                this.list=list;
            })
        },
        searchfriend(e){
            this.$router.push("/ChatFunction2")
        },
        chatfriend(e){
            //获取点击事件的id值
            var id=e.target.dataset.id;
            //跳转到另一页面，地址栏的uid参数为自己设置参数
            this.$router.push('/ChatFunction4/'+id);//地址栏返回的值 obj=this.$route.params ==> uid:id uid==> 为router.js中{path:"/ChatFunction4/:uid1",component:ChatFunction4} 的uid,
        }
    },
    // 加载页面
    created(){
        this.loadmore();
    }
}
</script>

<style>
    #chatfunction-nav{
        position: relative;
        width:100%;
        height:60px;
        background: #f3f1f1;  
    }
    .quiticonimg,.videoiconimg,.writeiconimg,.chatfunctiontext{
        position: absolute;
    }
    .quiticonimg{
        top:14px;
        left:5px;
    }
    .videoiconimg{
        top:14px;
        right:60px;
    }
    .writeiconimg{
        top:14px;
        right:10px;
        width:30px;
        height:30px;
    }
    .chatfunctiontext{
        left:150px;
        font-size: 20px;
        line-height: 60px;
        font-weight: 600;
    }
    .inputchatfunction{
        width:90%;
        margin:10px 0 0 18px;
        height:38px;
        padding:3px 0 3px 30px;
        box-sizing: border-box;
        border-radius: 5px;
        outline: none;
        background: #f3f1f1;
        font-size: 16px;
    }
    .searchiconimg{
        display: block;
        margin:-27px 0 0 29px;
    }
    #chatfunction-input{
        height:60px;
    }
    #allsuggestlist11{
        position: relative;
        top:10px;
        padding:10px;
    }
    /* 推荐网友信息 */
    #suggest-msg-1{
        position: relative;/*相对定位*/
        width:99%;
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
        width:140px;
        height:20px;
        line-height: 20px;
        padding: 2px;
        overflow: hidden;
        font-size: 12px;
    }
    /* 删除图片 */
    .phonesearch{
        position: absolute;
        top:24px;
        right:24px;
        width:32px;
        height:32px;
    }
    .textchatfunction{
        position: absolute;
        font-size: 12px;
        top:50px;
        left:85px;
    }
</style>