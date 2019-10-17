<template>
    <div id="home">
        <!-- 面板列表 -->
        <mt-tab-container v-model="active">
            <!-- 第一主页面-home -->
            <mt-tab-container-item id="a1">
            </mt-tab-container-item>
            <mt-tab-container-item id="a2">
                <!-- 查找页 -->
                <!-- <sea></sea> -->
                <houseandhome
                :leftImg="require('../../../../assets/search_normal.png')"
                leftTitle="搜索"
                rightTitle="+"
                :rightImg="require('../../../../assets/me_normal.png')"
                :imgs="require('../../../../assets/1.jpg')"
                ></houseandhome>
            </mt-tab-container-item>
            <mt-tab-container-item id="a3">
                
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
// 搜索子组件
import houseandhome from "./HouseAndHome-1.vue"
import TabBaricon from "./TabBarIcon.vue"//底部导航栏子组件
// 引入子组件

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
        home(){
            this.$router.push("cy");
        }
    },
    //注册子组件并且给子组起一个名字
    components:{
        // "字符串"：子组件对象名称



        // 李
        // "sea":sea,
        "houseandhome":houseandhome,
        "tabbaricon":TabBaricon,//底部导航栏组件



    }
}
</script>


<style scoped>
    
</style>




