<template>
    <div id="tvvideo">
        <div  id="tvvideo-1" v-for="(item,i) of list" :key="i">
            <img :data-did="item.did" @click="tvvideouser" class="video-img" :src="'http://127.0.0.1:3000/'+item.uimgurl"/>
            <img class="video-headimg" :src="'http://127.0.0.1:3000/'+item.uheadurl"/>
        </div>
    </div>
</template>

<script>

export default {
    data() {
        return {
            list:[],
        }
    },
    methods: {
        loadmore(){
            var url="video";
            this.axios.get(url).then(result=>{
                var list=result.data.data;
                this.list=list;
                // console.log(list)
            })
        },
        tvvideouser(e){
            var did=e.target.dataset.did;
            this.$router.push("/TvVideo2/"+did);
        }
    },
     // 自动加载页面
    created(){
        this.loadmore();
    }
}
</script>

<style>
    #tvvideo{
        position: relative;
        top:61px;
        display: flex;
        justify-content: space-around;
        flex-wrap: wrap;
    }
    #tvvideo>#tvvideo-1:first-child{
        width:99%;
        height:360px;
    }
    #tvvideo-1{
        position: relative;
        width:49%;
        height: 200px;
        border:1px solid #fff;
    }
    .video-img{
        width:100%;
        height:100%;
    }
    .video-headimg{
        position: absolute;
        bottom:10px;
        left:10px;
        width:40px;
        height:40px;
        border-radius: 50%;
        z-index: 1;
    }
</style>