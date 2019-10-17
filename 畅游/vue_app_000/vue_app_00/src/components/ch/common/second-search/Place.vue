<template>
    <div id="home">
        <!-- 面板列表 -->
        <mt-tab-container v-model="active">
            <!-- 第一主页面-home -->
            <mt-tab-container-item id="a1">
            
            </mt-tab-container-item>
            <mt-tab-container-item id="a2">
                <div class="find_user_head" @click="arrows">
                    <div class="up_head">
                        <!-- 左侧图片与文字 -->
                        <img src="../../../../assets/arrows.png" id="arrowsImg">
                        <input class="search_input" type="text" placeholder="搜索地点">
                    </div>
                    <div class="down_head">
                        <!-- 右侧图片与文字 -->
                        <div class="hotsearch"><span @click="hotSearch">热门搜索</span></div>
                        <div class="account"><span @click="account">账户</span></div>
                        <div class="label"><span @click="label">标签</span></div>
                        <div class="place"><span @click="place">地点</span></div>
                    </div>
                </div>
                <place1></place1>
            </mt-tab-container-item>
            <mt-tab-container-item id="a3">
                <!-- 关注页 -->
                
            </mt-tab-container-item>
            <mt-tab-container-item id="a4">
                <h1>d</h1>
            </mt-tab-container-item>
        </mt-tab-container>

        <!-- 底部导航列表 -->
        <!--为每个按钮绑定点击事件-->
        <!--当前按钮isSelect:true-->
        <!--其它按钮isSelect:false-->
        <mt-tabbar v-model="active" fixed>
            <mt-tab-item id="a1" @click.native="home">
                <tabbaricon
                :selectedImage="require('../../../../assets/home_selected .png')"
                :normalImage="require('../../../../assets/home_normal.png')"
                :focused="currentIndex[0].isSelect">              
                </tabbaricon>
            </mt-tab-item>
            <mt-tab-item id="a2" @click.native="changeState(1)">
                <tabbaricon
                :normalImage="require('../../../../assets/search_normal.png')"
                :selectedImage="require('../../../../assets/search_selected.png')"
                :focused="currentIndex[1].isSelect">
                </tabbaricon>
                搜索
            </mt-tab-item>
            <mt-tab-item id="a3" @click.native="love">
                <tabbaricon
                :normalImage="require('../../../../assets/love_normal.png')"
                :selectedImage="require('../../../../assets/love_selected.png')"
                :focused="currentIndex[2].isSelect">
                </tabbaricon>
                关注
            </mt-tab-item>
            <mt-tab-item id="a4" @click.native="me">
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
// 引入SearchListTitleBar.vue 子组件
import searchlisttitlebar from "./SearchListTitleBar.vue"
// 引入子组件
import TabBaricon from "./TabBarIcon.vue"//底部导航栏子组件
import place1 from "./Place-1.vue"//底部导航栏子组件



export default {
    data(){
        return{
            //面板中显示子组件id
            active:"a2",
            //创建数组保存图片焦点状态
            currentIndex:[
                {isSelect:false},
                {isSelect:true},
                {isSelect:false},
                {isSelect:false}
            ]
        }
    },
    //集中存放事件处理函数
    methods: {
        home(){
            this.$router.push("/cy");
        },
        love(){
            this.$router.push("/cy");
        },
        me(){
            this.$router.push("/cy");
        },
        arrows(e){
            var img=document.getElementById("arrowsImg");
            if(e.target==img){
                this.$router.push("/shop");
            }
        },
        hotSearch(){
            this.$router.push("hotsearch");

        },
        account(){
            this.$router.push("account");
        },
        label(){
            this.$router.push("label");
        },
        place(){
            this.$router.push("place");
        },
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
        }
    },
    //注册子组件并且给子组起一个名字
    components:{
        // 注册子组件
        "tabbaricon":TabBaricon,//底部导航栏组件
        "searchlisttitlebar":searchlisttitlebar,  //顶部标题栏组件
        "place1":place1,    //中间列表组件

    }
}
</script>


<style scoped>
    /* 外层容器样式 */
    div.find_user_head{
        width: 100%;
        height: 100px;
        background: #f3f1f1;
    }
    /* 上部标题样式 */
    div.up_head{
        width: 100%;
        height: 50px;
        display: flex;
        align-items: center;
        padding-left: 8px;
    }
    /* 搜索框样式 */
  .search_input{
    width: 200px;
    margin-left: -16px;
    height: 25px;
    border: 0px;
    padding-left: 5px;
  }
  div.down_head{
      position: relative;
  }

    /* 下面标题样式 */
    div.down_head div{
        width: 85px;
        height: 50px;
        text-align: center;
        line-height: 50px;
        font-size: 16px;
        font-weight: 700;
        background: #f3f1f1;
        position: absolute;
    }
    div.down_head div span{
        margin-top: 10px;
    }
    .hotsearch{
        width: 104px !important;
    }
    .account{
        left: 103px;
    }
    .label{
        left: 189px;
    }
    /* 添加下划线 */
    .place{
        left: 274px;
        border-bottom: 1px solid #000;
    }

    /* 箭头 */
    div.up_head img{
        width: 30px;
        margin-right: 30px;
    }
    /* 下面标题样式 */
    div.down_head span{
        font-size: 20px;
        color: #ccc;
        font-weight: bolder;
    }

</style>
