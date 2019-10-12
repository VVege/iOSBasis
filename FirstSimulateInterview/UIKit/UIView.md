#  UIView

## layoutSubviews触发
1.直接调用[self setNeedsLayout]，但并不会立即调用，而是在下一次屏幕刷新时调用
，立即调用需加上 layoutIfNeed

2. addSubview

3.改变Frame与上次不同

4.scrollView滑动

5.横竖屏切换

## UIView和CALayer的关系
1.UIView负责响应时间，layer负责绘制UI
2.UIView封装了CALayer的部分方法，更细致的还需要调用layer，如圆角等
3.CALayer作为UIView的属性，UIView实现了CALayerDelegate



