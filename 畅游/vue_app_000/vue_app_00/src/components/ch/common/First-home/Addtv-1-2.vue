<template>
    <div id="addtv-1-2">
        <!-- 搜集所有的视频 -->
        <div id="addtv-1-2-tvs" @click="addtv12tvs">
            <div id="tvs-1-2">
                
            </div>
            <div id="tvs-content-1-2">
                <h3>视频</h3>
                <h4>4</h4>
            </div>
        </div>
        <!-- 搜集所有的照片 -->
        <div id="addtv-1-2-photos" @click="addtv12photos">
            <div id="photos-1-2">

            </div>
            <div id="photos-content-1-2">
                <h3>所有照片</h3>
                <h4>4</h4>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    props:{//接收 Addtv-1-1.vue 父组件数据
        addtv12tvs:{type:Function},//addtv12tvs 默认空字符串
        addtv12photos:{type:Function}
    }
}
</script>

<style>
    #addtv-1-2-tvs,#addtv-1-2-photos{
        display: flex;
    }
    #tvs-1-2,#photos-1-2{
        width:120px;
        height:120px;
        background: #000;
        margin-bottom: 3px;
        margin-right:10px;
    }
</style>