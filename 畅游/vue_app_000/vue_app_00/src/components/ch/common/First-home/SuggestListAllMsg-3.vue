<template>
    <div id="suggestlistallmsg-3">
        <div class="suggestlistallmsg-3-nav">
            <div class="suggestlistallmsg-3-nav-1" @click="liaison3">
                <span class="span-suggestlist-3">{{suggest1}}</span>
            </div>
            <div class="suggestlistallmsg-3-nav-2">
                <span class="span-suggestlist-4">{{suggest2}}</span>
            </div>
        </div>
        <div class="suggestlistallmsg-3-content">
            <img :src="addresslistimg1">
            <span class="span-suggestlist-1">{{suggest3}}</span>
            <span class="span-suggestlist-2">{{suggest4}}</span>
            <a class="mt-button-suggestlist" href="javascript:;">{{suggest5}}</a>
        </div>
    </div>
</template>

<script>
export default {
    data(){
        return{
            suggest1:"推荐",
            suggest2:"联系人",
            suggest3:"绑定通讯率",
            suggest4:"查找你在 Instagram 认识的用户并选择关注",
            suggest5:"绑定通讯录"
        }
    },
    methods: {
        
    },
    props:{
        addresslistimg1:{default:""},//通讯录图
        liaison3:{type:Function}//推荐点击事件
    }
    
}
</script>

<style>
    .suggestlistallmsg-3-nav{
        position: relative;
    }
    .suggestlistallmsg-3-nav-1,.suggestlistallmsg-3-nav-2{
        width:180px;
        height:50px;
        text-align: center;
        line-height: 50px;
        font-size: 16px;
        font-weight: 700;
        background: #f3f1f1;
    }
    .suggestlistallmsg-3-nav-2{
        position: absolute;
        left:180px;
        top:0px;
        border-bottom: 1px solid #000;
    }
    .suggestlistallmsg-3-content{
        text-align: center;
        margin-top: 125px;
    }
    .span-suggestlist-1,.span-suggestlist-2{
        display: block;
        font-size: 25px;
        margin-top: 20px;
    }
    .span-suggestlist-2{
        font-size: 14px;
        margin-bottom: 20px;
    }
    .span-suggestlist-3{
        color:#0009;
    }
    .mt-button-suggestlist{
        display: block;
        margin:0 auto;
        background: #038fff;
        color: #fff;
        width:100%;
        height:50px;
        line-height: 50px;
        border-radius: 5px;
        font-size: 16px;
    }
</style>
