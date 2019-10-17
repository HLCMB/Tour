<template>
    <div id="addtv-1">
        <addtv11
        :addtv11downimg="require('../../../../img/down-icon.png')"
        :addtv11upimg="require('../../../../img/up-icon.png')"
        :addtvquit="addtvquit"
        ></addtv11>
    </div>
</template>

<script>
// 引入子组件
import AddTv11 from "./AddTv-1-1"

export default {
    data(){
        return{
            
        }
    },
    methods: {
        addtvquit(){
            this.$router.push("/Tv")
        }
    },
    //注册子组件并且给子组起一个名字
    components:{
        // "字符串"：子组件对象名称
        "addtv11":AddTv11
    }
}
</script>

<style>
    
</style>