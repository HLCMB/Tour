<template>
<div>
    <div class="search_head_box">
        <div class="search_head">
            <div class="left_head" @click="search">
                <!-- 左侧图片与文字 -->
                <img :src=leftImg id="searchImg">
                <span>{{leftTitle}}</span>
            </div>
            <div class="right_head" @click="addFiend">
                <!-- 右侧图片与文字 -->
                <span>{{rightTitle}}</span>
                <img :src=rightImg style="margin-right:15px;"  id="addImg">
            </div>
            
        </div>
        <div class="btn"  >
            <mt-button  @click="igtv">
                IGTV
            </mt-button>
            <mt-button id="shop1" @click="shop">
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
        <div  class="search_img" id="2" style="display:block">
            <img v-for="(item,i) of imglist" :key="i" :src="'http://127.0.0.1:3000/'+item.uimgurl" alt="">
        </div>
        <div class="search_img" id="1" style="display:none">
            <img v-for="(item,i) of imglist" :key="i" :src="'http://127.0.0.1:3000/'+item.uimgurl" alt="">
            <h1>111</h1>
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
    igtb(){
      this.$router.push("/igtv");
    },
    shop(){
      this.$router.push("shop");
    },
    house(){
      this.$router.push("houseandhome");
    },
    food(){
      this.$router.push("food");
    },
    build(){
      this.$router.push("build");
    },
    addFiend(e) {
      var addImg = document.getElementById("addImg");
      if (e.target == addImg) {
        this.$router.push("/SuggestListAllMsg");
      }
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
        this.imglist = res.data.data.result1;
        // console.log(this.imglist[0]);
      });
    },
    change(e,i) {
      var shop1 = document.getElementById("shop1");
      var shop = document.getElementById("1");
      var search = document.getElementById("2");
      var search1 = document.getElementById("search1");
    //   console.log(i);
        // console.log(search1)
        // console.log(e.target)
      if (e.target == shop1) {
        shop.style.display = "block";
        search.style.display = "none";
      }else{
          shop.style.display = "none";
        search.style.display = "block";
      }
    }
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
}
/* 图片样式 */
div.search_img img {
  width: 117px;
  height: 100px;
  margin-left: 2px;
}
</style>
