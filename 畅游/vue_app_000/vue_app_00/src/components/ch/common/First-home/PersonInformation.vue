<template>
    <div id="personinformation">
        <div id="personinformation-nav" v-for="(item,i) of list" :key="i">
            <div id="personinformation-nav-top">
                <img :data-id="item.uid" @click="quitpersoninformation" src="../../../../img/suggestlistallmsgquit.png" alt="">
                <span>{{item.uname}}</span>
                <img @click="ellipsis" src="../../../../img/ellipsis-icon.png" alt="">
            </div>
            <div id="personinformation-nav-botttom">
                <img class="personinformation-headimg" :src="'http://127.0.0.1:3000/'+item.uheadurl" alt="">
                <div>
                    <span class="span-person">{{item.post}}</span>
                    <span class="span-person">帖子</span>
                </div>
                <div>
                    <span class="span-person">{{item.fans}}</span>
                    <span class="span-person">粉丝</span>
                </div>
                <div>
                    <span class="span-person">{{item.uattents}}</span>
                    <span class="span-person">已关注</span>
                </div>
            </div>
        </div>
        <personinformation1 fixed
        id="personinformation1"
        v-show="download"
        :quit="quit"
        ></personinformation1>
    </div>
</template>

<script>
//引入子组件
import PersonInformation1 from "./PersonInformation-1.vue"


export default {
    data(){
        return{
            list:[],
            download:false,
        }
    },
    methods: {
        loadmore(){
            // 获取地址栏上的传参值obj
            var obj=this.$route.params;
            // 请求服务器网址
            var url="personinformation";
            //发送ajax请求获取数据
            this.axios.get(url,{params:obj}).then(result=>{
                var list=result.data.data;
                this.list=list;
            })
           
        },
        quitpersoninformation(e){
            var id=e.target.dataset.id;
            this.$router.push('/ChatFunction4/'+id);
        },
        ellipsis(){
            this.download=!this.download;
            var id=document.getElementById("personinformation-nav");
            // var id=document.getElementById("personinformation1");
            // id.className="show";
            id.style="opacity: .2;"
        },
        quit(){
            this.download=!this.download;
            var id=document.getElementById("personinformation-nav");
            // var id=document.getElementById("personinformation1");
            // id.className="show";
            id.style="opacity: 1;"
        }
    },
    created(){//页面加载自动执行loadmore()
        this.loadmore();
    },
    //注册子组件并且给子组起一个名字
    components:{
        // "字符串"：子组件对象名称
        "personinformation1":PersonInformation1,//导航组件
    }
}
</script>

<style>
    #personinformation{
        background: #f3f1f1;
        padding: 10px;
    }
    .personinformation-headimg{
        width:80px;
        height:80px;
        border-radius: 50%;
    }
    #personinformation-nav-top,#personinformation-nav-botttom{
        display:flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 10px;
    }
    .span-person{
        display: block;
        text-align: center;
    }
</style>