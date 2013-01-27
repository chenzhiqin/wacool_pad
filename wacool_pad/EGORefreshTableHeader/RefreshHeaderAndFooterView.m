//
//  RefreshHeaderAndFooterView.m
//  hardy
//
//  Created by hardy on 13-1-8.
//  Copyright (c) 2013年 hardy. All rights reserved.
//

#import "RefreshHeaderAndFooterView.h"
#import <QuartzCore/QuartzCore.h>

#define RefreshViewWidth 65.0f
#define TEXT_COLOR	 [UIColor colorWithRed:87.0/255.0 green:108.0/255.0 blue:137.0/255.0 alpha:1.0]
#define FLIP_ANIMATION_DURATION 0.18f

/**************************************************************************************************
 *********************************RefreshHeaderView************************************************
 *************************************************************************************************/
@interface RefreshHeaderView()
@end

@implementation RefreshHeaderView
@synthesize state = _state;
- (id)initWithFrame:(CGRect)frame arrowImageName:(NSString *)arrow textColor:(UIColor *)textColor  {
    if((self = [super initWithFrame:frame])) {
		
		self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        self.backgroundColor = [UIColor colorWithRed:226.0/255.0 green:231.0/255.0 blue:237.0/255.0 alpha:1.0];
        self.backgroundColor = [UIColor clearColor];
       		
		UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
		label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
		label.font = [UIFont boldSystemFontOfSize:13.0f];
		label.textColor = textColor;
		label.shadowColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
		label.shadowOffset = CGSizeMake(0.0f, 1.0f);
		label.backgroundColor = [UIColor clearColor];
		label.textAlignment = UITextAlignmentCenter;
        
        label.lineBreakMode = UILineBreakModeWordWrap;
        label.numberOfLines = 0;
        
		[self addSubview:label];
		_statusLabel=label;
		[label release];
		
		CALayer *layer = [CALayer layer];
		layer.contentsGravity = kCAGravityResizeAspect;
		layer.contents = (id)[UIImage imageNamed:arrow].CGImage;
		
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 40000
		if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
			layer.contentsScale = [[UIScreen mainScreen] scale];
		}
#endif
		
		[[self layer] addSublayer:layer];
		_arrowImage=layer;
		
		UIActivityIndicatorView *view = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
		[self addSubview:view];
		_activityView = view;
		[view release];
		
		
		[self setState:PullRefreshNormal];
		
    }
	
    return self;
	
}

- (id)initWithFrame:(CGRect)frame  {
    return [self initWithFrame:frame arrowImageName:@"blueArrow.png" textColor:TEXT_COLOR];
}
-(void)layoutSubviews
{
    _statusLabel.frame = CGRectMake(self.frame.size.width - 65.0f, 0.0f, 20.0f, self.frame.size.height);
    _arrowImage.frame = CGRectMake(self.frame.size.width  - 65.0f, 25.0f, 55.0f, 30.0f);
    _activityView.frame = CGRectMake(self.frame.size.width  - 65.0f, 25.0f, 20.0f, 20.0f);
}
#pragma mark -
#pragma mark Setters


- (void)setState:(PullRefreshState)state{
	if (_state != state) {
        _state = state;
          NSLog(@"RefreshHeaderView state = %d",_state);
        switch (state) {
            case PullRefreshPulling:
                
                _statusLabel.text = NSLocalizedString(@"松开手指刷新", @"松开手指刷新");
                [CATransaction begin];
                [CATransaction setAnimationDuration:FLIP_ANIMATION_DURATION];
                _arrowImage.transform = CATransform3DMakeRotation((M_PI / 180.0) * 180.0f, 0.0f, 0.0f, 1.0f);
                [CATransaction commit];
                
                break;
            case PullRefreshNormal:
                
                if (_state == PullRefreshPulling) {
                    [CATransaction begin];
                    [CATransaction setAnimationDuration:FLIP_ANIMATION_DURATION];
                    _arrowImage.transform = CATransform3DIdentity;
                    [CATransaction commit];
                }
                
                _statusLabel.text = NSLocalizedString(@"下拉刷新", @"下拉刷新");
                [_activityView stopAnimating];
                [CATransaction begin];
                [CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions];
                _arrowImage.hidden = NO;
                _arrowImage.transform = CATransform3DIdentity;
                [CATransaction commit];
                
                break;
            case PullRefreshLoading:
                
                _statusLabel.text = NSLocalizedString(@"努力加载中", @"努力加载中");
                [_activityView startAnimating];
                [CATransaction begin];
                [CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions];
                _arrowImage.hidden = YES;
                [CATransaction commit];
                
                break;
            default:
                break;
        }
    }
}
#pragma mark -
#pragma mark Dealloc

- (void)dealloc {
	
	_activityView = nil;
	_statusLabel = nil;
	_arrowImage = nil;
    [super dealloc];
}
@end

/**************************************************************************************************
 *********************************RefreshFooterView************************************************
 *************************************************************************************************/
@interface RefreshFooterView ()

@end

@implementation RefreshFooterView
@synthesize state =_state;
- (id)initWithFrame:(CGRect)frame arrowImageName:(NSString *)arrow textColor:(UIColor *)textColor
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
		self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        self.backgroundColor = [UIColor clearColor];
		
		UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
		label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
		label.font = [UIFont boldSystemFontOfSize:13.0f];
		label.textColor = textColor;
		label.shadowColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
		label.shadowOffset = CGSizeMake(0.0f, 1.0f);
		label.backgroundColor = [UIColor clearColor];
		label.textAlignment = UITextAlignmentCenter;
        label.lineBreakMode = UILineBreakModeWordWrap;
        label.numberOfLines = 0;
		[self addSubview:label];
		_statusLabel=label;
		[label release];
		
        CALayer *layer = [CALayer layer];
		layer.contentsGravity = kCAGravityResizeAspect;
		layer.contents = (id)[UIImage imageNamed:arrow].CGImage;
		
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 40000
		if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
			layer.contentsScale = [[UIScreen mainScreen] scale];
		}
#endif
		
		[[self layer] addSublayer:layer];
		_arrowImage=layer;
        
		UIActivityIndicatorView *view = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
		[self addSubview:view];
		_activityView = view;
		[view release];
		[self setState:PullRefreshNormal];
        
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame  {
    return [self initWithFrame:frame arrowImageName:@"blueArrow.png" textColor:TEXT_COLOR];
}
-(void)layoutSubviews
{
    _statusLabel.frame = CGRectMake(0.0f, 0.0f,20.0f, self.frame.size.height);
    _activityView.frame = CGRectMake(0.0f,25.0f, 20.0f, 20.0f);
    _arrowImage.frame = CGRectMake(0.0f, 25.0f, 55.0f,30.0f);
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */
- (void)setState:(PullRefreshState)state{
	if (_state != state) {
        _state = state;
       
        switch (state) {
            case PullRefreshPulling:
                
                _statusLabel.text = NSLocalizedString(@"松开手指加载更多", @"松开手指加载更多");
                [CATransaction begin];
                [CATransaction setAnimationDuration:FLIP_ANIMATION_DURATION];
                _arrowImage.transform = CATransform3DMakeRotation((M_PI / 180.0) * 180.0f, 0.0f, 0.0f, 1.0f);
                [CATransaction commit];
                
                break;
            case PullRefreshNormal:
                
                if (_state == PullRefreshPulling) {
                    [CATransaction begin];
                    [CATransaction setAnimationDuration:FLIP_ANIMATION_DURATION];
                    _arrowImage.transform = CATransform3DIdentity;
                    [CATransaction commit];
                }
                _statusLabel.text = NSLocalizedString(@"上拉加载", @"上拉加载");
                [_activityView stopAnimating];
                
                [CATransaction begin];
                [CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions];
                _arrowImage.hidden = NO;
                _arrowImage.transform = CATransform3DIdentity;
                [CATransaction commit];
                
                break;
            case PullRefreshLoading:
                
                _statusLabel.text = NSLocalizedString(@"努力加载", @"努力加载");
                [_activityView startAnimating];
                [CATransaction begin];
                [CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions];
                _arrowImage.hidden = YES;
                [CATransaction commit];
                
                break;
            default:
                break;
        }
	}
}
#pragma mark -
#pragma mark Dealloc

- (void)dealloc {
    
    _arrowImage = nil;
	_activityView = nil;
	_statusLabel = nil;
    [super dealloc];
}

@end

/**************************************************************************************************
 *********************************RefreshHeaderAndFooterView***************************************
 *************************************************************************************************/
@interface RefreshHeaderAndFooterView ()
@end

@implementation RefreshHeaderAndFooterView
@synthesize refreshHeaderView = _refreshHeaderView;
@synthesize refreshFooterView = _refreshFooterView;
@synthesize delegate =_delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        RefreshHeaderView * headerView  = [[RefreshHeaderView alloc] initWithFrame:CGRectZero];
        [self addSubview:headerView];
        self.refreshHeaderView = headerView;
        [headerView release];
        
        RefreshFooterView * footerView = [[RefreshFooterView alloc] initWithFrame:CGRectZero];
        [self addSubview:footerView];
        self.refreshFooterView = footerView;
        [footerView release];
    }
    return self;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */
-(void)layoutSubviews{
    NSLog(@"self.frame.size.width = %f , self.frame.size.height = %f ",self.frame.size.width,self.frame.size.height);
    self.refreshHeaderView.frame = CGRectMake(0 -  self.frame.size.width, 0, self.frame.size.width, self.frame.size.height);
    self.refreshFooterView.frame = CGRectMake(self.frame.size.width,0, self.frame.size.width, self.frame.size.height);
}

-(void)updateFooterLayout:(CGRect)frame{
//    self = [super initWithFrame:frame];
//    self.refreshFooterView.frame = CGRectMake(frame.size.width,0, frame.size.width, frame.size.height);
//    [self setFrame:frame];

}

#pragma mark -
#pragma mark ScrollView Methods
//手指屏幕上不断拖动调用此方法
- (void)RefreshScrollViewDidScroll:(UIScrollView *)scrollView {
   
	
	if (self.refreshHeaderView.state == PullRefreshLoading || self.refreshFooterView.state == PullRefreshLoading) {
		return;
	}
    if (scrollView.isDragging) {
		
		BOOL _loading = NO;
		if ([_delegate respondsToSelector:@selector(RefreshHeaderAndFooterDataSourceIsLoading:)]) {
			_loading = [self.delegate RefreshHeaderAndFooterDataSourceIsLoading:self];
		}
		if (self.refreshHeaderView.state == PullRefreshPulling && scrollView.contentOffset.x > -65.0f && scrollView.contentOffset.x < 0.0f && !_loading) {
			self.refreshHeaderView.state = PullRefreshNormal;
		} else if (self.refreshHeaderView.state == PullRefreshNormal && scrollView.contentOffset.x < -65.0f && !_loading) {
			self.refreshHeaderView.state = PullRefreshPulling;
		}
        if (scrollView.contentInset.left != 0) {
			scrollView.contentInset = UIEdgeInsetsZero;
		}
		if (self.refreshFooterView.state == PullRefreshPulling && scrollView.contentOffset.x + (scrollView.frame.size.width) < scrollView.contentSize.width + RefreshViewWidth && scrollView.contentOffset.x > 0.0f && !_loading) {
			self.refreshFooterView.state = PullRefreshNormal;
		} else if (self.refreshFooterView.state == PullRefreshNormal &&  scrollView.contentOffset.x + (scrollView.frame.size.width) > scrollView.contentSize.width + RefreshViewWidth  && !_loading) {
			self.refreshFooterView.state = PullRefreshPulling;
		}
		
		if (scrollView.contentInset.right != 0) {
			scrollView.contentInset = UIEdgeInsetsZero;
		}
		
	}
	
}
//当用户停止拖动，并且手指从屏幕中拿开的的时候调用此方法
- (void)RefreshScrollViewDidEndDragging:(UIScrollView *)scrollView {
  
	if (self.refreshHeaderView.state == PullRefreshLoading || self.refreshFooterView.state == PullRefreshLoading) {
		return;
	}
	BOOL _loading = NO;
	if ([_delegate respondsToSelector:@selector(RefreshHeaderAndFooterDataSourceIsLoading:)]) {
		_loading = [_delegate RefreshHeaderAndFooterDataSourceIsLoading:self];
	}
    
    if (scrollView.contentOffset.x <= - 65.0f && !_loading) {
		self.refreshHeaderView.state = PullRefreshLoading;
		if ([_delegate respondsToSelector:@selector(RefreshHeaderAndFooterDidTriggerRefresh:)]) {
			[_delegate RefreshHeaderAndFooterDidTriggerRefresh:self];
		}
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:0.2];
        scrollView.contentInset = UIEdgeInsetsMake(0.0f,RefreshViewWidth, 0.0f, 0.0f);
		[UIView commitAnimations];
        
	}
    
	if (scrollView.contentOffset.x + (scrollView.frame.size.width) > scrollView.contentSize.width + RefreshViewWidth && !_loading) {
		self.refreshFooterView.state = PullRefreshLoading;
		if ([_delegate respondsToSelector:@selector(RefreshHeaderAndFooterDidTriggerRefresh:)]) {
			[_delegate RefreshHeaderAndFooterDidTriggerRefresh:self];
		}
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:0.2];
        scrollView.contentInset = UIEdgeInsetsMake(0.0f, 0.0f, 0.0f, RefreshViewWidth);
		[UIView commitAnimations];
		
	}
	
}
//当开发者页面页面刷新完毕调用此方法，[delegate RefreshScrollViewDataSourceDidFinishedLoading: scrollView];
- (void)RefreshScrollViewDataSourceDidFinishedLoading:(UIScrollView *)scrollView {
    NSLog(@"DidFinishedLoading");
    if (self.refreshHeaderView.state ==PullRefreshLoading) {
        self.refreshHeaderView.state = PullRefreshNormal;
        NSDate *date = [NSDate date];
        if ([_delegate respondsToSelector:@selector(RefreshHeaderAndFooterDataSourceLastUpdated:)]) {
            date = [_delegate RefreshHeaderAndFooterDataSourceLastUpdated:self];
        }
    }
    else if (self.refreshFooterView.state ==PullRefreshLoading) {
        self.refreshFooterView.state = PullRefreshNormal;
    }
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:.3];
	[scrollView setContentInset:UIEdgeInsetsMake(0.0f, 0.0f, 0.0f, 0.0f)];
	[UIView commitAnimations];
}
#pragma mark -
#pragma mark Dealloc

- (void)dealloc {
    
    self.delegate = nil;
	self.refreshHeaderView = nil;
	self.refreshFooterView = nil;
    [super dealloc];
}
@end
