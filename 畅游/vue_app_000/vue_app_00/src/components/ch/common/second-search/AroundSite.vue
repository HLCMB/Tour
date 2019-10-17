<template>
    <div>
        <div class="title" @click="arrows">
            <img id="arrows" src="../../../../assets/arrows.png" alt="">
            <span>周边地点</span>
        </div>
        <div class="place_list" v-for="(item,i) of place" :key="i">
            <img src="../../../../assets/place.png" alt="">
            <div class="place">
                <span>{{item.site}}</span>
                <span>{{item.sites}}</span>
            </div>
        </div>
    </div>
</template>


<script>
export default {
    data(){
            return{
                place:[]
            }
        },
    methods: {
        arrows(e){
            var img=document.getElementById("arrows");
            if(e.target===img){
                this.$router.push("/place");
            }
        },
        load(){
            this.axios("place").then(res=>{
                this.place=res.data;
            })
        },
    },
    
    created() {
        this.load();
    },
}
</script>

<style scoped>
    /* 标题 */
    .title{
        background: #eee;
        width: 100%;
        height: 50px;
        display: flex;
        align-items: center;
        padding: 10px;
    }
    /* 箭头 */
    .title img{
        width: 30px;
        height: 30px;
    }
    /* 标题 */
    .title span{
        color: #333;
        font-size: 24px;
        margin-left: 10px;
        font-weight: bolder;
    }
    /* 下部列表 */
    .place_list{
        display: flex;
        justify-content: flex-start;
        margin-top: 20px;
        padding-left: 10px;
    }
    /* 图片 */
    .place_list img{
        width: 50px;
        height: 50px;
    }
    /* 文字 */
    .place{
        display: flex;
        flex-direction: column;
        margin-left: 30px;
    }
</style>
