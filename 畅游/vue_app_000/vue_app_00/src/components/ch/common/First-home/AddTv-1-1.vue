<template>
    <div id="addtv-1-1">
        <div id="addtv-1-nav">
            <span class="span-addtv-1-nav" @click="addtvquit">取消</span>
            <span class="span-addtv-2-nav" @click="addtvicon">{{tvs}}</span>
            <img  :src="addtv11downimg" class="addtv-1-1-icon" @click="addtvicon" v-show="download"/>
            <img  :src="addtv11upimg" class="addtv-1-2-icon" @click="addtvicon" v-show="!download"/>
        </div>
        <!-- 视频组 download3 -->
        <div id="addtv-2" v-show="download3">
            <div id="addtv-2-list">
            
            </div>
            <div id="addtv-2-list">
            
            </div>
            <div id="addtv-2-list">
            
            </div>
            <div id="addtv-2-list">
            
            </div>
             <div id="addtv-2-list">
            
            </div>
          
        </div>
        <!-- 视频组和照片组 !download1 -->
        <addtv12
        v-show="!download1"
        :addtv12tvs="addtv12tvs"
        :addtv12photos="addtv12photos"
        ></addtv12>
        <!-- 照片组 ！download2 -->
        <addtv13
        v-show="!download2"
        ></addtv13>
    </div>
</template>

<script>
//引入子组件
import AddTv12 from "./Addtv-1-2"
import AddTv13 from "./AddTv-1-3"

export default {
    data(){
        return{
            download:true,//导航栏图标和字体的切换
            download1:true,//视频组和照片组先隐藏
            download2:true,//照片组先显示
            download3:true,//视频组先显示
            tvs:"视频"
        }
    },
    props:{//接收 AddTv-1.vue 父组件数据
        addtv11downimg:{default:""},//addtv11downimg 默认空字符串
        addtv11upimg:{default:""},//addtv11upimg 默认空字符串
        addtvquit:{type:Function}//addtvquit 函数
    },
    methods: {
        addtvicon(){//当点击导航栏时，更改自身对应的状态，true变为false，反之变为true
            //视频组和导航栏的状态是一致的，照片组和视频照片组是一致的
            this.download=!this.download;//导航栏状态变换
            this.download3=!this.download3;//视频组来回切换
            this.download1=!this.download1;//视频组和照片组来回切换
        },
        addtv12tvs(){
            this.tvs="视频";
            this.download=!this.download;//导航栏状态变换
            this.download1=!this.download1;//视频组和照片组隐藏
            this.download3=!this.download3;//视频组隐藏
        },
        addtv12photos(){
            this.tvs="所有照片";
            this.download2=!this.download2;//照片组显示
            this.download=!this.download;//导航栏状态变换
            this.download1=!this.download1;//视频组和照片组隐藏
            this.download3=!this.download3//视频组隐藏
        }
    },
    //注册子组件并且给子组起一个名字
    components:{
        // "字符串"：子组件对象名称
        "addtv12":AddTv12,
        "addtv13":AddTv13
    }
    
}
</script>

<style>
    #addtv-1-nav{
        height:60px;/*高度*/
        background: #f3f1f1;/*背景颜色*/
    }
    .span-addtv-1-nav,.span-addtv-2-nav{
        font-size: 20px;/*字体大小*/
        line-height: 60px;/*行高*/
        margin-left: 10px;/*右外边距*/
    }
    .span-addtv-2-nav{
        margin-left: 80px;/*右外边距*/
        margin-right: 10px;/*左外边距*/
        font-weight: 600;/*字体宽度*/
    }
    #addtv-2{
        display: flex;/*弹性布局*/
        flex: row;/*主轴方向*/
        /* justify-content: space-around;两端对齐，两端有空白 */
        flex-wrap: wrap;/*空间不够就换行，项目不缩小*/
    }
    #addtv-2-list{
        margin-top:3px;
        margin-left:3px;
        width:32%;
        height:200px;
        background: #000;
    }
</style>