module Constant
  URL_PREFIX = "http://demo.service.anjuliye.com"
  URL_PREFIX_DEMO2 = "http://demo.manage.anjuliye.com"
  ANJULIYE_PREFIX = "http://www.anjuliye.com"
  MAIN_URL = "http://demo.anjuliye.com"
  DATA_PREFIX = "http://demo.service.anjuliye.com"
  STYLE_PREFIX = "http://demo.data1.anjuliye.com"
  FUR_ROLE = "4" #家具厂商
  SYS_ROLE = "1" #系统管理员
  TD_ROLE = "5" #3D画图人员
  SER_ROLE = "3" #客服
  MANUFACTURER_STATUS = "1" #厂商

  SUITE_XML_URL = "http://roomeditordemo.anjuliye.com/suite_xml"
  UPLOADS_URL = "http://192.168.38.8:6500/upload"
  SUITE_XML_MODEL = 'http://roomeditordemo.anjuliye.com/HouseModel'

  #不用配置的菜单
  PERSONAL_INFO = "10000" #个人信息
  PER_MODIFY_PASSWORD = "10001" #修改密码
  FUR_MODIFY_PASSWORD = "10002" #厂商修改密码

  #权限
  ROLES = {

    #活动
    :activity => {
      :name => "活动管理",
      :submit => ["发布",1],
      :cheat => ["作弊",2],
      :add_flash =>["加flash",4],
      :delete => ["删除",8],
      :export => ["导出参与者",16],
      :create => ["创建活动",64]

    },

    #口碑反馈
    :feedback => {
      :name => "口碑反馈",
      :search => ["查询",1],
      :goto_send_message => ["发短信",2],
      :goto_complete => ["完成",4],
    },

    #户型纠错
    :mistake => {
      :name => "户型纠错",
      :search => ["查询",1],
      :goto_send_message => ["发短信",2],
      :goto_complete => ["完成",4],
    },

    #楼盘管理
    :land => {
      :name => "楼盘管理",
    	:show => ["查看楼盘", 1],
      :update => ["修改楼盘", 2],
      :unit_show => ["查看户型", 4],
      :unit_update => ["修改户型", 8],
      :search => ["查询", 16],
    },

    #月刊管理
    :magazine => {
    	:name => "月刊管理",
    	:delete => ["删除",1],
    	:submit => ["发布",2],
    },

    #图片审核
    :pic_audit => {
    	:name => "图片审核",
    	:pass => ["通过",1],
    	:replace => ["替换",2],
    	:clear => ["清空",4],
    	:restore => ["还原",8],
      :audit_report => ['查看审核统计',16],
      :replace_report => ['查看替换统计',32]
    },

    #新闻管理
    :upload => {
    	:name => "新闻管理",
      :reload => ["重新提交",1],
    	:delete => ["删除",2],
    	:submit => ["发布",4],
    },

    #权限管理
    :role => {
      :name => "权限管理",
      :create => ["添加角色",1],
      :modify => ["修改",2],
      :user_grouping => ["用户分组",4],
      :user_modify => ["调整角色",8],
      :password_modify => ["修改密码",16]
    },


    #户型管理
    :style => {
      :name => "户型管理",
      :show => ["查看户型",1],
      :need_update => ["需修改",2],
      :delete => ["删除",4],
      :publish => ["发布",8]
    },
    
    #家具管理
    :furniture => {
      :name => "家具管理",
      :export => ["导出安居魔卡",1]
    },
    #厂商信息
    :manufacture => {
      :name => "厂商信息",
      :update => ["修改厂商信息",1],
      :password => ["修改密码",2]
    }

  }

end
