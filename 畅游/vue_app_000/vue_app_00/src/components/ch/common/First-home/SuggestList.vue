<template>
    <div id="suggestlist">
        <suggestlistmsg
        :suggestdelicon="require('../../../../img/suggest-del-icon.png')"
        :suggestsell="suggestsell"
        ></suggestlistmsg>
        好友朋友圈
    </div>
</template>

<script>
//引入子组件
import SuggestListMsg from "./SuggestListMsg.vue"//推荐好友信息列表

export default {
    methods: {
        suggestsell(){
            this.$router.push("/SuggestListAllMsg");
        }
    },
    //注册子组件并且给子组起一个名字
    components:{
        // "字符串"：子组件对象名称
        "suggestlistmsg":SuggestListMsg,//推荐好友信息列表组件
    }
}
</script>

<style>
    
</style>