<template>
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
        <div class="btn">
            <mt-button>
                IGTV
            </mt-button>
            <mt-button>
                购物
            </mt-button>
            <mt-button>
                家居
            </mt-button>
            <mt-button>
                建筑
            </mt-button>
            <mt-button>
                美食
            </mt-button>
            <!-- <mt-button>
                艺术
            </mt-button> -->
        </div>
    </div>
</template>

<script>
export default {
  name: "SearchTitleBar",
  data() {
    return {};
  },
  props: {
    // 左侧图片
    leftImg: { default: "" },
    // 左侧文字
    leftTitle: { default: "" },
    // 右侧图片
    rightImg: { default: "" },
    // 右侧文字
    rightTitle: { default: "" },
    addfiend:{default:""}
  },
  methods: {
      addFiend(e){
          var addImg=document.getElementById("addImg");
          if(e.target==addImg){
          this.$router.push("/SuggestListAllMsg");
        }
      },
      search(e){
          var searchImg=document.getElementById("searchImg");
          if(e.target==searchImg){
          this.$router.push("/hotsearch");
        }
      },
  },
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
</style>
