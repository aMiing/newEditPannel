<template>
	<el-row class="container">
		<el-col :span="24" class="header">
			<el-col :span="10" class="logo" :class="collapsed?'logo-collapse-width':'logo-width'">
				{{collapsed?'':sysName}}
			</el-col>
			<el-col :span="10">
				<div class="tools" @click.prevent="collapse">
					<i class="fa fa-align-justify"></i>
					<span style="float:left;">v1.0.0尝鲜版</span>
				</div>
			</el-col>
			<el-col :span="4" class="userinfo">
				<el-dropdown trigger="hover">
					<span class="el-dropdown-link userinfo-inner"><img :src="this.sysUserAvatar" /> {{sysUserName}}</span>
					<el-dropdown-menu slot="dropdown">
						<el-dropdown-item style="color:#6bf;font-size: 0.8em;">好久不见~<strong>Aming先森</strong></el-dropdown-item>
						<el-dropdown-item divided>我的消息<el-badge class="mark" :value="1" /></el-dropdown-item>
						<el-dropdown-item>设置</el-dropdown-item>
						<el-dropdown-item divided @click.native="logout">退出登录</el-dropdown-item>
					</el-dropdown-menu>
				</el-dropdown>
			</el-col>
		</el-col>
		<el-col :span="24" class="banner" style="width:100%;height:29%;overflow: hidden">
		  <el-carousel :interval="5000" indicator-position="none" arrow="never">
		    <el-carousel-item v-for="item in bannerImg" :key="item">
		      <img :src="item" alt="" width="100%" height="120%">
		    </el-carousel-item>
		  </el-carousel>
		</el-col>
		<!-- 导航栏 -->		
		<el-col :span="24" class="leader">  
			<aside :class="collapsed?'menu-collapsed':'menu-expanded'">
				<!--导航菜单-->
				<el-menu :default-active="$route.path" mode="horizontal" class="el-menu-vertical-demo" @open="handleopen" @close="handleclose" @select="handleselect"
					 unique-opened router v-show="!collapsed">
					<template v-for="(item,index) in $router.options.routes" v-if="!item.hidden">
						<el-submenu :index="index+''" v-if="!item.leaf">
							<template slot="title"><i :class="item.iconCls"></i>{{item.name}}</template>
							<el-menu-item v-for="child in item.children" :index="child.path" :key="child.path" v-if="!child.hidden">{{child.name}}</el-menu-item>
						</el-submenu>
						<el-menu-item v-if="item.leaf&&item.children.length>0" :index="item.children[0].path"><i :class="item.iconCls"></i>{{item.children[0].name}}
						</el-menu-item>
					</template>
				</el-menu>
				<!-- 导航菜单-折叠后 -->
			</aside>
		</el-col>
		<el-col :span="24" class="main">
			<!-- 主区域呈现 -->
			<section class="content-container">
				<div class="grid-content bg-purple-light">
					<!-- <el-col :span="24" class="breadcrumb-container">
						<strong class="title"></strong>
						<el-breadcrumb separator="/" class="breadcrumb-inner">
							<el-breadcrumb-item v-for="item in $route.matched" :key="item.path">
								{{ item.name }}
							</el-breadcrumb-item>
						</el-breadcrumb>
					</el-col> -->
					<el-col :span="24" class="content-wrapper">
						<transition name="fade" mode="out-in">
							<router-view></router-view>
						</transition>
					</el-col>
				</div>
			</section>
		</el-col>
	</el-row>
</template>


<script>
	export default {
		data() {
			return {
				sysName:'VMS-BD',
				collapsed:false,
				sysUserName: '',
				sysUserAvatar: '',
				bannerImg:['../../static/banners/banner1.png','../../static/banners/banner1.png','../../static/banners/banner1.png']
			}
		},
		methods: {
			onSubmit() {
				console.log('submit!');
			},
			handleopen() {
				//console.log('handleopen');
			},
			handleclose() {
				//console.log('handleclose');
			},
			handleselect: function (a, b) {
			},
			//退出登录
			logout: function () {
				var _this = this;
				this.$confirm('确认退出吗?', '提示', {
					//type: 'warning'
				}).then(() => {
					sessionStorage.removeItem('user');
					_this.$router.push('/login');
				}).catch(() => {

				});


			},
			//折叠导航栏
			collapse:function(){
				//this.collapsed=!this.collapsed;
			},
			showMenu(i,status){
				// this.$refs.menuCollapsed.getElementsByClassName('submenu-hook-'+i)[0].style.display=status?'block':'none';
			}
		},
		mounted() {
			var user = sessionStorage.getItem('user');
			if (user) {
				user = JSON.parse(user);
				this.sysUserName = user.name || '';
				this.sysUserAvatar = user.avatar || '';
			}

		}
	}

</script>
<style>
.el-carousel__container{
	height:286px;
}
#addPannel>a{
	color:gray;
	cursor:pointer;
	text-decoration: none;
}
#addPannel:before{
	color:#43ccbf;
	text-decoration: none;
}

.el-card,.pannal{
 	width:240px;
 	height:230px;
 	margin:10px 20px 15px 0;
 }
 .time {
    font-size: 13px;
    color: #999;
  }
  .el-switch__label{
  	z-index: 0;
  }
  
  .bottom {
    margin-top: 13px;
    line-height: 12px;
  }

  .button {
    padding: 0;
    float: right;
  }

  .image {
    width: 100%;
    display: block;
  }

  .clearfix:before,
  .clearfix:after {
      display: table;
      content: "";
  }
  
  .clearfix:after {
      clear: both;
  }
  .leader{
		display:absolute;
		z-index:999; 
  }
  .el-tabs__item{
  	border:1px solid #171b22;
  }
  .el-tabs__item.is-active{
  	/* border-bottom: 1px solid rgba(60,180,255,0.1);
  	border-top: 1px solid rgba(60,180,255,0.1); */
  	 background: linear-gradient(to right, #000, #171b22);
  	 -webkit-background-clip: border-box;
  	/* color: transparent;*/
  }
  .el-tabs__item:hover{
  	/* border-bottom: 1px solid rgba(60,180,255,0.1);
  	border-top: 1px solid rgba(60,180,255,0.1); */
  }

</style>

<style scoped lang="scss">
	@import '~scss_vars';
	//設置小圖標
	.fa-align-justify:before{
		content: "\F124";
	}
 	/*滚动条样式*/
    ::-webkit-scrollbar {/*滚动条整体样式*/
        width: 5px;     /*高宽分别对应横竖滚动条的尺寸*/
        height: 5px;
    }
    ::-webkit-scrollbar-thumb {/*滚动条里面小方块*/
        border-radius: 5px;
        -webkit-box-shadow: inset 0 0 5px rgba(0,0,0,0.6);
        background: rgba(0,0,0,0.6);
    }
	//
	.container {

		background: #171b22 ;
		position: absolute;
		top: 0px;
		overflow-y: scroll;
		bottom: 0px;
		width: 100%;
		.header {
			position:fixed;
			z-index:99;
			height: 30px;
			line-height: 30px;
			background: rgba(66,60,74,0.2);
			color:#fff;
			.userinfo {
				text-align: right;
				padding-right: 35px;
				float: right;
				.userinfo-inner {
					cursor: pointer;
					color:#fff;
					img {
						width: 20px;
						height: 20px;
						border-radius: 10px;
						margin: 5px;
						float: right;
					}
				}
			}
			.logo {
				height:30px;
				font-size: 20px;
				text-align:center;
				padding-left:20px;
				padding-right:20px;
				img {
					width: 40px;
					float: left;
					margin: 10px 10px 10px 18px;
				}
				.txt {
					color:#fff;
				}
			}
			.logo-width{
				width:180px;
			}
			.logo-collapse-width{
				width:60px
			}
			.tools{
				padding: 0px 23px;
				
				height: 30px;
				line-height: 30px;
				cursor: pointer;
			}
		}
		.leader{
			aside{
				position:absolute;
				top:20%;
				z-index:99;
				margin-left:2%;
				.el-menu{
					font-size:4vw;
					background-color:none;
					li{
						/* width:160px; */
						color:#ddd;
						font-weight:600;

					}
				}
				.el-dropdown-menu__item--divided:before, .el-menu, .el-menu--horizontal>.el-menu-item:not(.is-disabled):focus, .el-menu--horizontal>.el-menu-item:not(.is-disabled):hover, .el-menu--horizontal>.el-submenu .el-submenu__title:hover{
					background:none;
				}
			}
		}
		.main {
			color:#fff;
			background: #171b22;
			position: relative;
			min-height:100%;
			.menu-collapsed{
				flex:0 0 60px;
				width: 60px;
			}
			.el-tabs__item:hover{
				background-color:#6bf;
			}
			.content-container {
				flex:1;
				overflow-y: scroll;
				padding: 20px;
				.content-wrapper{
					.el-tabs--left, .el-tabs--right{
						color:#fff;
						.el-tabs--left .el-tabs__header.is-left{
								width:200px;
							}
							.el-tabs--left .el-tabs__item.is-left{
								text-align:left;
							}
					}
				}
				.breadcrumb-container {
					.title {
						width: 200px;
						float: left;
						color: #475669;
					}
					.breadcrumb-inner {
						float: right;
					}
				}
				.content-wrapper {
					background-color: #fff;
					box-sizing: border-box;
				}
			}
		}
	}
</style>