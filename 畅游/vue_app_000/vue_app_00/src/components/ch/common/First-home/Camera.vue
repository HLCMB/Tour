<template>
    <div id="camera">
        <camera1
        :camerasetupicon="require('../../../../img/camera-setup-icon.png')"
        :cameraquiticon="require('../../../../img/quit-icon.png')"
        :cameraphotoicon="require('../../../../img/camera-photo-icon.png')"
        :cameralighticon="require('../../../../img/camera-light-icon.png')"
        :cameracentericon="require('../../../../img/camera-center-icon.png')"
        :cameraturnicon="require('../../../../img/camera-turn-icon.png')"
        :camerapictureicon="require('../../../../img/camera-picture-icon.png')"
        :cameraquit="cameraquit"
        ></camera1>
    </div>
</template>

<script>
//引入子组件
import Camera1 from "./Camera-1"

export default {
    //集中存放事件处理函数
    methods: {
        cameraquit(){
            this.$router.push("Cy");
        }
    },
    //注册子组件并且给子组起一个名字
    components:{
        // "字符串"：子组件对象名称
        "camera1":Camera1
    }
}
</script>

<style>
    
</style>