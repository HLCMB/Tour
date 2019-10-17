<template>
    <div id="photo">
        <photo1
        :quitimg="require('../../../../img/quit-icon.png')"
        :quit="quit"
        :photoInstall="photoInstall"
        ></photo1>
    </div>
</template>

<script>
// 引入子组件
import Photo1 from "./Photo-1.vue"//子组件

export default {
    props:{//接收 Home.vue 父组件数据
        
    },
    methods: {
        quit(){//点击返回主页面
            this.$router.push("/Cy");
        },
        photoInstall(e){
            // 阻止a标签默认行为
             e.preventDefault();
             this.$router.push("/PhoneInstall");
        }
    },
    //注册子组件并且给子组起一个名字
    components:{
        // "字符串"：子组件对象名称
        "photo1":Photo1
    }
}
</script>
