<template>
  <div>
    <div class="nav">
      <p @click="xiala">{{list.uname}}<img src="../../../../assets/按钮_选中_o.png" alt=""></p>
      <i @click="youla"><img src="../../../../assets/收起按钮icon.png" alt=""></i>
    </div>
    <div>
      <mt-popup id="div"
  v-model="popupVisible"
  position="bottom">
  <div class="alert">
      <div class="one">
        <div style="display:flex; align-items:center;">
          <img style="border-radius:50%; border:1px solid #ccc" width="50px" height="50px" :src="'http://127.0.0.1:3000/'+list.uheadurl" alt="">
          <p style="margin-left:15px;">{{list.uname}}</p>
        </div>
        <div><i><img src="../../../../assets/选中.png" alt=""></i></div>
      </div>
      <div class="two">
        <button class="my_btn">{{list.fans}}粉丝</button>
        <button class="my_btn">0位密友</button>
      </div>
      <div class="three">
        <i style="margin:0 25px"><img src="../../../../assets/添加(1).png" alt=""></i>
        <p style="font-size:15px">添加账户</p>
      </div>
  </div>
</mt-popup>
      <mt-popup id="div2"
      v-model="popup2Visible"
      position="right">
        <div class="set">
          <div>
            <p style="border-bottom:1px solid #ccc; padding:10px 10px;">{{list.uname}}</p>
          <div class="codebody">
            <li><img src="../../../../assets/电影.png" alt=""> 私人影集</li>
            <li><img src="../../../../assets/活动.png" alt=""> 你的活动</li>
            <li><img src="../../../../assets/名片扫描.png" alt=""> 名片</li>
            <li><img src="../../../../assets/收藏夹.png" alt=""> 收藏夹</li>
            <li><img src="../../../../assets/好友.png" alt=""> 密友</li>
            <li><img src="../../../../assets/添加用户(1).png" alt=""> 发现用户</li>
          </div>
          </div>
          <div style="border-top:1px solid #ccc">
            <p style="margin:0;padding:10px 0;"><img style="vertical-align: middle;margin:0 10px;" src="../../../../assets/设置.png" alt=""> 设置</p>
          </div>
        </div>
      </mt-popup>
    </div>
    <div class="userNav">
      <div>
        <img class="user_img" width="100px" height="100px" :src="'http://127.0.0.1:3000/'+list.uheadurl" alt="">
      </div>
      <i @click="touxiang" class="add"><img src="../../../../assets/添加.png" alt=""></i>
      <mt-actionsheet
       :actions="data"
       v-model="sheetVisible" 
      >
      </mt-actionsheet>
      <div style="width:100%;">
        <div class="guanzhu">
          <li>
            <i>{{list.post}}</i>
            <p>帖子</p>
          </li>
          <li>
            <i>{{list.fans}}</i>
            <p>粉丝</p>
          </li>
          <li>
            <i>{{list.uattents}}</i>
            <p>已关注</p>
          </li>
        </div>
      </div>
    </div>
    <div style="margin-top:10px;">
      <p style="margin:0">{{list.nickname}}</p>
      <p style="margin:0">个性签名:{{list.qianming}}</p>
    </div>
    <div>
      <button @click="jup" class="zhuyeBtn">编辑主页</button>
    </div>
    <div class="body">
      <mt-navbar class="page-part" v-model="selected">
        <mt-tab-item class="tab_item" id="1"><img width="30px" height="30px" src="../../../../assets/九宫格.png" alt=""></mt-tab-item>
        <mt-tab-item class="tab_item" id="2"><img width="30px" height="30px" src="../../../../assets/照片.png" alt=""></mt-tab-item>
      </mt-navbar>
    </div>
    <div>
      <mt-tab-container v-model="selected">
        <mt-tab-container-item id="1">
          <homepage></homepage>
        </mt-tab-container-item>
        <mt-tab-container-item id="2">
          <photosVideo></photosVideo>
        </mt-tab-container-item>
      </mt-tab-container>
    </div>
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
            </mt-tab-item>
            <mt-tab-item id="a3" @click.native="changeState(2)">
                <tabbaricon
                :normalImage="require('../../../../assets/love_normal.png')"
                :selectedImage="require('../../../../assets/love_selected.png')"
                :focused="currentIndex[2].isSelect">
                </tabbaricon>
            </mt-tab-item>
            <mt-tab-item id="a4" @click.native="changeState(3)">
                <tabbaricon
                :normalImage="require('../../../../assets/me_normal.png')"
                :selectedImage="require('../../../../assets/me_selected.png')"
                :focused="currentIndex[3].isSelect">
                </tabbaricon>
            </mt-tab-item>
        </mt-tabbar>
  </div>
</template>
<script>
import Homepage from"./Homepage.vue" //引入子组件
import PhotosVideo from"./PhotosVideo.vue"//引入子组件
import TabBaricon from "../TabBarIcon.vue" //底部导航栏
export default {
  data() {
    return {
       //面板中显示子组件id
            active:"a2",
            //创建数组保存图片焦点状态
            currentIndex:[
                {isSelect:false},
                {isSelect:true},
                {isSelect:false},
                {isSelect:false}
            ],
      list:[],
      data:[{
        name:'拍照',
        methods:this.getCamera
      },
     
      {
        name:'从相册中选择',
        methods:this.getLibary
      }      
      ],
      sheetVisible:false,
      //action sheet 选项内容
      popupVisible: false,
      popup2Visible:false,
      selected:'1'
    }
  },
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
        },
    lodeMore(){
      //请求服务器网址
      var url="theuser";
      //发送ajax请求获取数据
      this.axios(url).then(result=>{
        this.list=result.data.data[0][0];
         console.log(result.data.data[0][0]);
      })
     
    },
    touxiang(){
      this.sheetVisible=true;
    },
    getCamera(){
      console.log("打开相机");
    },
    getLibary(){
      console.log("打开相册");
    },
    xiala(){
      var div=document.getElementById("div");
      div.style.width="100%";
      div.style.borderTopLeftRadius="8px";
      div.style.borderTopRightRadius="8px";
      this.popupVisible=true;
    },
    youla(){
      var div2=document.getElementById("div2");
        div2.style.width="70%";
        div2.style.height="100%";
      this.popup2Visible=true;
    },
    jup(){
      this.$router.push("/editpage");
    }
  },
  created() {
    this.lodeMore();
  },
  components:{
    "homepage":Homepage,
    "photosVideo":PhotosVideo,
    "tabbaricon":TabBaricon
  },
}
</script>
<style scoped>
.codebody>li{
  margin:20px 0 20px 50px;
}
li{
  list-style:none;
}
.guanzhu{
  width:100%;
  display: flex;
  justify-content: space-around !important;
}
    .guanzhu>li{
      border:none !important;
    }
  p{
    margin: 0;
  }
  .alert{

    width:100%;
    height:180px;
  }
  .nav{
    display:flex;
    justify-content:space-between;
    align-items: center;

  }
  .set{
    height:100%;
    display: flex;
    flex-direction:column;
    justify-content:space-between;
  }
  .set ul{
    list-style: none;
  }
  .set ul>li{
    margin:10px 0;
  }
  .user_img{
    border:1px solid #ccc;
    border-radius:50%;
  }
  .userNav{
    display:flex;
    width:100%;
    align-items: center;
  }
  .userNav div>ul{
    list-style: none;
    display:flex;
    justify-content: space-between;
  }
  .add{
    position:absolute;
    left:80px;top:94px;
  }
  .zhuyeBtn{
    width:100%;
    background:#fff;
    border:1px solid #ccc;
    border-radius:3px;
    padding:3px 0;
    margin:20px 0 5px 0;
  }
  .body{
    margin-top:10px;
    display:flex;
    width:100%;
    border-top: 1px solid #F2F2F2;
    border-bottom:1px solid #F2F2F2;
  }
  .page-part{
    display:flex;
    width:100%;
  }
  .tab_item{
    width:50%;
    text-align: center;
    padding:10px 0;
  }
 .mint-navbar .mint-tab-item.is-selected {
   border-bottom: 1px solid #000;
    color: #000;
    margin:0;
 }
 .one{
   margin-top:30px;
   display: flex;
   width: 100%;
   justify-content:space-between;
   align-items: center;
 }
 .two{
   margin-top:10px;
   width:100%;
   display: flex;
   justify-content: space-around;
 }
 .my_btn{
   width:45%;
   border-radius:10px;
   border:1px solid #ccc;
   background:#fff;
   outline: none;
   padding:5px 0;
 }
 .three{
   height:80px;
   margin-top:10px;
   background: #ccc;
   display:flex;
   align-items: center;
 }
 .codebody>li>img{
  vertical-align: middle;
  width:28px;height:28px;
  margin-right:20px;
 }
 .set>div>ul>li{
   margin:20px 0;
 }
</style>