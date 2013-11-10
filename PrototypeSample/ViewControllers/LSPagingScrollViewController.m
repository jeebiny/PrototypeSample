//
//  LSViewController.m
//  StoryboardPagingScrollView
//
//  Created by Lingostar on 12. 12. 4..
//  Copyright (c) 2012년 Lingostar. All rights reserved.
//

#import "LSPagingScrollViewController.h"

@interface LSPagingScrollViewController () <UIScrollViewDelegate>

@end

@implementation LSPagingScrollViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIScrollView *scrollView = [self.view viewWithTag:self.scrollViewTagNumber];
    UIPageControl *pageControl = [self.view viewWithTag:self.pageControlTagNumber];
    
    
    scrollView.delegate = self;
    
    int imageCount, leftOrigin;
    
    for (imageCount = 0; imageCount < 10; imageCount++) {
        NSString *imageFileName = [NSString stringWithFormat:@"%@_%d", self.scrollImageBaseName, imageCount+1];
        NSString *imageFilePath = [[NSBundle mainBundle] pathForResource:imageFileName ofType:@"jpg"];
        if (imageFilePath != nil){
            UIImage *pageImage = [[UIImage alloc] initWithContentsOfFile:imageFilePath];
            
            leftOrigin = imageCount*(self.scrollPageWidth+self.scrollPageSpace) + self.scrollPageSpace/2;
            CGRect rect = CGRectMake(leftOrigin, 10, self.scrollPageWidth, self.scrollPageHeight);
            UIImageView *pageContent = [[UIImageView alloc] initWithFrame:rect];
            pageContent.image = pageImage;
            [scrollView addSubview:pageContent];
        } else {
            break;
        }
        scrollView.contentSize = CGSizeMake(leftOrigin + self.scrollPageWidth+self.scrollPageSpace, self.scrollPageHeight);
        if (pageControl != nil){
            pageControl.numberOfPages = imageCount;
            pageControl.selected = 0;
        }
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    UIScrollView *pagingScrollView = [self.view viewWithTag:self.scrollViewTagNumber];
    UIPageControl *pageControl = [self.view viewWithTag:self.pageControlTagNumber];

    
    int pageNumber = pagingScrollView.contentOffset.x / (self.scrollPageWidth + self.scrollPageSpace);
	if (pageControl != nil) pageControl.currentPage = pageNumber;
}

@end
