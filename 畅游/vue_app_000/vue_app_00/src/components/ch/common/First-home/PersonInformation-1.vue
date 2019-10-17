<template>
    <div id="personinformation-1">
        <ul>
            <li>拉黑</li>
            <li>举报</li>
            <li>账户简介</li>
            <li>隐藏快拍</li>
            <li>复制主页网址</li>
            <li>分享主页</li>
        </ul>
        <ul>
            <li @click="quit">取消</li>
        </ul>
    </div>
</template>

<script>
//引入子组件

export default {
    props:{
        quit:{type:Function},
    }
}
</script>

<style>
    ul{
        list-style: none;
        text-align: center;
        border-radius: 15px;
        background: #fff;
        padding: 0;
    }
    ul>li{
        border-bottom:1px solid #00000038;
        height:40px;
        line-height: 40px;
        color:#00f;
        font-size: 17px;
    }
    ul>li:last-child{
        border-bottom: 0px solid #00000047;
    }
    ul>li:first-child,ul>li:nth-child(2){
        color:#f00;
    }
</style>