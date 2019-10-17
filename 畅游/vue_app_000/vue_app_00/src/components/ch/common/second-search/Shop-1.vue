<template>
<div>
    <div class="search_head_box">
        <div class="search_head">
            <div class="left_head" @click="search">
                <!-- 左侧图片与文字 -->
                <img :src=leftImg id="searchImg">
                <span>搜索</span>
            </div>
            <div class="right_head">
                <!-- 右侧图片与文字 -->
                <span>{{rightTitle}}</span>
                <router-link :to="`findfiend/2`"><img :src=rightImg style="margin-right:15px;"  id="addImg"></router-link>
            </div>
            
        </div>
        <div class="btn"  >
            <mt-button  @click="tour">
                旅游
            </mt-button>
            <mt-button id="shop1">
                购物
            </mt-button>
            <mt-button id="search1" @click="house">
                家居
            </mt-button>
            <mt-button id="build1" @click="build">
                建筑
            </mt-button>
            <mt-button id="food1" @click="food">
                美食
            </mt-button>
        </div>
    </div>

    <!-- 搜索面板图像列表子组件 -->
    <div class="imgs_list">
        <div  class="search_img"  v-for="(item,i) of imglist" :key="i">
            <!-- 从地址栏传参数过去 -->
            <router-link :to="`userdetailes/${item.uid}/${item.umid}/${i}`">
            <img :src="'http://127.0.0.1:3000/'+item.uimgurl" alt="">
            </router-link>
            
        </div>
    </div>
    </div>
</template>


<script>
export default {
  data() {
    return {
      imglist: [],
    };
  },
  // 接收父组件传来的数据
  props: {
    
    imgs: { default: "" },
    // 左侧图片
    leftImg: { default: "" },
    // 左侧文字
    leftTitle: { default: "" },
    // 右侧图片
    rightImg: { default: "" },
    // 右侧文字
    rightTitle: { default: "" },
    addfiend: { default: "" }
  },
  methods: {
    house(){
      this.$router.push("houseandhome");
    },
    build(){
      this.$router.push("build");
    },
    food(){
      this.$router.push("food");
    },
    tour(){
      this.$router.push("tour");
    },
    search(e) {
      var searchImg = document.getElementById("searchImg");
      if (e.target == searchImg) {
        this.$router.push("/hotsearch");
      }
    },
    load() {
      
      this.axios("cy").then(res => {
        // console.log(res);
        this.imglist = res.data.data.result1.slice(9,18);
        // console.log(this.imglist[0]);
      });
    },
    
  },
  created() {
    this.load();
  }
};
</script>

<style scoped>
/* 外层容器样式 */
div.search_head_box {
  width: 100%;
  height: 100px;
  background: #eee;
}
/* 搜索框样式 */
  .search_input{
    width: 200px;
    margin-left: 20px;
    height: 25px;
    border: 0px;
    padding-left: 5px;
  }
div.search_head {
  padding: 0;
  margin: 0;
  width: 100%;
  height: 50px;
  display: flex;
  justify-content: space-between;
  /* position: fixed; */
  padding-left: 7px;
  padding-right: 7px;
}
/* 内层容器样式 */
div.left_head,
div.right_head {
  display: flex;
  align-items: center;
}
/* 图片样式 */
div.search_head img {
  width: 25px;
  display: inline-block;
  
}
#addImg{
  margin-top: 5px;
}
div.left_head span{
  font-weight: bolder;
}
/* 加号样式 */
div.search_head > div.right_head > span {
  font-size: 20px;
}
/* 搜索字体样式 */
div.search_head > div.left_head > span {
  font-size: 20px;
  display: inline-block;
  margin: 10px 10px;
}
/* 下部按钮样式 */
div.btn {
  display: flex;
  justify-content: space-around;
  width: 100%;
}

/* 外层容器样式 */
div.search_img {
  width: 100%;
  display: inline;
}
/* 图片样式 */
div.search_img img {
  width: 117px;
  height: 100px;
  margin-left: 2px;
}
</style>
