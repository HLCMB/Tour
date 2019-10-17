<template>
    <div id="camera-1">
        <div id="camera-bg">
            <!-- 顶部照片 -->
            <div id="camera-top">
                <!-- 左侧设置按钮图 -->
                <img class="camera-setup-icon" :src="camerasetupicon" />
                <!-- 右侧退出按钮图 -->
                <img class="camera-quit-icon" :src="cameraquiticon" @click="cameraquit"/>
            </div>
            <!-- 底部照片 -->
            <div id="camera-bottom">
                <!-- 左侧1进入相册按钮图 -->
                <img class="camera-photo-icon" :src="cameraphotoicon" />
                <!-- 左侧2设置闪光按钮图 -->
                <img class="camera-light-icon" :src="cameralighticon" />
                <!-- 中间摄像按钮图 -->
                <img class="camera-center-icon" :src="cameracentericon" />
                <!-- 右侧2翻转摄像头按钮图 -->
                <img class="camera-turn-icon" :src="cameraturnicon" />
                <!-- 右侧1添加动态图按钮图 -->
                <img class="camera-picture-icon" :src="camerapictureicon" />
            </div>
        </div>
    </div>
</template>

<script>
export default {
    props:{//接收 Camera.vue 父组件数据
        cameraquiticon:{default:""},//退出相机图
        camerasetupicon:{default:""},//相机设置图
        cameraphotoicon:{default:""},//进入相册图
        cameralighticon:{default:""},//闪光模式图
        cameracentericon:{default:""},//摄像图
        cameraturnicon:{default:""},//翻转摄像头图
        camerapictureicon:{default:""},//添加动态图
        cameraquit:{type:Function},//退出相机功能
        
    }
}
</script>

<style>
    #camera-bg{
        position: relative;/*相对定位*/
        background: #000;/*背景色*/
        height:600px;
    }
    #camera-top,#camera-bottom{
        display: flex;/*弹性容器*/
        justify-content: space-between;/*项目在主轴上的对齐方式*/
        padding: 15px 10px;/*内边距*/
        opacity: .6;/*透明度*/
    }
    #camera-bottom{
        margin-top:440px;/*上边距*/
        align-items: center;/*项目在交叉轴的居中对齐方式*/
    }
    .camera-setup-icon{
        width:32px;
        height:32px;
        margin-top:10px;
    }
    .camera-photo-icon,.camera-light-icon,.camera-turn-icon,.camera-picture-icon{
        width:32px;
        height:32px;
    }
</style>