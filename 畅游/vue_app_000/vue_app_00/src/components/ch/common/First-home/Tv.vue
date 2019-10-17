<template>
    <div id="tv">
        <!-- 导航栏组件 -->
        <tv-nav
        :quiticon="require('../../../../img/quit-icon1.png')"
        :searchicon="require('../../../../img/search-icon.png')"
        :joinicon="require('../../../../img/join-icon1.png')"
        :quit1="quit1"
        :addInstall="addInstall"
        :searchmsg="searchmsg"
        ></tv-nav>
        <!-- 视频组件 -->
        <tvvideo
        
        ></tvvideo>
    </div>
</template>

<script>
// 引入子组件
import TvNav from "./TvNav.vue"
import TvVideo from "./TvVideo.vue"

export default {
    //集中存放事件处理函数
    methods:{
        quit1(){
            this.$router.push("/cy");
        },
        addInstall(){
            this.$router.push("/AddTv");
        },
        searchmsg(){
            this.$router.push("/Search");
        }
    },
    //注册子组件并且给子组起一个名字
    components:{
        // "字符串"：子组件对象名称
        "tv-nav":TvNav,
        "tvvideo":TvVideo
    }
}
</script>
