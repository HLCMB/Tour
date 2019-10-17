<template>
        <!-- 搜索用户顶部导航栏子组件 -->
        <div class="find_user_head" @click="arrows">
            <div class="up_head">
                <!-- 左侧图片与文字 -->
                <img :src="upImg" id="arrowsImg">
                <input class="search_input" type="text" placeholder="搜索">
            </div>
            <div class="down_head">
                <!-- 右侧图片与文字 -->
                <span @click="hotSearch">{{downHotSearch}}</span>
                <span @click="account">{{downAccount}}</span>
                <span @click="label">{{downLable}}</span>
                <span @click="place">{{downPlace}}</span>
            </div>
        </div>
</template>

<script>
export default {
    data(){
        return{}
    },
    // 接收父组件传来的数据
    props:{
        upImg:{default:""},
        upTitle:{default:""},
        downHotSearch:{default:""},
        downAccount:{default:""},
        downLable:{default:""},
        downPlace:{default:""},
    },
    methods: {
        arrows(e){
            var img=document.getElementById("arrowsImg");
            if(e.target==img){
                this.$router.push("/shop");
            }
        },
        hotSearch(){
            this.$router.push("hotsearch");

        },
        account(){
            this.$router.push("account");
        },
        label(){
            this.$router.push("label");
        },
        place(){
            this.$router.push("place");
        }
    },
}
</script>

<style scoped>
    /* 外层容器样式 */
    div.find_user_head{
        width: 100%;
        height: 100px;
        background: #eee;
    }
    /* 上部标题样式 */
    div.up_head{
        width: 100%;
        height: 50px;
        display: flex;
        align-items: center;
    }
    /* 搜索框样式 */
  .search_input{
    width: 200px;
    margin-left: 20px;
    height: 25px;
    border: 0px;
    padding-left: 5px;
  }
    /* 下面标题样式 */
    div.down_head{
        width: 100%;
        height: 50px;
        align-items: center;
        display: flex;
        justify-content: space-around;
        align-items: center;
        
    }
    /* 箭头 */
    div.up_head img{
        width: 30px;
        margin-right: 30px;
    }
    /* 下面标题样式 */
    div.down_head span{
        font-size: 20px;
        color: #ccc;
        font-weight: bolder;
    }

</style>
