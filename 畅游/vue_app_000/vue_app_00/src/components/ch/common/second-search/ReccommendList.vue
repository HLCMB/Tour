<template>
    <div>
        <!-- 推荐用户列表子组件 -->
        <span class="reccommend">推荐</span>
        <div class="find_user_list" v-for="(item,i) of searchList" :key="i">
            <div class="user_list">
                <img :src="'http://127.0.0.1:3000/'+item.uheadurl" alt="">
                <div class="user">
                <h3>{{item.uname}}</h3>
                <span>{{item.nickname}}</span>
                </div>
            </div>
                <span class="del" @click="del">×</span>
        </div>
    </div>
    
</template>

<script>
export default {
    data(){
        return{
            searchList:[],
        }
    },
    // 接收父组件传来的数据
    props:{
        userListImg:{default:""},
        user:{default:""},
        nickname:{default:""},
    },
    methods: {
        // 删除数据
        del(e){
            var div=e.target.parentNode;
            div.style.display="none";
        },
        // 加载数据
        load(){
            this.axios("cy").then(res => {
        // console.log(res);
        this.searchList = res.data.data.result2;
        // console.log(this.searchList);
      });
        }
    },
    created() {
        this.load();
    },
}
</script>

<style scoped>
    /* 推荐文字 */
    span.reccommend{
        color: #666;
        display: inline-block;
        margin: 5px 15px;
    }
    /* 外层容器样式 */
    div.find_user_list{
        /* float: left; */
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .user{
        display: flex;
        flex-direction: column;
    }
    /* 内层容器样式 */
    div.user_list{
        display: flex;
        align-items: center;
    }
    /* h3 */
    div.find_user_list h3{
        margin: 0;
        display: inline-block;
    }
    /* 头像样式 */
    div.find_user_list img{
        width: 70px;
        height: 70px;
        border-radius: 35px;
        margin: 10px;
    }
    /* 叉的样式 */
    .del{
        color: #666;
        font-size: 20px;
        font-weight: bolder;
        padding-right: 10px;
        
    }
</style>
