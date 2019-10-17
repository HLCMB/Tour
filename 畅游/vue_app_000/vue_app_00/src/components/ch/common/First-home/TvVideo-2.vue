<template>
    <div id="tvvideo-2">
        <div id="tvvideo-2-img">
            <div @click="tvvideoquit" v-show="loaddown" id="tvvideo-2-msg">
                <img src="../../../../img/tvvideoquit-icon.png" alt="">
            </div>
            <div @click="tvvideoimg" v-for="(item,i) of list" :key="i">
                <img class="tvvideo2-img" :src="'http://127.0.0.1:3000/' +item.uimgurl" alt="" />
                <img @click="tvvideoperson" :data-did="item.did" class="tvvideo-headimg" :src="'http://127.0.0.1:3000/' +item.uheadurl" alt="" />
            </div>
            
        </div>
        
    </div>
</template>

<script>
export default {
    data(){
        return{
            list:[],
            loaddown:false,
        }
    },
    methods: {
        loadmore(){
            // 获取地址栏上的传参值obj
            var obj=this.$route.params;
            // console.log(obj);
            //请求服务器网址
            var url="tvvideo2";
            //发送ajax请求获取数据
            this.axios.get(url,{params:obj}).then(result=>{
                var list=result.data.data;
                this.list=list;
            })
           
        },
        tvvideoimg(){
            this.loaddown=!this.loaddown
        },
        tvvideoquit(){
            this.$router.push("/Tv");
        },
        tvvideoperson(e){
            var did=e.target.dataset.did;
            this.$router.push("/TvVideo1/"+did);
        }
       
    }, 
    created(){//页面加载自动执行loadmore()
            this.loadmore();
    },
}
</script>

<style>
    #tvvideo-2-img{
        position: relative;
        height:653px;
    }
   
    #tvvideo-2-msg{
        position: absolute;
        z-index: 5;
        right:10px;
        top:10px;
    } 
    .tvvideo2-img{
        position: absolute;
        width:100%;
        height:653px;
        z-index: 1;
    }
    .tvvideo-headimg{
        position: absolute;
        top:10px;
        left:10px;
        z-index: 2;
        width:50px;
        height:50px;
        border-radius: 50%;
    }
</style>

