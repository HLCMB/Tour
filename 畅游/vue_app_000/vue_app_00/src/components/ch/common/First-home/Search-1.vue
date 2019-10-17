<template>
    <div id="search-nav">
        <div id="search-nav-1">
            <div id="search-1">
            <img class="img-search-1" :src="searchicon"/>
            <input class="input-search-1" type="text" :placeholder="placeholder" />
            <span class="span-search-1" @click="searchquit">取消</span>
            <span class="span-search-2">猜你喜欢</span>
        </div>
        </div>
    </div>
</template>

<script>
export default {
    data(){
        return{
            placeholder:"搜索 IGTV 视频"
        }
    },
    props:{//接收 Search.vue 父组件数据
        search:{type:Function},//搜索关键字
        searchicon:{default:""},//搜索图片
        searchquit:{type:Function}//退出搜索页面
    }
}
</script>

<style>
    #search-1{
        position: relative;/*相对定位*/
        height:60px;/*高度*/
        border-bottom:1px solid #eee4e4;/**/
    }
    #search-nav-1{
        height:110px;
    }
    .span-search-1{
        position: absolute;/*绝对定位*/
        font-size: 20px;/*字体大小*/
        line-height: 60px;/*行高*/
        right:15px;/*右边距*/
        font-weight: 500;/*字体宽度*/
    }
    .span-search-2{
        font-size: 20px;/*字体大小*/
        font-weight: 900;/*字体宽度*/
        position: absolute;/*绝对定位*/
        top:70px;
        left:10px;
    }
    .input-search-1{
        position: absolute;/*绝对定位*/
        top:13px;/*高边距*/
        left:10px;/*左边距*/
        width:280px;/*宽度*/
        height:35px;/*高度*/
        border-radius: 10px;/*边角圆弧*/
        padding-left:50px;/*内边距*/
        box-sizing: border-box;/*定宽高，消除内边距的影响*/
        font-size: 16px;/*字体大小*/
        font-weight: 700;/*字体宽度*/
        outline: none;/*去除选中状态边框*/
        background: #f3f1f1;
    }
    .img-search-1{
        position: absolute;/*绝对定位*/
        top:22px;/*上边距*/
        left:32px;/*左边距*/
        z-index: 999;/*显示在最上端*/
    }
</style>
