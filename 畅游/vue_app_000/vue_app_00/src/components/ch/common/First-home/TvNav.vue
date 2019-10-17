<template>
    <div id="tvnav">
        <div id="tv-nve" fixed>
           <img class="img-21" :src="quiticon" @click="quit1"/>
           <span class="span-21">IGTV</span>
           <img class="img-22" :src="searchicon" @click="searchmsg" />
           <img class="img-23" :src="joinicon" @click="addInstall" />
        </div>
    </div>
</template>

<script>
export default {
    props:{//接收 Tv.vue 父组件数据
        quiticon:{default:""},//退出图片样式 默认空字符串
        searchicon:{default:""},//搜所图片样式 默认空字符串
        joinicon:{default:""},//添加图片 默认空字符串
        quit1:{type:Function},//退出当前界面 函数
        addInstall:{type:Function},//添加视频和照片 函数
        searchmsg:{type:Function}//搜所查找信息 函数
    }
}
</script>

<style>
    #tvnav{
        position: fixed;
        width:355px;
        left: 10px;
        z-index: 999;
    }
    #tv-nve{
        background: #000;
        height:60px;
        width:100%;
    }
    .img-21{
        width:25px;
        height:25px;
        margin-top:15px;
        margin-left:5px;
    }
    .span-21{
        color:#fff;
        font-size: 20px;
        margin-left: 130px;
    }
    .img-22{
        width:25px;
        height:25px;
        margin-left:86px;
    }
    .img-23{
         width:25px;
        height:25px;
        margin-left:9px;
    }
</style>