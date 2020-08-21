//
//  ViewController.m
//  demo
//
//  Created by Playboy on 2020/8/5.
//  Copyright © 2020 ffang. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@property (nonatomic, strong) Person *person;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"demo";
    [self testKVO];
}



/**
 kvo重写set方法后 依然能够监听
 */
- (void)testKVO {
    Person *person = [[Person alloc] init];
    _person = person;
    [_person addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"name = %@",_person.name);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    static int i = 0;
    i ++;
    _person.name = [NSString stringWithFormat:@"fang %d",i];
}


@end
