<template>
    <!-- 登录组件 -->
    <div class="login_box">
        <div class="login_title">
            <h2>畅游</h2>
        </div>
        <div class="login_fld">
            <mt-field @blur.native.capture="phon" v-model="user" class="phone" placeholder="请输入手机号或邮箱"></mt-field>
            <mt-field v-model="upwd" class="pwd" placeholder="请输入密码"></mt-field>
        </div>
        <div class="login_btn">
            <mt-button @click="login" class="btn" type="primary" size="large">登录</mt-button>
        </div>
        <div class="forget_box">
            <span class="forget">忘记登录信息？</span><span class="help">获取登录帮助</span>
        </div>
        <hr><span class="or">或</span><hr>
        <div class="no_account" @click="regist">
            <span class="no_user">没有账户？</span><span class="please_rst">请注册</span>
        </div>
    </div>
</template>

<script>
export default {
  data() {
    return {
      user: "",
      upwd: ""
    };
  },
  methods: {
    // 跳转注册页面事件
    regist(e) {
      var span = document.getElementsByClassName("please_rst")[0];
      if (e.target == span) {
        this.$router.push("/regist");
      }
    },

    // 手机输入框失去焦点方法
    phon() {
      // 创建正则
      var reg = /(^[\-0-9][0-9]*(.[0-9]+)?)$/;
      // 获取用户名
      if (!reg.test(this.user)) {
        // 获取邮箱
        var email = this.user;
        console.log(email);
      } else {
        // 获取手机号
        var phone = this.user;
      }
      if (this.user !== "") {
        // 用户名正则
        var regPhone = new RegExp(/^1[3456789]\d{9}$/);
        var regEmail = new RegExp(
          "^([0-9A-Za-z-_.]+)@([0-9a-z]+.[a-z]{2,3}(.[a-z]{2})?)$",
          "g"
        );
        // 判断格式是否正确
        if (regPhone.test(phone) === false && regEmail.test(email) === false) {
          this.$toast("手机或邮箱格式不正确");
        }
      }
    },
    // 登录
    login() {
      // 创建正则
      var reg = /(^[\-0-9][0-9]*(.[0-9]+)?)$/;
      // 获取用户名
      if (!reg.test(this.user)) {
        // 获取邮箱
        var email = this.user;
      } else {
        // 获取手机号
        var phone = this.user;
      }

      // 获取用户密码
      var upwd = this.upwd;
      // 传递的参数
      var obj;
      if (email === undefined) {
        obj = { phone: phone, upwd: upwd };
      } else if (phone === undefined) {
        obj = { email: email, upwd: upwd };
      }

      // 发送ajax请求
      this.axios("login", { params: obj }).then(res => {
        // console.log(res);
        // 获取服务器返回结果
        if (res.data.code == -1) {
          this.$toast("用户名或密码错误");
        } else {
          this.$router.push("/cy");
        }
      });
    }
  }
};
</script>

<style scoped>
/* 外层容器 */
div.login_box {
  text-align: center;
}
/* logo容器 */
div.login_title {
  width: 100%;
  height: 50px;
  display: flex;
  align-items: center;
  justify-content: space-around;
  margin-top: 100px;
}
/* 文本输入框 */
div.login_fld {
  margin: 0px 0px 30px 0px;
}
.phone,
.pwd {
  border: 1px solid #ccc;
  margin: 10px 0;
  height: 30px;
}
/* 按钮 */
div.login_btn {
  text-align: center;
  margin-bottom: 10px;
}
.btn {
  margin-top: 20px;
}
/* 帮助样式 */
div.forget_box {
  margin-bottom: 40px;
}
/* 分割线 */
hr {
  width: 169px;
}
.or,
hr,
hr {
  float: left;
}
/* 清除浮动 */
div.no_account {
  clear: both;
  margin-top: 100px;
}
span.forget,
span.no_user,
span.or {
  color: #666;
}
span.please_rst,
span.help {
  color: #333;
  font-weight: bolder;
}
</style>
