<template>
    <div id="connetcionaddress">
        <div id="connetcionaddress-content">
            <div id="connectionimg">
                <img class="connectionimg1" :src="connectionicon1" />
                <img class="connectionimg2" :src="connectionicon2" />   
                <img class="connectionimg3" :src="connectionicon3" />
            </div>
            <div id="connetcionaddress-text">
                <span class="connection-span-1">{{text1}}</span>
                <span class="connection-span-2">{{text2}}</span>
                <a @click="routerlink11" class="router-link1" href="javascript:;">{{text3}}</a>
                <a @click="routerlink22" class="router-link2" href="javascript:;">{{text4}}</a>
                <a @click="routerlink33"  class="router-link3" href="javascript:;">{{text5}}</a>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data(){
        return{
            text1:"查找用户并关注",
            text2:"为帮助用户在 Instagram 建立联系，你的通讯录将定期同步并储存到我们的服务器上。你可以从中选择想要关注的对象，也可以随时停止同步。",
            text3:"详细了解",
            text4:"允许访问",
            text5:"以后再说"
        }
    },
    props:{//接收 SuggestListMsg-1.vue 父组件数据
        connectionicon1:{default:""},
        connectionicon2:{default:""},
        connectionicon3:{default:""},
        routerlink11:{type:Function},
        routerlink22:{type:Function},
        routerlink33:{type:Function}
    },
    methods: {
        
    },
}
</script>

<style>
    /* 背景样式 */
    #connetcionaddress{
        position: relative;
        top:200px;
        width:375px;
        height:667px;
    }
    #connetcionaddress-content{
        position: absolute;
        top:195px;
        left:53px;
        z-index: 999;
        background: #fff;
        width:251px;
        height:315px;
        border-radius: 15px;
        border:1px solid #00000059;
    }
    /* 三张照片的样式 */
    .connectionimg1,.connectionimg2,.connectionimg3{
        position: absolute;
    }
    .connectionimg1{
        top:20px;
        left:94px;
        z-index: 3;
    }
    .connectionimg2{
        top:36px;
        left:60px;
    }
    .connectionimg3{
        top:36px;
        left:143px;
    }
    /* 文字部分 */
    #connetcionaddress-text{
        position: relative;/*相对定位*/
        padding: 10px;
    }
    .connection-span-1,.connection-span-2,.router-link1,.router-link2,.router-link3{
        position: absolute;/*绝对定位*/
    }
    .connection-span-1{
        font-size: 23px;
        top:96px;
        left: 45px;
    }
    .connection-span-2{
        width: 80%;
        top:132px;
        left:25px;
        text-align: center;
        font-size: 12px;
        opacity: .7;/*透明度*/
    }
    .router-link1{
        top:203px;
        left: 102px;
        font-size: 12px;
    }
    .router-link2{
        width:100%;
        border-top:1px solid #00000059;
        border-bottom: 1px solid #00000059;
        padding: 8px 0;
        top:235px;
        left:0;
        font-size: 16px;
        text-align: center;
    }
    .router-link3{
        top:282px;
        left: 93px;
        font-size: 16px;
    }
</style>