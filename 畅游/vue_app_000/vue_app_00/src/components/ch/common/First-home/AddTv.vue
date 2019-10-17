<template>
    <div id="addtv">
        <addtvinstall
        :addinstall="addinstall"
        :addtvcancel="addtvcancel"
        ></addtvinstall>
    </div>
</template>

<script>
//引入子组件
import AddTvInstall from "./AddTvInstall"
export default {
    //集中存放事件处理函数
    methods:{
        addinstall(){//允许设置并进入到下一界面
            this.$messagebox("","执行成功");
            this.$router.push("/AddTv-1");
        },
        addtvcancel(){//返回上一界面
            this.$router.push("/Tv");
        }
    },
    //注册子组件并且给子组起一个名字
    components:{
        // "字符串"：子组件对象名称
        "addtvinstall":AddTvInstall
    }
}
</script>