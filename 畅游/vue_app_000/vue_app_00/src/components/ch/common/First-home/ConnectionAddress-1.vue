<template>
    <div id="connectionaddress1">
        <div id="connectionaddress1text">
            <div id="connectionaddress1text-id">
                <span class="connectionaddress1text-span-1">{{spantext1}}</span>
                <span class="connectionaddress1text-span-2">{{spantext2}}</span>
            </div>
            <div id="connectionid">
                <a class="connectionid1" href="javascript:;" @click="connectionquit">{{spantext3}}</a>
                <a class="connectionid2" href="javascript:;">{{spantext4}}</a>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data(){
        return{
            spantext1:"无法加载用户",
            spantext2:"请进“设置”>“隐私”>“联系人”，允许 Instagram 访问你的联系人",
            spantext3:"取消",
            spantext4:"设置"
        }
    },
    props:{
        connectionquit:{type:Function}
    }
}
</script>

<style>
    /* 背景大小 */
    #connectionaddress1{
        position: relative;
        top:20px;
        width:375px;
        height:667px;
    }
    #connectionaddress1text{
        position: absolute;
        top:245px;
        left:53px;
        width:250px;
        background: #fff;
        height:160px;
        border-radius: 15px;
        border:1px solid #00000059;
    }
    #connectionaddress1text-id{
        padding:20px 10px;
        box-sizing: border-box;
    }
    .connectionaddress1text-span-1,.connectionaddress1text-span-2{
        display: block;
        text-align: center;
        font-size: 19px;
        font-weight: 700;
    }
    .connectionaddress1text-span-2{
        margin:10px 0;
        font-size: 13px;
        font-weight: 500;
    }
    #connectionid{
        display: flex;
    }
    .connectionid1,.connectionid2{
        display: block;
        width:125px;
        height:40px;
        line-height: 40px;
        text-align: center;
        border-top:1px solid #00000059;
        border-bottom:1px solid #00000059;
        border-radius: 0 0 0 15px;
    }
    .connectionid2{
        border-left:1px solid #00000059;
        border-radius: 0 0 15px 0;
    }
</style>