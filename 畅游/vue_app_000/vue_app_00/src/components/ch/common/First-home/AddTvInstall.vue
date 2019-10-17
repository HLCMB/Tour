<template>
    <div id="addtvinstall">
        <div id="addtv-nav">
            <span class="span-tv-4" @click="addtvcancel">取消</span>
        </div>
        <div id="addtv-content">
            <span class="span-tv-1">请允许访问你的视频</span>
        <span class="span-tv-2">这会允许Instagram访问手机内容，让你把内容发布到你的视频</span>
        <a href="javascript:;"><span class="span-tv-3" @click="addinstall">允许</span></a>
        </div>
        
    </div>
</template>

<script>

export default {
    props:{//接收 AddTv.vue 父组件数据
        addinstall:{type:Function},//addinstall 函数
        addtvcancel:{type:Function}//addtvcancel 函数
    }    
}
</script>

<style>
    #addtv-nav{
        height:60px;
        background: #f3f1f1;
    }
    #addtv-content{
        margin-top:180px;
    }
    .span-tv-1,.span-tv-2,.span-tv-3{
        font-size:17px;
        display:block;
        text-align: center;
        margin-bottom:15px;
    }
    .span-tv-4{
        font-size: 20px;
        line-height: 60px;
        margin-left: 10px;
    }
</style>