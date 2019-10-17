<template>
    <div id="search">
        <searchnav
        :searchicon="require('../../../../img/search-icon1.png')"
        :searchquit="searchquit"
        ></searchnav>
        <searchlikemsg
        
        ></searchlikemsg>
    </div>
</template>

<script>
// 引入子组件
import SearchNav from "./Search-1.vue"//搜索查询子组件
import SearchLikeMsg from "./Search-2.vue"//信息列表子组件

export default {
    methods: {
        searchquit(){
            this.$router.push("/Tv")
        }
    },
    //注册子组件并且给子组起一个名字
    components:{
        // "字符串"：子组件对象名称
        "searchnav":SearchNav,
        "searchlikemsg":SearchLikeMsg
    }
}
</script>

<style>
    
</style>