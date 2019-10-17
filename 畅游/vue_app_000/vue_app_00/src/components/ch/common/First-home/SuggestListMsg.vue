<template>
    <div id="suggestlistmsg">
        <div id="suggestlist-nav">
            <span class="suggestlist-span-1">Suggested For You</span>
            <span class="suggestlist-span-2" @click="suggestsell">Sell All</span>
        </div>
        <div id="suggestlist-list">
            <div id="suggest-msg" v-for="(item,i) of list" :key="i">
                <img class="suggestdel" :src="suggestdelicon" @click="deleteiconimg"/>
                <img class="msgimg" :src="'http://127.0.0.1:3000/'+item.uheadurl" />
                <span class="msgname">{{item.uname}}</span>
                <!-- <a class="suggest-a" @click="attentions(i)">
                    <span v-if="item.uattention">已关注</span>
                    <span v-else>关注</span>
                </a> -->
                <a
                :data-id="item.uid"
                :data-phone="item.uphone"
                :data-email="item.uemail"
                :data-pwd="item.upwd"
                :data-name="item.uname"
                :data-sex="item.usex"
                :data-age="item.uage"
                :data-headurl="item.uheadurl"
                :data-attention="item.uattention"
                :data-attents="item.uattents"
                :data-address="item.uaddress"
                class="suggest-a" @click="attentions"
                >{{attentionindex[item.uattention]}}
                </a>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data(){// 存入初始数据，以便ajax请求发送接收
        return{       
            list:[],// 创建一个空数组，接收后台传回的所需用户的数据
            attentionindex:["关注","已关注"]
        }
    },
    props:{//接收 SuggestList.vue 父组件数据
        suggestdelicon:{default:""},//删除图
        suggestsell:{type:Function}//跳转到推荐主列表函数

    },
    methods: {
        loadmore(){
            // 请求服务器网址
            var url="cy";
            // 发送ajax请求获取数据
            this.axios.get(url).then(result=>{
                var list=result.data.data.result2;
                this.list=list;
            })
        },
        // attentions(i){//判断是否已关注
        //     this.list[i].uattention = !this.list[i].uattention
        // }
        attentions(e){//判断是否已关注
            var id=e.target.dataset.id;
            var phone=e.target.dataset.phone;
            var email=e.target.dataset.email;
            var pwd=e.target.dataset.pwd;
            var name=e.target.dataset.name;
            var sex=e.target.dataset.sex;
            var age=e.target.dataset.age;
            var headurl=e.target.dataset.headurl;
            var attention=e.target.dataset.attention;
            var attents=e.target.dataset.attents;
            var address=e.target.dataset.address;
            // console.log(id,phone,email,pwd,name,sex,age,headurl,attention,attents,address);
            attention=1;//修改默认关注的状态变为1
            var url="SuggestListAllMsg";
            var obj={uid:id,uphone:phone,uemail:email,upwd:pwd,uname:name,usex:sex,uage:age,uheadurl:headurl,uattention:attention,uattents:attents,uaddress:address}
            this.axios.get(url,{params:obj}).then(result=>{
                // this.$messagebox("","关注成功");
                 this.loadmore();
            })
        },
        deleteiconimg(e){
            var div=e.target.parentNode;//获取点击事件的父元素
            div.style.display="none";//该元素隐藏
        }
    },
    // 自动加载页面
    created(){
        this.loadmore();
    }
}
</script>

<style >
    /* 主背景色 */
    #suggestlistmsg{
        background: #f3f1f1;
    }
    #suggestlist-nav{
        display: flex;/*弹性布局*/
        justify-content: space-between;/*项目在主轴上的对齐方式，两端对齐无空白*/
        align-items: center;/*项目在交叉轴的对齐方式，居中对齐*/
        padding:10px;/*内边距*/
    }   
    .suggestlist-span-1,.suggestlist-span-2{
        font-size:13px;
        font-weight: 600;
    }
    /* 查看所有推荐网友 */
    .suggestlist-span-2{
        color: #11a9d4f2;
    }
    /* 推荐网友列表 */
    #suggestlist-list{
        display: flex;/*弹性布局*/
        justify-content: space-around;/*项目在主轴上的对齐方式，等距等宽*/
        box-sizing: border-box;/*防止父元素的宽高变化*/
        flex-wrap: wrap;/*空间不够，就换行*/
        width:100%;
        height:200px;
        overflow: hidden;/*溢出隐藏*/
        padding:10px;/*内边距*/
    }
    /* 推荐网友信息 */
    #suggest-msg{
        position: relative;/*相对定位*/
        width:30%;
        height:180px;
        background: #fff;
        display: flex;
        margin-bottom:10px;
        border-radius: 5px;
    }
    /* 用户头像 */
    .msgimg{
        position: absolute;/*绝对定位*/
        top:15px;
        left:19px;;
        width:67px;
        height:67px;
        border-radius: 50%;/*画圆*/

    }
    .suggest-a{
        position: absolute;/*绝对定位*/
        top:140px;
        left:10px;
        width:80%;
        height:30px;
        border-radius: 3px;/*圆角*/
        background: #038fff;/*背景色*/
        text-align: center;/*文字水平居中*/
        font-size: 16px;/*字体大小*/
        line-height: 30px;/*行高*/
        color:#fff;/*字体颜色*/
    }
    /* 用户姓名 */
    .msgname{
        position: absolute;
        top:90px;
        left:5px;
        width:90%;
        font-size: 12px;
        text-align: center;
    }
    .suggestdel{
        position: absolute;
        top:6px;
        right:6px;
        width:16px;
        height:16px;
    }
</style>
