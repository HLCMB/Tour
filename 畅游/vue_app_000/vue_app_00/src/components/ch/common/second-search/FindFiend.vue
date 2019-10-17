<template>
    <div id="suggestlistallmsg">
        <suggestlistallmsg1
        :suggestlistallmsgquit="require('../../../../img/suggestlistallmsgquit.png')"
        :suggestquit="suggestquit"
        ></suggestlistallmsg1>
    </div>
</template>

<script>
// 引入子组件
import SuggestListAllMsg1 from "../First-home/SuggestListAllMsg-1"

export default {
    props:["num"],
    methods: {
        suggestquit(){
            if(this.num==1){
                this.$router.push("/tour");
            }else if(this.num==2){
                this.$router.push("/shop");
            }else if(this.num==3){
                this.$router.push("/houseandhome");
            }else if(this.num==4){
                this.$router.push("/build");
            }else if(this.num==5){
                this.$router.push("/food");
            }
                
        }
    },
    //注册子组件并且给子组起一个名字
    components:{
        // "字符串"：子组件对象名称
        "suggestlistallmsg1":SuggestListAllMsg1,//推荐网友主列表导航栏组件
    }
}
</script>

<style>
    #suggestlistallmsg{
        margin-bottom: 0px;
    }
</style>