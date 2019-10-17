<template>
    <div id="home">
        <!-- 面板列表 -->
        <mt-tab-container v-model="active">
            <mt-tab-container-item id="a1">
                <!-- 主页Home列内容 -->
                <div id="suggestlistallmsg-1">
                    <div id="suggestlistallmsg-1-nav">
                        <img class="suggestlistallmsg-1-img" :src="suggestlistallmsgquit" @click="suggestquit"/>
                        <span class="suggestlistallmsg-1-span">{{suggesttext}}</span>
                    </div>
                </div>   
                <div id="suggestlistallmsg-1-msg">
                    <!-- 推荐 -->
                    <suggestlistallmsg2
                    id="suggestlistallmsg2id"
                    :addresslistimg="require('../../../../img/addresslist-icon.png')"
                    :suggestdelicon="require('../../../../img/suggest-del-icon.png')"
                    :liaison2="liaison2"
                    v-show="showhide2"
                    :connection="connection"
                    ></suggestlistallmsg2>
                    <!-- 联系人 -->
                    <suggestlistallmsg3
                    :addresslistimg1="require('../../../../img/addresslist1-icon.png')"
                    :liaison3="liaison3"
                    v-show="showhide3"
                    ></suggestlistallmsg3>
                    <!-- 绑定联系人 -->
                    <connectionaddress
                    id="connectionaddressid"
                    v-show="showhide4"
                    :connectionicon1="require('../../../../img/connection1-icon.png')"
                    :connectionicon2="require('../../../../img/connection2-icon.png')"
                    :connectionicon3="require('../../../../img/connection3-icon.png')"
                    :routerlink11="routerlink11"
                    :routerlink22="routerlink22"
                    :routerlink33="routerlink33"
                    ></connectionaddress>
                    <!-- 手机设置添加联系人 -->
                    <connectionaddress1
                    id="connectionaddressid1"
                    :connectionquit="connectionquit"
                    v-show="showhide4"
                    ></connectionaddress1>
                </div>
            </mt-tab-container-item>
            <mt-tab-container-item id="a2">
                <sea></sea>
            </mt-tab-container-item>
            <mt-tab-container-item id="a3">
                <follow></follow>
            </mt-tab-container-item>
            <mt-tab-container-item id="a4">
            d
            </mt-tab-container-item>
        </mt-tab-container>

        <!-- 底部导航列表 -->
        <!--为每个按钮绑定点击事件-->
        <!--当前按钮isSelect:true-->
        <!--其它按钮isSelect:false-->
        <mt-tabbar v-model="active" fixed>
            <mt-tab-item id="a1" @click.native="changeState(0)">
                <tabbaricon
                :selectedImage="require('../../../../assets/home_selected .png')"
                :normalImage="require('../../../../assets/home_normal.png')"
                :focused="currentIndex[0].isSelect">              
                </tabbaricon>
            </mt-tab-item>
            <mt-tab-item id="a2" @click.native="changeState">
                <tabbaricon
                :normalImage="require('../../../../assets/search_normal.png')"
                :selectedImage="require('../../../../assets/search_selected.png')"
                :focused="currentIndex[1].isSelect">
                </tabbaricon>
                b
            </mt-tab-item>
            <mt-tab-item id="a3" @click.native="changeState(2)">
                <tabbaricon
                :normalImage="require('../../../../assets/love_normal.png')"
                :selectedImage="require('../../../../assets/love_selected.png')"
                :focused="currentIndex[2].isSelect">
                </tabbaricon>
                关注
            </mt-tab-item>
            <mt-tab-item id="a4" @click.native="changeState(3)">
                <tabbaricon
                :normalImage="require('../../../../assets/me_normal.png')"
                :selectedImage="require('../../../../assets/me_selected.png')"
                :focused="currentIndex[3].isSelect">
                </tabbaricon>
                d
            </mt-tab-item>
        </mt-tabbar>
    </div>
</template>

<script>

// 引入子组件
import TabBaricon from "../TabBarIcon.vue"//底部导航栏子组件
import SuggestListAllMsg2 from "./SuggestListAllMsg-2"
import SuggestListAllMsg3 from "./SuggestListAllMsg-3"
import sea from "../second-search/Search.vue"//查找子组件
import Follow from "../Follow/Follow.vue"//关注页
import ConnectionAddress from "./ConnectionAddress.vue"//绑定联系人组件
import ConnectionAddress1 from "./ConnectionAddress-1.vue"//绑定手机添加通讯录组件

export default {
    data(){
        return{
            //面板中显示子组件id
            active:"a1",
            //创建数组保存图片焦点状态
            currentIndex:[
                {isSelect:true},
                {isSelect:false},
                {isSelect:false},
                {isSelect:false}
            ],
            suggesttext:"发现用户",
            showhide2:true,
            showhide3:false,
            showhide4:false
        }
    },
    //集中存放事件处理函数
    methods: {
        changeState(n){
            //函数功能:将当前参数下标
            //对应数组值修改true其它修改false
            //1:创建循环,循环数组中内容
            for(var i=0;i<this.currentIndex.length;i++){
                //2:判断如果循环下标与n相等 20
                if(n==i){
                //3:当前下标元素true 10:22
                this.currentIndex[i].isSelect=true;
                }else{
                    //4:其它元素修改false
                    this.currentIndex[i].isSelect=false;
                }
            }
        },
        changeState(){
            this.$router.push("/shop")
        },
        liaison2(){//联系人点击事件
            this.showhide2=!this.showhide2;//推荐事件页面隐藏
            this.showhide3=!this.showhide3;//联系人页面显示
        },
        liaison3(){//推荐点击事件
            this.showhide3=!this.showhide3;//推荐页面显示
            this.showhide2=!this.showhide2;//联系人页面隐藏
        },
        connection(){//绑定通讯录
            var suggestlistallmsg2id=document.getElementById("suggestlistallmsg2id");
            var connectionaddressid=document.getElementById("connectionaddressid");
            suggestlistallmsg2id.style="opacity: .2;"
            connectionaddressid.style="display:block;"
        },
        routerlink11(e){
            // 默认阻止
            e.preventDefault(); 
            
        },
        routerlink22(e){
            // 默认阻止
            e.preventDefault(); 
            var suggestlistallmsg2id=document.getElementById("suggestlistallmsg2id");
            var connectionaddressid=document.getElementById("connectionaddressid");
            var connectionaddressid1=document.getElementById("connectionaddressid1")
            suggestlistallmsg2id.style="opacity: .2;"
            connectionaddressid.style="display:none;"
            connectionaddressid1.style="display:block"
        },
        routerlink33(e){
            // 默认阻止
            e.preventDefault(); 
            var suggestlistallmsg2id=document.getElementById("suggestlistallmsg2id");
            var connectionaddressid=document.getElementById("connectionaddressid");
            suggestlistallmsg2id.style="opacity: 1;"
            connectionaddressid.style="display:none;"
        },
        connectionquit(e){
            // 默认阻止
            e.preventDefault(); 
            var suggestlistallmsg2id=document.getElementById("suggestlistallmsg2id");
            var connectionaddressid=document.getElementById("connectionaddressid");
            var connectionaddressid1=document.getElementById("connectionaddressid1")
            suggestlistallmsg2id.style="opacity: 1;"
            connectionaddressid.style="display:none;"
            connectionaddressid1.style="display:none"
        }
    },
    props:{
        suggestlistallmsgquit:{default:""},//退出界面图
        suggestquit:{type:Function}//退出界面按钮
    },
    //注册子组件并且给子组起一个名字
    components:{
        // "字符串"：子组件对象名称
        "tabbaricon":TabBaricon,//底部导航栏组件
        "suggestlistallmsg2":SuggestListAllMsg2,//推荐网友主列表信息组件
        "suggestlistallmsg3":SuggestListAllMsg3,//绑定联系人组件
        "sea":sea,
        "follow":Follow,
        "connectionaddress":ConnectionAddress,
        "connectionaddress1":ConnectionAddress1

    }
}
</script>

<style>
    #suggestlistallmsg-1-nav{
        position: relative;
        height:60px;
        background: #f3f1f1;
    }
    #suggestlistallmsg-1-msg{
        height:100%;
    }
    .suggestlistallmsg-1-img{
        position: absolute;
        width: 32px;
        height:32px;
        top:14px;
        left:5px;
        z-index: 1;
    }
    .suggestlistallmsg-1-span{
        position: absolute;
        left:140px;
        font-size:22px;
        font-weight: 600;
        line-height: 60px;

    }
</style>