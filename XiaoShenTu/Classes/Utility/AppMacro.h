//
//  AppMacro.h
//  Biyouwoshi
//
//  Created by zjw on 15/8/28.
//  Copyright (c) 2015年 BU54. All rights reserved.
//

#ifndef Biyouwoshi_AppMacro_h
#define Biyouwoshi_AppMacro_h

typedef enum
{
    
    CaoZuoIndex = 0,
    PaiMingIndex,
    WDDingYueIndex,
    GuanLiIndex
    
} StrategyTitleType;

/****UI常量***/
#define SCREEN_WIDTH                ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT               ([UIScreen mainScreen].bounds.size.height)
#define STATUS_BAR_HEIGHT           20
#define NAVI_BAR_HEIGHT             44
#define NAVI_BAR_TITLE_WIDTH        200
#define TOOL_BAR_HEIGHT             44
#define MARQUEEVIEW_HEIGHT          26

#define NAV_ITEM_BORDER             10
#define NAV_ITEM_WIDTH              30
#define NAV_ITEM_HEIGHT             30
#define RIGHT_BARBUTTONITEM_OFFSET  5
#define PUB_ALPHA                   1.0f
#define PUB_CORNER_RADIUS           3.0f
#define PUB_BORDERWIDTH             .5f
#define PUB_BORDERCOLOR_CGCOLOR     PUB_BORDERCOLOR.CGColor
#define PUB_BORDERCOLOR             HEXCOLOR(@"eaeaea")
#define SELF_HEIGHT SCREEN_WIDTH * 375 / 750


#define PUB_BASECELL_LEFT_TITILECOLOR [UIColor colorWithHexString:@"#333333"]
#define PUB_BASECELL_RIGHT_TITILECOLOR [UIColor colorWithHexString:@"#888888"]
#define PUB_BASECELL_LEFT_FONTSIZE  kFontSize15
#define PUB_BASECELL_RIGHT_FONTSIZE kFontSize12
#define  PUB_BASECELL_HEIGHT 50

//public间隔
#define kInterval10                   10.f
#define KPersonCenterBtnW           50.f
#define KPersonCenterBtnH           35.f

#define KTeacherInfoImageWH         72.F

#define CITYSDATA                   @"bu54_city"
#define KCOLORA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define KCOLOR(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]


#define NAV_CONTENT_HEIGHT        (SCREEN_HEIGHT-STATUS_BAR_HEIGHT-NAVI_BAR_HEIGHT-TOOL_BAR_HEIGHT-MARQUEEVIEW_HEIGHT)

#define HEADER_TABBAR_HEIGHT        44

#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size)||CGSizeEqualToSize(CGSizeMake(320, 480), [[UIScreen mainScreen] currentMode].size)) : NO)

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)


#define is_ios6  [[[UIDevice currentDevice]systemVersion] floatValue]<7

#define is_ios7  [[[UIDevice currentDevice]systemVersion] floatValue]>=7

#define is_ios8  [[[UIDevice currentDevice]systemVersion] floatValue]>=8

#define is_ios9 [[[UIDevice currentDevice] systemVersion] floatValue]>=9



#define checkNull(__X__) [(__X__)isEqual:[NSNull null]] || (__X__) == nil ? @"" : [NSString stringWithFormat:@"%@", (__X__)]


#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

//判断屏幕是否为iPhone4
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)

#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

//边距
#define SIDEWIDTH  15

//tableView的箭头的宽度
#define TableViewCellArrowWidth [SideWidthManager returnTableViewRightArrowWidth]


#define UILabelAlignmentLeft    0
#define UILabelAlignmentCenter  1//@"UITextAlignmentCenter"
#define UILabelAlignmentRight   2

#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define NightTitelColor [UIColor colorWithHexString:@"#adadad"]//夜间模式 列表内容颜色
#define imageColor [UIColor colorWithRed:0.89   green:0.89 blue:0.89 alpha:1];//tableVIew背景 白天
#define nightImageColor RGBA(31, 31, 31, 1)////tableVIew背景 夜间

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define MAIN_COLOR [UIColor orangeColor]

/*********************
 *****颜色的宏定义****
 *******************/
#pragma mark-关于颜色的宏定义

#define NAV_BACKCOLOR [UIColor colorWithHexString:@"#50c291"]

//黑色（字色）
#define BLACK_COLOR [UIColor colorWithHexString:@"#333333"]

//灰色 （字色）
#define GRAY_COLOR_Word [UIColor colorWithHexString:@"#999999"]
#define GRAY_COLOR_Text [UIColor colorWithHexString:@"#888888"]

//灰色
#define GRAY_COLOR [UIColor colorWithHexString:@"#c7c7c7"]

//灰色（间隔线的颜色）
#define GRAY_COLOR_LINE [UIColor colorWithHexString:@"#eaeaea"]


//黄色
#define ORANGE_COLOR [UIColor colorWithHexString:@"#f39800"]

//绿色
#define GREEN_COLOR [UIColor colorWithHexString:@"77c830"]

//所有的底部视图的背景色-淡灰色
#define BOTTOM_COLOR [UIColor colorWithHexString:@"#fafafa"]

//所有TableView的浅灰色（背景色）--淡灰色
#define BACKGROUND_COLOR [UIColor colorWithRed:0.94f green:0.94f blue:0.94f alpha:1.00f]

#define LIGHT_GREY [UIColor colorWithHexString:@"999999"]
//所有边框的颜色
#define BORDER_COLOR [UIColor colorWithHexString:@"#b7b7b7"]


#define LINE_GRAY_COLOR [UIColor colorWithHexString:@"E3E3E3"]

//灰色边框的颜色
#define GRAY_BTN_COLOR [UIColor colorWithHexString:@"#cdcdcd"]

//半透明的白色背景
#define BG_WRITE_COLOR [UIColor colorWithRed:255 green:255 blue:255 alpha:PUB_ALPHA]

//按钮的背景色
#define PUB_BTN_COLOR [UIColor colorWithHexString:@"#3fc9cb"]

//按钮的背景图
#define PUB_BTN_BACKIMG [[UIImage imageNamed:@"pub_btn_bg"] stretchableImageWithLeftCapWidth:10 topCapHeight:11]
# define LOGOUT_BTN_COLOR  [UIColor colorWithHexString:@"#ec7070"]
/*
 *定义,却未使用的颜色(可能是外包定义的，没用谁用过)
 */
//cell选中颜色
#define CELL_SELECTEC_COLOR [UIColor colorWithHexString:@"#fdeacc"]
//登录绿色
#define kGREEN_COLOR RGBCOLOR(134, 204, 1)

//导航栏颜色
#define kORANGE_COLOR RGBA(243, 151, 0, 1)

//蓝色
#define kBLUE_COLOR RGBCOLOR(42, 179, 243)

//浅灰色
#define kLIGHTGRAY_COLOR RGBCOLOR(243, 243, 243)

#define MYBACKGROUND_COLOR [UIColor colorWithRed:0.84f green:0.84f blue:0.84f alpha:1.00f]



/*********************
 *****字体的宏定*******
 ********************/
#pragma mark-关于字体的宏定义

#define kFontSize40       [UIFont systemFontOfSize:40.f]
#define kFontSize30       [UIFont systemFontOfSize:30.f]
#define kFontSize25       [UIFont systemFontOfSize:25.f]
#define kFontSize22       [UIFont systemFontOfSize:22.f]
#define kFontSize20       [UIFont systemFontOfSize:20.f]
#define kFontSize19       [UIFont systemFontOfSize:19.f]
#define kFontSize18       [UIFont systemFontOfSize:18.f]
#define kFontSize17       [UIFont systemFontOfSize:17.f]
#define kFontSize16       [UIFont systemFontOfSize:16.f]
#define kFontSize15       [UIFont systemFontOfSize:15.f]
#define kFontSize14       [UIFont systemFontOfSize:14.f]
#define kFontSize13       [UIFont systemFontOfSize:13.f]
#define kFontSize12       [UIFont systemFontOfSize:12.f]
#define kFontSize11       [UIFont systemFontOfSize:11.f]
#define kFontSize9        [UIFont systemFontOfSize:9.f]
#define kFontSize8        [UIFont systemFontOfSize:8.f]
#define kFontSize7        [UIFont systemFontOfSize:7.f]

//字体（3种 大 中 小）
#define FONT_BIG [UIFont systemFontOfSize:32.0f/96*72]

#define FONT_MIDDLE [UIFont systemFontOfSize:26.0f/96*72]

#define FONT_SMALL [UIFont systemFontOfSize:20.0f/96*72]

#define kPPLEFT_OFFSET_WIDTH 30

//美工要求的字体-->iOS字体
#define KKFONT(x) [UIFont systemFontOfSize:(((x)/30.0)*15.0)]

//美工要求的字体-->iOS字体（加粗）
#define KKBoldFONT(x) [UIFont boldSystemFontOfSize:(((x)/30.0)*15.0)]


//当前窗口
#define kCUREENT_WINDOW [[UIApplication sharedApplication] keyWindow]
//版本号
#define kCURRENT_VERSION [[[NSBundle mainBundle]infoDictionary] objectForKey:@"CFBundleVersion"]

#define kWidth 100
#define kHeight 40

#define APP_NAME @"小神兔"

//网络错误
#define kSHOWNEWWORK_ERROR @"连接超时,请确认网络!"

//没有网络提示语
#define kNO_NETWORK_MESSAGE @"当前网络不可用，请检查网络连接!"

//本地闹钟
#define PLIST_PATH [NSString stringWithFormat:@"%@/Library/Caches/ClockCourseId.plist",NSHomeDirectory()]

//请求成功返回码 code
#define REQUEST_SUCCESS_CODE @"2001"

/**
 *  appfunc 枚举值
 *
 */

//linkmodel
#define LINK_MODEL_NATURE @"nature"
#define LINK_MODEL_HTML @"html"

//pushModel
#define PUSH_MODEL_DOTONLY @"dotonly"
#define PUSH_MODEL_NUMBER @"number"

//闪屏图片key
#define kSplash_Pic_Name  @"splash_image_name"

/****字体常量***/


#define TABBAR_FONT 15

#define kTEXTFIELD_PLACEHOLDER_FONT 15

/******************************************************************
 ***********   常用方法宏定义
 *******************************************************************/

#define CLOSE_MESSAGE [_progressHUD hide:YES];


#endif
