//
//  Cinema.h
//  CDMovie
//
//  Created by mac04 on 15/8/28.
//  Copyright (c) 2015年 mac04. All rights reserved.
//

#import "BaseModel.h"
/*
 {
 "lowPrice" : "40.00",
 "grade" : "8.8",
 "coord" : "116.36047,40.01433",
 "distance" : null,
 "address" : "北京市海淀区学清路甲8号，圣熙8号购物中心五层西侧。",
 "name" : "嘉华国际影城",
 "id" : "1396",
 "msg" : null,
 "districtId" : "1015",
 "tel" : "010-82732228",
 "isSeatSupport" : "1",
 "isCouponSupport" : "1",
 "isImaxSupport" : "0",
 "isGroupBuySupport" : "0",
 "circleName" : "五道口"
 }
 */
@interface Cinema : BaseModel
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *grade;
@property(nonatomic,copy)NSString *lowPrice;
@property(nonatomic,copy)NSString *address;
@property(nonatomic,copy)NSString *distance;
@property(nonatomic,copy)NSString *districtId;
@property(nonatomic,copy)NSString *isSeatSupport;//有座 1
@property(nonatomic,copy)NSString *isCouponSupport;//有券 1
@property(nonatomic,copy)NSString *isImaxSupport;//imax 1
@property(nonatomic,copy)NSString *isGroupBuySupport;//团购 1
@end
