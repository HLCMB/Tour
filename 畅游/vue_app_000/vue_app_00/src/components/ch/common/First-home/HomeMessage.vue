<template>
    <div>
        <div id="head-1" fixed>
            <img :src="photoiconImg" class="photoimgstyle" @click="photoimg"/>
            <span class="span-1">Instagram</span>
            <img :src="tviconImg" class="tvimgstyle" @click="tvimg"/>
            <img :src="sendiconImg" class="sendimgstyle" @click="sendimg"/>
        </div>
        <div id="head-2" @click="myphotos">
            <img :src="headiconImg" class="headimgstyle"/>
            <img :src="joiniconImg" class="joinimgstyle"/>
            <span class="span-2">你的快拍</span>
        </div>
    </div>
</template>

<script>
export default {
    props:{//接收 Home.vue 父组件数据
        headiconImg:{default:""},//headiconImg 默认空字符串
        joiniconImg:{default:""},//joiniconImg 默认空字符串
        photoiconImg:{default:""},//photoiconImg 默认空字符串
        tviconImg:{default:""},//tviconImg 默认空字符串
        sendiconImg:{default:""},//sendiconImg 默认空字符串
        photoimg:{type:Function},//进入相机界面 
        tvimg:{type:Function},//函数
        myphotos:{type:Function},//进入相机界面
        sendimg:{type:Function},//进入搜索好友聊天页面
    },
    
}
</script>

<style>
    #head-1{
        position: relative;/*相对定位*/
        height:60px;
        background: #f3f1f1;
    }
    #head-2{
        position: relative;
        height:80px;
        padding: 10px;
        display: inline-block;/*变为行内块*/
    }
    .photoimgstyle{
        position: absolute;
        top:14px;
        left:10px;
    }
    .headimgstyle{
        width:50px;
        height:50px;
    }
    .joinimgstyle{
        position: absolute;
        top:44px;
        left:52px;
    }
    .span-1{
        position: absolute;
        top:10px;
        left:119px;
        font-size:25px;
    }
    .span-2{
        position: absolute;
        display: block;
        font-size: 13px;
    }
    .tvimgstyle{
        position: absolute;
        top:14px;
        right:50px;
    }
    .sendimgstyle{
        position: absolute;
        top:14px;
        right:10px;
    }
</style>