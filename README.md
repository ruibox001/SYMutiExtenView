# SYMutiExtenView
A beautiful ripple animation for your app. You can easily change its color,  one ripple or multiple ripples. See running below.

<p><a href="#" target="_blank"><img src="https://raw.githubusercontent.com/ruibox001/imags/master/symutiextenpic1.jpg" alt="Simple Ripple" style="max-width:100%;"></a>　　　　　　<a href="#" target="_blank"><img src="https://raw.githubusercontent.com/ruibox001/imags/master/symutiextenpic2.jpg" alt="Multiple ripples" style="max-width:100%;"></a></p>


Usage

Step 1

    #import "SYMutiExtenProgressView.h"

Step 2

    CGFloat radius = 100;
    SYMutiExtenProgressView *extenProgressView = [SYMutiExtenProgressView shareMutiExtenProgressViewWithFrame:CGRectMake((self.view.frame.size.width-radius*2)*0.5, 200, radius*2, radius*2) extenCount:8 extenColorWithRGB:0xeaa9ff];
    [self.view addSubview:extenProgressView];
    
Start animation:

    [extenProgressView startAnimation];
    
Stop animation:

    [extenProgressView stopAnimation];
    
If you have any problems please contact me!
