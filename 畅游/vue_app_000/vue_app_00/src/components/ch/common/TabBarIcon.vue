<!--TabBarIcon.vue-->
<template>
  <div>
   <img :src="focused?selectedImage:normalImage" class="imgstyle"/>
  </div>
</template>

<script>
export default {
  props:{//接收父组件数据
    focused:false,//focused 默认false
    selectedImage:{default:""},//selectedImage 默认空字符串
    normalImage:{default:""}//normalImage 默认空字符串
  }
}
</script>
<style>
  /* 图片样式 */
  .imgstyle{
    width:30px;
    height:30px;
  }
</style>