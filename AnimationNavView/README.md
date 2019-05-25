## 國泰UI動物園作業實作
#### 林子勛 2018/11/12

[Github: AnimationNavView](https://github.com/wangdu1005/AnimationNavView/tree/develop/AnimationNavView)

### 本次作業，重點著重在UI畫面的完整呈現：盡量完整還原國泰優惠app在帳戶畫面NavHeader各元件的互動

### 完成部分：

1. 整體NavHeader元件的互動 包含加分題
2. TableViewCell Xib Autolayout設定

### 未完成部分：

1. DataSource與TableView的資料傳遞
2. 向下滑動讀取更多資料的offset, limit feature.

### 感想：

花費較多時間，希望能夠完整呈現UI的互動，因此甚至動員photoshop工具去消除原先的畫面截圖，並且重新套用在自己的練習程式。

但是無時間好好整理資料請求的部分，因為Objective-C較長時間沒有練習，寫起來較為吃力。

不過資料讀取的分頁機制，我已使用Swift 4.2在 巷神app 實踐，而目前巷神app已將在App Store上架，倘若可以在複試現場解說分頁機制，我會準備詳細的資料。

### 技術學習筆記：

If there has any new task assign to me that I never done before, I will go through the learning process as below to pick it up.

Step	Process 	Resource	Platform 	Note

1.	Watching Video tutorial		YouTube	
2.	Reading Other developer learning note		Google	
3.	Searching Similar Third Party		GitHub	
4.	Reading Tech Documentation		Google	
5.	Analysis Demo project		XCode	
6.	Try to code the demo by myself on test app		XCode	
7.	Implementing on existing products		XCode	
8.	Make issues note during development		OneNote	

### Why decide to use third party?

Becasue third party deal with more complex issues relate to different iOS SDK version, and device version. Maybe, we can success finished task on iOS 11.0 iPhone 8. But it could have bugs on iOS 12.0 iPhone XR.

### Why use [GSKStretchyHeaderView] third party?

a. Stars count, which means this tool is fit current iOS market demand.

b. Issues tracking, which means the developer willing keep improving the tool by listen up others advise.

c. Continuously active update, follow up iOS the newest platform and IDE

d. Compatibility with existing products
Self-development is relatively simple, which mean if we have time to self-develop that can create our same feature product. (Easy to maintain)