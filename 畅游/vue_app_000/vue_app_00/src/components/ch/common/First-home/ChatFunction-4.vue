<template>
    <div id="chatfunction4">
        <div id="chatfunction4-nav">
            <chatfunction5 
            class="quiticonimg-4"
            :quitchatfunctionicon="require('../../../../img/suggestlistallmsgquit.png')"
            :quitchatfunction5="quitchatfunction5"
            ></chatfunction5>
            <div id="chatfunction4-nav-4" v-for="(item,i) of list" :key="i">
                <img :data-id="item.uid" @click="personinformation" class="headerimgicon" :src="'http://127.0.0.1:3000/'+item.uheadurl">
                <span :data-id="item.uid" @click="personinformation" class="spanuname">{{item.uname}}</span>
                <img class="videoiconimg1" src="../../../../img/video-icon.png" />
                <img class="writeiconimg1" src="../../../../img/write-icon.png" />

            </div>
            
        </div>
        <div>
            <input class="bottom-send-msg" type="text" :placeholder="placeholder" fixed>
        </div>
    </div>
</template>

<script>
//引入子组件
import ChatFunction5 from "./ChatFunction-5.vue"

export default {
    data(){
        return{
            list:[],
            placeholder:"发消息...",
        }
    },
    methods: {
        loadmore(){
            // 获取地址栏中上一页面传的参值uid
            var obj=this.$route.params;
            // 请求服务器网址
            var url="ChatFunction4";
            //发送ajax请求获取数据
            this.axios.get(url,{params:obj}).then(result=>{
                var list=result.data.data;
                this.list=list;
                // console.log(list);
            })
           
        },
        quitchatfunction5(){
            this.$router.push("/ChatFunction")
        },
        personinformation(e){
            var id=e.target.dataset.id;
            this.$router.push('/PersonInformation/'+id);
        }
    },
    created(){//页面加载自动执行loadmore()
        this.loadmore();
    },
     //注册子组件并且给子组起一个名字
    components:{
        // "字符串"：子组件对象名称
        "chatfunction5":ChatFunction5,//底部导航栏组件
    }
}
</script>

<style>
    #chatfunction4-nav{
        display: flex;
        align-items: center;
        height:60px;
        background: #f3f1f1;
    }
    .quitimgicon{
        width:32px;
        height:32px;

        
    }
    .headerimgicon{
        width:45px;
        height:45px;
        border-radius: 50%;
        margin-right:10px;
    }
    .quiticonimg-4{
        width:10%;
    }
    #chatfunction4-nav-4{
        display: flex;
        /* justify-content: space-around; */
        align-items: center;
        width:90%;
    }
    .spanuname{
        width:90px;
        margin:0 100px 0 0;
    }
    .videoiconimg1{
        margin:0 20px 0 -17px;
    }
    .writeiconimg1{
        width:30px;
        height:30px;
        margin-top:1px;
    }
    .bottom-send-msg{
        margin-top:540px;;
        border-radius: 30px;
        width:100%;
        height:40px;
        font-size: 16px;
        padding-left:35px;
        box-sizing: border-box;
        outline: none;
    }
</style>