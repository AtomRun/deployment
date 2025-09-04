SET NAMES utf8mb4;
use langu;
create table field
(
    field_id   int auto_increment comment '列id'
        primary key,
    source     varchar(32) not null,
    `table`    varchar(32) not null comment '数据库表',
    field      varchar(32) not null comment '数据库列实际名称',
    field_hump varchar(32) not null comment '字段驼峰展示',
    field_name varchar(32) not null comment '列中文名称'
);

create table `group`
(
    group_id      int auto_increment comment '主键id'
        primary key,
    name          varchar(32)                           not null comment '组名称',
    org_id        int                                   not null comment '组织id',
    created_by    varchar(32) default '0'               not null comment '创建人',
    modified_by   varchar(32)                           null comment '修改人',
    created_time  datetime    default CURRENT_TIMESTAMP not null comment '创建时间',
    modified_time datetime                              null comment '修改时间'
)
    comment '组';

create table menu
(
    menu_id         int unsigned auto_increment comment '自增id'
        primary key,
    name            varchar(32)                  not null comment '菜单名称',
    parent_id       int unsigned     default '0' not null comment '上级id，默认0',
    permission_code varchar(64)                  not null comment '权限标识',
    order_index     int unsigned                 not null comment '显示顺序',
    icon            varchar(255)                 null comment '菜单图标',
    route_url       varchar(255)                 null comment '路由地址',
    component_path  varchar(255)                 null comment '组件路径',
    memo            varchar(255)                 null comment '描述',
    res_type        tinyint unsigned             not null comment '资源类型：0-目录 1-菜单 2-按钮',
    hidden          tinyint unsigned default '0' not null comment '是否隐藏：0-否 1-是',
    auto_refresh    tinyint unsigned default '0' not null comment '是否自动刷新：0-否 1-是',
    is_frame        tinyint unsigned default '0' not null comment '是否为外链：0-否 1-是',
    status          tinyint unsigned default '0' not null comment '状态：0-正常 1-停用'
)
    comment '菜单表';

create index uk_product_perm_code
    on menu (permission_code);

create table org
(
    org_id        int auto_increment comment '组织id'
        primary key,
    name          varchar(32)                           not null comment '组织名称',
    created_by    varchar(32) default '0'               not null comment '创建人',
    modified_by   varchar(32)                           null comment '修改人',
    created_time  datetime    default CURRENT_TIMESTAMP not null comment '创建时间',
    modified_time datetime                              null comment '修改时间'
)
    comment '组织';

create table remote_site
(
    id                      int auto_increment
        primary key,
    group_id                int                                   not null comment '小组id',
    remote                  varchar(32)                           null comment '远程',
    site_name               varchar(255)                          null comment '站点名称',
    store_name              varchar(32)                           null comment '店铺名称',
    platform                varchar(100)                          null comment '注册平台',
    login_pwd               varchar(255)                          null comment '登录密码',
    manager                 varchar(100)                          null comment '店铺负责人',
    bound_phone             varchar(255)                          null comment '店铺绑定手机号',
    bound_phone_real_name   varchar(32)                           null comment '店铺绑定手机号实名人',
    status                  varchar(50)                           null comment '店铺状态',
    fee                     decimal(10, 2)                        null comment '店铺费用',
    registered              tinyint(1)                            null comment '是否注册成功',
    company_name            varchar(255)                          null comment '公司名称',
    legal_rep               varchar(100)                          null comment '法人',
    contact_phone           varchar(50)                           null comment '联系电话',
    agent                   varchar(100)                          null comment '代办人',
    license_fee             decimal(10, 2)                        null comment '注册执照费用',
    accounting              varchar(32)                           null comment '是否代理记账',
    accounting_period       varchar(50)                           null comment '代账周期',
    annual_report           varchar(32)                           null comment '是否有年报',
    contract                tinyint(1)                            null comment '合同',
    referrer                varchar(100)                          null comment '介绍人',
    deactivation_date       date                                  null comment '停用时间',
    registration_date       date                                  null comment '注册时间',
    delivery_date           date                                  null comment '交付时间',
    payment_password        varchar(255)                          null comment '支付密码',
    user_code               varchar(100)                          null comment '用户编码',
    email                   varchar(255)                          null comment '邮箱',
    email_password          varchar(255)                          null comment '邮箱密码',
    email_phone             varchar(50)                           null comment '绑定手机号',
    email_phone_real_name   varchar(32)                           null comment '邮箱绑定手机号实名人',
    phone_owner             varchar(100)                          null comment '手机号归属人',
    credit_card_number      varchar(50)                           null comment '信用卡号',
    credit_card_holder      varchar(100)                          null comment '持卡人',
    credit_card_expiry      varchar(10)                           null comment '有效期',
    vcc_number              varchar(50)                           null comment 'VCC号',
    otp_code                varchar(50)                           null comment '二步验证OTP码',
    payment_platform        varchar(100)                          null comment '绑定收款平台',
    payment_device          varchar(255)                          null comment '绑定设备',
    payment_phone_owner     varchar(100)                          null comment '归属人',
    payment_email           varchar(255)                          null comment '绑定邮箱',
    payment_email_password  varchar(255)                          null comment '邮箱密码',
    payment_login_password  varchar(255)                          null comment '登录密码',
    payment_phone           varchar(32)                           null comment '收款绑定手机号',
    payment_phone_real_name varchar(32)                           null comment '收款绑定手机号实名人',
    bank_name               varchar(255)                          null comment '开户行',
    bank_account            varchar(50)                           null comment '银行卡号',
    bank_holder             varchar(100)                          null comment '持卡人',
    enabled                 tinyint(1)                            null comment '是否启用',
    closed                  tinyint(1)                            null comment '是否注销',
    account_type            varchar(10)                           null comment '账户类型（主/子）',
    collected               tinyint(1)                            null comment '是否归集',
    amazon_fee              decimal(10, 2)                        null comment '亚马逊资料使用费',
    walmart_fee             decimal(10, 2)                        null comment '沃尔玛资料使用费',
    mercado_libre_fee       decimal(10, 2)                        null comment '美客多资料使用费',
    second_year_fee         decimal(10, 2)                        null comment '第二年资料使用费',
    progress                varchar(50)                           null comment '进度状态',
    remark                  text                                  null comment '备注',
    created_by              varchar(32) default '0'               not null comment '创建人',
    modified_by             varchar(32)                           null comment '修改人',
    created_time            datetime    default CURRENT_TIMESTAMP not null comment '创建时间',
    modified_time           datetime                              null comment '修改时间'
)
    comment '远程站点和公司信息表';

create table role
(
    role_id       int auto_increment comment '角色id'
        primary key,
    role_code     varchar(32)                           null comment '角色码',
    is_admin      int                                   not null comment '是否是超管',
    role_name     varchar(32)                           not null comment '角色名称',
    created_by    varchar(32) default '0'               not null comment '创建人',
    modified_by   varchar(32)                           null comment '修改人',
    created_time  datetime    default CURRENT_TIMESTAMP not null comment '创建时间',
    modified_time datetime                              null comment '修改时间'
)
    comment '角色表';

create table role_field
(
    id       int auto_increment comment '关系主键id'
        primary key,
    role_id  int not null comment '角色id',
    field_id int not null comment '列名称'
)
    comment '角色和列关联表';

create table role_menu
(
    auto_id int unsigned auto_increment comment '自增id'
        primary key,
    role_id int unsigned not null comment '角色id',
    menu_id int unsigned not null comment '菜单id',
    constraint uk_role_id_menu_id
        unique (role_id, menu_id)
)
    comment '角色菜单表';

create table user
(
    user_id       int auto_increment comment '用户id'
        primary key,
    name          varchar(32)                           not null comment '名称',
    phone         varchar(32)                           not null comment '手机号',
    pwd           varchar(32)                           not null comment '密码',
    created_by    varchar(32) default '0'               not null comment '创建人',
    modified_by   varchar(32)                           null comment '修改人',
    created_time  datetime    default CURRENT_TIMESTAMP not null comment '创建时间',
    modified_time datetime                              null comment '修改时间'
)
    comment '用户';

create index user_phone_index
    on user (phone);

create index user_user_id_phone_name_index
    on user (user_id, phone, name);

create table user_group
(
    id       int auto_increment comment '主键id'
        primary key,
    user_id  int not null comment '用户id',
    group_id int not null comment '组id'
)
    comment '用户组关系';

create table user_role
(
    id      int auto_increment comment '主键id'
        primary key,
    user_id int not null comment '用户id',
    role_id int not null comment '角色id'
)
    comment '用户角色分配表';

INSERT INTO langu.field (field_id, source, `table`, field, field_hump, field_name)
VALUES (1, 'STORE', 'remote_site', 'remote', 'remote', '远程'),
       (2, 'STORE', 'remote_site', 'site_name', 'siteName', '站点名称'),
       (3, 'STORE', 'remote_site', 'store_name', 'storeName', '店铺名称'),
       (4, 'STORE', 'remote_site', 'platform', 'platform', '注册平台'),
       (5, 'STORE', 'remote_site', 'login_pwd', 'loginPwd', '登录密码'),
       (6, 'STORE', 'remote_site', 'manager', 'manager', '店铺负责人'),
       (7, 'STORE', 'remote_site', 'bound_phone', 'boundPhone', '店铺绑定手机号'),
       (8, 'STORE', 'remote_site', 'bound_phone_real_name', 'boundPhoneRealName', '店铺绑定手机号实名人'),
       (9, 'STORE', 'remote_site', 'status', 'status', '店铺状态'),
       (10, 'STORE', 'remote_site', 'fee', 'fee', '店铺费用'),
       (11, 'STORE', 'remote_site', 'registered', 'registered', '是否注册成功'),
       (12, 'STORE', 'remote_site', 'company_name', 'companyName', '公司名称'),
       (13, 'STORE', 'remote_site', 'legal_rep', 'legalRep', '法人'),
       (14, 'STORE', 'remote_site', 'contact_phone', 'contactPhone', '联系电话'),
       (15, 'STORE', 'remote_site', 'agent', 'agent', '代办人'),
       (16, 'STORE', 'remote_site', 'license_fee', 'licenseFee', '注册执照费用'),
       (17, 'STORE', 'remote_site', 'accounting', 'accounting', '是否代理记账'),
       (18, 'STORE', 'remote_site', 'accounting_period', 'accountingPeriod', '代账周期'),
       (19, 'STORE', 'remote_site', 'annual_report', 'annualReport', '是否有年报'),
       (20, 'STORE', 'remote_site', 'contract', 'contract', '合同'),
       (21, 'STORE', 'remote_site', 'referrer', 'referrer', '介绍人'),
       (22, 'STORE', 'remote_site', 'deactivation_date', 'deactivationDate', '停用时间'),
       (23, 'STORE', 'remote_site', 'registration_date', 'registrationDate', '注册时间'),
       (24, 'STORE', 'remote_site', 'delivery_date', 'deliveryDate', '交付时间'),
       (25, 'STORE', 'remote_site', 'payment_password', 'paymentPassword', '支付密码'),
       (26, 'STORE', 'remote_site', 'user_code', 'userCode', '用户编码'),
       (27, 'STORE', 'remote_site', 'email', 'email', '邮箱'),
       (28, 'STORE', 'remote_site', 'email_password', 'emailPassword', '邮箱密码'),
       (29, 'STORE', 'remote_site', 'email_phone', 'emailPhone', '绑定手机号'),
       (30, 'STORE', 'remote_site', 'email_phone_real_name', 'emailPhoneRealName', '邮箱绑定手机号实名人'),
       (31, 'STORE', 'remote_site', 'phone_owner', 'phoneOwner', '手机号归属人'),
       (32, 'STORE', 'remote_site', 'credit_card_number', 'creditCardNumber', '信用卡号'),
       (33, 'STORE', 'remote_site', 'credit_card_holder', 'creditCardHolder', '持卡人'),
       (34, 'STORE', 'remote_site', 'credit_card_expiry', 'creditCardExpiry', '有效期'),
       (35, 'STORE', 'remote_site', 'vcc_number', 'vccNumber', 'VCC号'),
       (36, 'STORE', 'remote_site', 'otp_code', 'otpCode', '二步验证OTP码'),
       (37, 'STORE', 'remote_site', 'payment_platform', 'paymentPlatform', '绑定收款平台'),
       (38, 'STORE', 'remote_site', 'payment_device', 'paymentDevice', '绑定设备'),
       (39, 'STORE', 'remote_site', 'payment_phone_owner', 'paymentPhoneOwner', '归属人'),
       (40, 'STORE', 'remote_site', 'payment_email', 'paymentEmail', '绑定邮箱'),
       (41, 'STORE', 'remote_site', 'payment_email_password', 'paymentEmailPassword', '邮箱密码'),
       (42, 'STORE', 'remote_site', 'payment_login_password', 'paymentLoginPassword', '登录密码'),
       (43, 'STORE', 'remote_site', 'payment_phone', 'paymentPhone', '收款绑定手机号'),
       (44, 'STORE', 'remote_site', 'payment_phone_real_name', 'paymentPhoneRealName', '收款绑定手机号实名人'),
       (45, 'STORE', 'remote_site', 'bank_name', 'bankName', '开户行'),
       (46, 'STORE', 'remote_site', 'bank_account', 'bankAccount', '银行卡号'),
       (47, 'STORE', 'remote_site', 'bank_holder', 'bankHolder', '持卡人'),
       (48, 'STORE', 'remote_site', 'enabled', 'enabled', '是否启用'),
       (49, 'STORE', 'remote_site', 'closed', 'closed', '是否注销'),
       (50, 'STORE', 'remote_site', 'account_type', 'accountType', '账户类型（主/子）'),
       (51, 'STORE', 'remote_site', 'collected', 'collected', '是否归集'),
       (52, 'STORE', 'remote_site', 'amazon_fee', 'amazonFee', '亚马逊资料使用费'),
       (53, 'STORE', 'remote_site', 'walmart_fee', 'walmartFee', '沃尔玛资料使用费'),
       (54, 'STORE', 'remote_site', 'mercado_libre_fee', 'mercadoLibreFee', '美客多资料使用费'),
       (55, 'STORE', 'remote_site', 'second_year_fee', 'secondYearFee', '第二年资料使用费'),
       (56, 'STORE', 'remote_site', 'progress', 'progress', '进度状态'),
       (57, 'STORE', 'remote_site', 'remark', 'remark', '备注');

INSERT INTO langu.menu (menu_id, name, parent_id, permission_code, order_index, icon, route_url, component_path, memo,
                        res_type, hidden, auto_refresh, is_frame, status)
VALUES (1, '组织列表', 0, 'manage:org:page', 1, null, null, null, null, 1, 0, 0, 0, 0),
       (2, '成员管理', 0, 'manage:user:page', 1, null, null, null, null, 1, 0, 0, 0, 0),
       (3, '角色管理', 0, 'manage:role:page', 1, null, null, null, null, 1, 0, 0, 0, 0);

INSERT INTO langu.role (role_id, role_code, is_admin, role_name, created_by, modified_by, created_time, modified_time)
VALUES (1, 'admin', 1, '超管', '0', null, now(), null),
       (2, 'supervisor', 0, '主管', '0', null, now(), null),
       (3, 'crew', 0, '组员', '0', null, now(), null);

INSERT INTO langu.user (user_id, name, phone, pwd, created_by, modified_by, created_time, modified_time)
VALUES (1, '超管', '17719879365', 'CD250C36CBDD71592C9E0E35DB184E4E', '0', null, now(), null);


INSERT INTO langu.user_role (user_id, role_id)
VALUES (1, 1);
