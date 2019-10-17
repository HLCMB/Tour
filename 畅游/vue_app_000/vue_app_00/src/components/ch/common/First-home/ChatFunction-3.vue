<template>
    <div id="chatfuncton2">
        <div id="chatfuncton2-1">
            <div id="chatfunction-input">
                <input class="inputchatfunction" type="text" 
                :placeholder="placeholder" 
                v-model="kwords"
                />
                <img class="searchiconimg" :src="searchiconimg" />
                <img v-show="download" class="searchdel" :src="searchdel" @click="searchdelicon"/>
            </div>
            <span class="chatfunction2span" @click="quitchatfunction2">取消</span>
        </div>
        <div id="chatfuncton2-2">
            <div id="suggest-msg-1" v-for="(item,i) of list" :key="i">
                <img class="phonesearch" :src="phonesearchicon" />
                <img class="msgimg-1" :src="'http://127.0.0.1:3000/'+item.uheadurl" />
                <span class="msgname-1">{{item.uname}}</span>
                <span :data-id="item.uid" @click="chatfriend" class="textchatfunction">{{text1}}</span>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data(){
        return{
             placeholder:"搜索",
             list:[],
             kwords:"",//自动添加了kwords()来监视kwords的变化
             download:false,
             text1:"轻触即可聊天"
        }
    },
    props:{
        searchiconimg:{default:""},
        quitchatfunction2:{type:Function},
        phonesearchicon:{default:""},
        searchdel:{default:""}
    },
    methods: {
        searchfriend(){//获取搜索框中输入的信息
            // 当输入内容后，删除照隐藏消除，
            this.download=!this.download;
            //  console.log(`查找 ${this.kwords} 相关的内容...`)
            var uname=this.kwords;
            // console.log(uname);
            //获取到名字信息后，通过名字在已关注用户列表中搜索相应的用户
            var url="ChatFunction2";
            var obj={uname:uname};
            this.axios.get(url,{params:obj}).then(result=>{
                if(result.data.data.length==0){
                    this.$messagebox("搜查结果","该用户不存在");
                }else{
                    var list=result.data.data;
                    this.list=list;
                }
            })
        },
        searchdelicon(){//当点击x删除后，搜索内容为空，则删除照隐藏
            this.kwords="";
        },
        chatfriend(e){//获取点击事件的id值
            var id=e.target.dataset.id;
            // var obj={uid:id};
            //路由隐藏传参
            this.$router.push('/ChatFunction4/'+id);
        }
    },
    watch:{
        //只要同名的变量的值发生了变化，就会自动触发监视函数。
        kwords(){
            //每次输入时，做的事儿和按下回车时，和点击查询按钮时，做的事儿都是一样！
            this.searchfriend();
            //this->凡是new Vue()中的this，都指new Vue()本身
            //为什么watch中的kwords()可通过this.search()调用methods中的search()方法？
            //因为不管写在哪里，最后都被升级为直接隶属于new Vue()，所以其实kwords()searchfriend()是平级的兄弟方法！
        }
    }
}
</script>

<style>
    #chatfuncton2-1{
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    #chatfunction-input{
        width:80%;
    }
    .inputchatfunction{
        width:100%;
    }
    .chatfunction2span{
        margin-right: 15px;
    }
    .searchdel{
        display: block;
        margin:-16px 0 0 279px;
    }
</style>