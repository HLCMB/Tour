<template>
    <div id="chatfunction">
        <chatfunction1
        :chatfunctionicon="require('../../../../img/suggestlistallmsgquit.png')"
        :chatfunctionquit="chatfunctionquit"
        :chatfunctionvideo="require('../../../../img/video-icon.png')"
        :chatfunctionwrite="require('../../../../img/write-icon.png')"
        :searchiconimg="require('../../../../img/search-icon1.png')"
        :phonesearchicon="require('../../../../img/photo-icon.png')"
        ></chatfunction1>
    </div>
</template>

<script>
//引入子组件
import ChatFunction1 from "./ChatFunction-1"

export default {
    methods: {
        chatfunctionquit(){
            this.$router.push("/Cy");
        },
    },
    //注册子组件并且给子组起一个名字
    components:{
        // "字符串"：子组件对象名称
        "chatfunction1":ChatFunction1,//查找好友聊天组件
    },
}
</script>

<style>
    #chatfunction-nav{
        width:100%;
        height:60px;
        background: #f3f1f1;
    }
</style>