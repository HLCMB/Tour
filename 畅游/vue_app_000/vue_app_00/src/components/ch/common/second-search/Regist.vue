<template>
    <!-- 注册组件 -->
    <div>
        <div class="regist_logo">
            <img src="../../../../assets/regist_log.png" alt="">
        </div>
        <div class="regist_span" @click="change">
            <span id="phone">手机号</span>
            <span id="email">邮箱</span>
        </div>
        <hr>
        <div class="regist_fld" id="phone_div">
            <mt-field @blur.native.capture="phon" v-model="phone" class="fld" placeholder="请输入手机号"></mt-field>
            <mt-field @blur.native.capture="pwd" v-model="upwd" class="fld" placeholder="请输入密码"></mt-field>
        </div>
        <div class="regist_fld" style="display:none" id="email_div">
            <!-- 鼠标失去焦点事件 -->
            <mt-field @blur.native.capture="emai" v-model="email" class="fld" placeholder="请输入邮箱"></mt-field>
            <mt-field @blur.native.capture="pwd" v-model="upwd" class="fld" placeholder="请输入密码"></mt-field>
        </div>
        <div class="regist_btn">
            <mt-button @click="reg" class="btn" type="primary" size="large">注册</mt-button>
        </div>
    </div>
</template>

<script>
export default {
  data() {
    return {
      phone: "",
      email: "",
      upwd: ""
    };
  },
  methods: {
    // 手机和邮箱的div转换方法
    change(e) {
      var phone = document.getElementById("phone");
      var phoneDiv = document.getElementById("phone_div");
      var email = document.getElementById("email");
      var emailDiv = document.getElementById("email_div");
      if (e.target == email) {
        phoneDiv.style.display = "none";
        emailDiv.style.display = "";
      }
      if (e.target == phone) {
        phoneDiv.style.display = "";
        emailDiv.style.display = "none";
      }
    },
    // 手机输入框失去焦点方法
    phon() {
      if (this.phone !== "") {
        // 用户名正则
        var regPhone = new RegExp(/^1[3456789]\d{9}$/);
        // 判断格式是否正确
        if (regPhone.test(this.phone) === false) {
          this.$toast("手机格式不正确");
        } else {
          // 获取手机号
          var phone = this.phone;
          var obj = { phone: phone };
          console.log(1);
          this.axios("regist", { params: obj }).then(res => {
            console.log(res);
            // 获取服务器返回结果
            if (res.data.code == -1) {
              this.$toast("手机号已经被注册");
            } else if (res.data.code == 1) {
              this.$toast("手机号可用");
            }
          });
        }
      }
    },
    emai() {
      if (this.email !== "") {
        // 用户名正则
        var regEmail = new RegExp(
          "([0-9A-Za-z-_.]+)@([0-9a-z]+.[a-z]{2,3}(.[a-z]{2})?)$",
          "g"
        );
        // 判断格式是否正确
        if (regEmail.test(this.email) === false) {
          this.$toast("邮箱格式不正确");
        }
      } else {
        // 获取邮箱
        var email = this.email;
        var obj = { email: email };
        this.axios("regist", { params: obj }).then(res => {
          // console.log(res);
          // 获取服务器返回结果
          if (res.data.code == -1) {
            this.$toast("邮箱已经被注册");
          } else if (res.data.code == 1) {
            this.$toast("邮箱可用");
          }
        });
      }
    },
    // 密码输入框失去焦点方法
    pwd() {
      if (this.upwd !== "") {
        // 密码正则
        var regPwd = new RegExp(/^[a-zA-Z0-9]{4,10}$/);
        // 判断格式是否正确
        if (regPwd.test(this.upwd) === false) {
          this.$toast("密码格式不正确");
        }
      }
    },
    reg() {
      // 获取用户名
      var phone = this.phone;
      // 获取邮箱
      var email = this.email;
      // 获取用户密码
      var upwd = this.upwd;
      // 传递的参数
      var obj;
      if (email === "") {
        var obj = { phone: phone, upwd: upwd };
      }
      // 用户名正则
      var regPhone = new RegExp(/^1[3456789]\d{9}$/);
      // 密码正则
      var regPwd = new RegExp(/^[a-zA-Z0-9]{4,10}$/);
      if (
        regPhone.test(this.phone) === true &&
        regPwd.test(this.upwd) == true
      ) {
        // 发送ajax请求

        this.axios("regist", { params: obj }).then(res => {
          // 获取服务器返回结果
          //   console.log(res);
          if (res.data.code == 1) {
            this.$router.push("/login");
          }
        });
      // } else {
      //   this.$toast("请输入正确的手机号和密码");
      }

      if (phone === "") {
        var obj = { email: email, upwd: upwd };
      }
      //   邮箱正则
      var regEmail = new RegExp(
        "^([0-9A-Za-z-_.]+)@([0-9a-z]+.[a-z]{2,3}(.[a-z]{2})?)$",
        "g"
      );
      // 密码正则
      var regPwd = new RegExp(/^[a-zA-Z0-9]{4,10}$/);
      if (
        regEmail.test(this.email) === true &&
        regPwd.test(this.upwd) == true
      ) {
          // 发送ajax请求
          this.axios("regist", { params: obj }).then(res => {
          // 获取服务器返回结果
          //   console.log(res);
          if (res.data.code == 1) {
            this.$router.push("/login");
          }
        });
        // } else {
        //   this.$toast("请输入正确的邮箱和密码");
      }
    }
  }
};
</script>

<style scoped>
/* logo容器 */
div.regist_logo {
  width: 100%;
  height: 200px;
  display: flex;
  align-items: center;
  justify-content: space-around;
}
/* logo */
div.regist_logo img {
  width: 100px;
}
/* span容器样式 */
div.regist_span {
  display: flex;
  justify-content: space-around;
  margin: 10px;
}
/* 文本输入框 */
div.regist_fld {
  margin: 25px 0px 40px 0px;
}
.fld {
  border: 1px solid #ccc;
  margin: 10px 0;
}
/* 按钮 */
div.regist_btn {
  text-align: center;
}
.btn {
  margin-top: 20px;
}
</style>
