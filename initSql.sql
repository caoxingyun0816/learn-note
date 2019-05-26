1.
alter table payment_additional add (create_time datetime DEFAULT current_timestamp() not null comment'创建时间');
alter  table payment_additional add (update_time timestamp DEFAULT current_timestamp() not null COMMENT'更新时间');
alter table payment_additional add (del tinyint(1) not null DEFAULT 0 comment'逻辑删除');

2.
create table payment_detail(
id varchar(32) comment '付款明细id',
waybill_id VARCHAR(32) comment '运单id',
payment_money DECIMAL(18,2) comment '付款金额',
status varchar(5) comment '付款状态',
invoice_id varchar(32) comment '发票id',
invoice_url varchar(500) comment '发票附件',
remark varchar(500) comment '备注',
apply_user varchar(256) comment '提交人',
create_time datetime DEFAULT current_timestamp() not null comment '创建时间',
update_time timestamp DEFAULT current_timestamp() not null COMMENT '更新时间',
del tinyint(1) not null DEFAULT 0 comment'逻辑删除',
PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '付款明细';

3.
update purchase_detail set good_payment = convert(order_quantity*3.21,decimal(10,2)) where id ='26613fcfd1f111e89a6745454664c73a'
convert(order_quantity*3.21,decimal(10,2)) 计算并保留两位小数

4.按中文字母排序
ORDER BY CONVERT(short_name using gbk)

5.ifnull(1,2);如果1为null，返回2,1不为null，返回1
IFNULL(a.invoice_sum,convert(a.price*a.actual_inStock),decimal(10,2))