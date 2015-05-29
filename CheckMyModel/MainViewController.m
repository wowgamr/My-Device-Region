//
//  MainViewController.m
//  CheckMyModel
//
//  Created by Антон Аверкиев on 22.06.14.
//  Copyright (c) 2014 Anton Averkiev. All rights reserved.
//

#import "MainViewController.h"
#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UITextField *modelid;
@property (weak, nonatomic) IBOutlet UITextField *regionid;
@property (strong, nonatomic) IBOutlet UITextField *model;
@property (strong, nonatomic) IBOutlet UILabel *device;
@property (strong, nonatomic) IBOutlet UILabel *color;
@property (strong, nonatomic) IBOutlet UILabel *storage;
@property (strong, nonatomic) IBOutlet UILabel *code;
@property (strong, nonatomic) IBOutlet UILabel *region;

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.modelid.delegate = self; //клавиатура
    self.regionid.delegate = self; //клавиатура
    
    // Границы Label
    _device.layer.borderWidth = 0.5;
    _color.layer.borderWidth = 0.5;
    _storage.layer.borderWidth = 0.5;
    _code.layer.borderWidth = 0.5;
    _region.layer.borderWidth = 0.5;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)createEmail {
    
    /*if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
        picker.mailComposeDelegate = self;
        
        //Тема письма
        [picker setSubject:@"My Device Region: in-App Mail"];
        
        //Получатели
        NSArray *toRecipients = [NSArray arrayWithObject:@"wowgamr@yandex.ru"];
        
        [picker setToRecipients:toRecipients];
        
        NSString *emailBody = @"This email will be sent to app developer. Please, write here you question. English or Russian language only.";
        [picker setMessageBody:emailBody isHTML:NO];
        
        [self presentViewController:picker animated:YES completion:nil];
    } else {
        NSString *subject = @"My Device Region: in-App Mail";
        NSString *recipients = [NSString stringWithFormat: @"mailto:wowgamr@yandex.ru?subject=%@", subject];
        NSString *body = @"&body=This email will be send to app developer. Please, write here you question. English or Russian language only.";
        NSString *email = [NSString stringWithFormat:@"%@%@", recipients, body];
         
        email = [email stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:email]];
    }*/
    
    if ([MFMailComposeViewController canSendMail])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"SUPPORT_TITLE",) message:NSLocalizedString(@"SUPPORT",)delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil,nil];
        [alert show];
        
        MFMailComposeViewController *mail = [[MFMailComposeViewController alloc] init];
        mail.mailComposeDelegate = self;
        [mail setSubject:@"My Device Region Pro"];
        //[mail setMessageBody:@"This email will be sent to app developer. Please, write here you question. English or Russian language only." isHTML:NO];
        [mail setToRecipients:@[@"wowgamr@yandex.ru"]];
        
        [self presentViewController:mail animated:YES completion:NULL];
    }
    else
    {
        NSLog(@"This device cannot send email");
    }
}

- (void)mailComposeController:(MFMailComposeViewController*)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError*)error
{
    NSString *message = nil;
    
    switch (result)
    {
        case MFMailComposeResultCancelled:
            message = @"Result: canceled";
            break;
        case MFMailComposeResultSaved:
            message = @"Result: saved";
            break;
        case MFMailComposeResultSent:
            message = @"Result: sent";
            break;
        case MFMailComposeResultFailed:
            message = @"Result: failed";
            break;
        default:
            message = @"Result: not sent";
            break;
    }
    
    NSLog(@"%@", message);
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)checkbutton:(id)sender {
    NSString *model = [[NSString alloc]init];
    model = self.modelid.text;
    NSString *regioncode = [[NSString alloc]init];
    regioncode = self.regionid.text;
  
    
#pragma mark Not Found
    
// Глобальный отказ
    NSString *device = NSLocalizedString(@"DEVICE",);
    self.device.text = device;
    NSString *color = nil;
    self.color.text = color;
    NSString *storage = nil;
    self.storage.text = storage;
    NSString *code = nil;
    self.code.text = code;
    NSString *region = NSLocalizedString(@"REGION",);
    self.region.text = region;
    
    
// Чистим память
    
    device = nil;
    color = nil;
    storage = nil;
    code = nil;
    region = nil;
    
    
#pragma mark Regions
    
// Коды регионов
    
    if ([regioncode isEqual: @"AB"] || [regioncode isEqual: @"AB/A"]) {
        NSString *region = NSLocalizedString(@"REGION_AB",);
        self.region.text = region;
    }
    if ([regioncode isEqual: @"AE"] || [regioncode isEqual: @"AE/A"]) {
        NSString *region = NSLocalizedString(@"REGION_AE",);
        self.region.text = region;
    }
    if ([regioncode isEqual: @"B"] || [regioncode isEqual: @"B/A"]) {
        NSString *region = NSLocalizedString(@"REGION_B",);
        self.region.text = region;
    }
    if ([regioncode isEqual: @"BR"] || [regioncode isEqual: @"BR/A"]) {
        NSString *region = NSLocalizedString(@"REGION_BR",);
        self.region.text = region;
    }
    if ([regioncode isEqual: @"BZ"] || [regioncode isEqual: @"BZ/A"]) {
        NSString *region = NSLocalizedString(@"REGION_BZ",);
        self.region.text = region;
    }
    if ([regioncode isEqual: @"C"] || [regioncode isEqual: @"C/A"]) {
        NSString *region = NSLocalizedString(@"REGION_C",);
        self.region.text = region;
    }
    if ([regioncode isEqual: @"CL"] || [regioncode isEqual: @"CL/A"]) {
        NSString *region = NSLocalizedString(@"REGION_CL",);
        self.region.text = region;
    }
    if ([regioncode isEqual: @"CN"] || [regioncode isEqual: @"CN/A"]) {
        NSString *region = NSLocalizedString(@"REGION_CN",);
        self.region.text = region;
    }
    if ([regioncode isEqual: @"CS"] || [regioncode isEqual: @"CS/A"]) {
        NSString *region = NSLocalizedString(@"REGION_CS",);
        self.region.text = region;
    }
    if ([regioncode isEqual: @"CZ"] || [regioncode isEqual: @"CZ/A"]) {
        NSString *region = NSLocalizedString(@"REGION_CZ",);
        self.region.text = region;
    }
    if ([regioncode isEqual: @"D"] || [regioncode isEqual: @"D/A"]) {
        NSString *region = NSLocalizedString(@"REGION_D",);
        self.region.text = region;
    }
    if ([regioncode isEqual: @"DN"] || [regioncode isEqual: @"DN/A"]) {
        NSString *region = NSLocalizedString(@"REGION_DN",);
        self.region.text = region;
    }
    if ([regioncode isEqual: @"E"] || [regioncode isEqual: @"E/A"]) {
        NSString *region = NSLocalizedString(@"REGION_E",);
        self.region.text = region;
    }
    if ([regioncode isEqual: @"EE"] || [regioncode isEqual: @"EE/A"]) {
        NSString *region = NSLocalizedString(@"REGION_EE",);
        self.region.text = region;
    }
    if ([regioncode isEqual: @"EL"] || [regioncode isEqual: @"EL/A"]) {
        NSString *region = NSLocalizedString(@"REGION_EL",);
        self.region.text = region;
    }
    if ([regioncode isEqual: @"ER"] || [regioncode isEqual: @"ER/A"]) {
        NSString *region = NSLocalizedString(@"REGION_ER",);
        self.region.text = region;
    }
    if ([regioncode isEqual: @"FB"] || [regioncode isEqual: @"FB/A"] || [regioncode isEqual: @"F"] || [regioncode isEqual: @"F/A"]) {
        NSString *region = NSLocalizedString(@"REGION_FB",);
        self.region.text = region;
    }
    if ([regioncode isEqual: @"FD"] || [regioncode isEqual: @"FD/A"]) {
        NSString *region = NSLocalizedString(@"REGION_FD",);
        self.region.text = region;
    }
    if ([regioncode isEqual: @"GR"] || [regioncode isEqual: @"GR/A"]) {
        NSString *region = NSLocalizedString(@"REGION_GR",);
        self.region.text = region;
    }
    if ([regioncode isEqual: @"HN"] || [regioncode isEqual: @"HN/A"]) {
        NSString *region = NSLocalizedString(@"REGION_HN",);
        self.region.text = region;
    }
    if ([regioncode isEqual: @"ID"] || [regioncode isEqual: @"ID/A"]) {
            NSString *region = NSLocalizedString(@"REGION_ID",);
            self.region.text = region;
    }
    if ([regioncode isEqual: @"IP"] || [regioncode isEqual: @"IP/A"]) {
        NSString *region = NSLocalizedString(@"REGION_IP",);
        self.region.text = region;
    }
    if ([regioncode isEqual: @"HB"] || [regioncode isEqual: @"HB/A"]) {
        NSString *region = NSLocalizedString(@"REGION_HB",);
        self.region.text = region;
    }
    if ([regioncode isEqual: @"J"] || [regioncode isEqual: @"J/A"]) {
        NSString *region = NSLocalizedString(@"REGION_J",);
        self.region.text = region;
    }
    if ([regioncode isEqual: @"KH"] || [regioncode isEqual: @"KH/A"]) {
        NSString *region = NSLocalizedString(@"REGION_KH",);
        self.region.text = region;
    }
    if ([regioncode isEqual: @"KN"] || [regioncode isEqual: @"KN/A"]) {
        NSString *region = NSLocalizedString(@"REGION_KN",);
        self.region.text = region;
    }
    if ([regioncode isEqual: @"KS"] || [regioncode isEqual: @"KS/A"]) {
        NSString *region = NSLocalizedString(@"REGION_KS",);
        self.region.text = region;
    }
    if ([regioncode isEqual: @"LA"] || [regioncode isEqual: @"LA/A"]) {
        NSString *region = NSLocalizedString(@"REGION_LA",);
        self.region.text = region;
    }
    if ([regioncode isEqual: @"LE"] || [regioncode isEqual: @"LE/A"]) {
        NSString *region = NSLocalizedString(@"REGION_LE",);
        self.region.text = region;
    }
    if ([regioncode isEqual: @"LL"] || [regioncode isEqual: @"LL/A"]) {
        NSString *region = NSLocalizedString(@"REGION_LL",);
        self.region.text = region;
    }
    if ([regioncode isEqual: @"LZ"] || [regioncode isEqual: @"LZ/A"]) {
        NSString *region = NSLocalizedString(@"REGION_LZ",);
        self.region.text = region;
    }
    if ([regioncode isEqual: @"MG"] || [regioncode isEqual: @"MG/A"]) {
        NSString *region = NSLocalizedString(@"REGION_MG",);
        self.region.text = region;
    }
    if ([regioncode isEqual: @"MY"] || [regioncode isEqual: @"MY/A"]) {
        NSString *region = NSLocalizedString(@"REGION_MY",);
        self.region.text = region;
    }
    if ([regioncode isEqual: @"NF"] || [regioncode isEqual: @"NF/A"]) {
        NSString *region = NSLocalizedString(@"REGION_NF",);
        self.region.text = region;
    }
    if ([regioncode isEqual: @"PL"] || [regioncode isEqual: @"PL/A"]) {
        NSString *region = NSLocalizedString(@"REGION_PL",);
        self.region.text = region;
    }
    if ([regioncode isEqual: @"PO"] || [regioncode isEqual: @"PO/A"]) {
        NSString *region = NSLocalizedString(@"REGION_PO",);
        self.region.text = region;
    }
    if ([regioncode isEqual: @"PP"] || [regioncode isEqual: @"PP/A"]) {
        NSString *region = NSLocalizedString(@"REGION_PP",);
        self.region.text = region;
    }
    if ([regioncode isEqual: @"RM"] || [regioncode isEqual: @"RM/A"]) {
        NSString *region = NSLocalizedString(@"REGION_RM",);
        self.region.text = region;
    }
    if ([regioncode isEqual: @"RO"] || [regioncode isEqual: @"RO/A"]) {
        NSString *region = NSLocalizedString(@"REGION_RO",);
        self.region.text = region;
    }
    if ([regioncode isEqual: @"RS"] || [regioncode isEqual: @"RS/A"] || [regioncode isEqual: @"RU"] || [regioncode isEqual: @"RU/A"] || [regioncode isEqual: @"RR"] || [regioncode isEqual: @"RR/A"]) {
        NSString *region = NSLocalizedString(@"REGION_RU",);
        self.region.text = region;
    }
    if ([regioncode isEqual: @"SL"] || [regioncode isEqual: @"SL/A"]) {
        NSString *region = NSLocalizedString(@"REGION_SL",);
        self.region.text = region;
    }
    if ([regioncode isEqual: @"SO"] || [regioncode isEqual: @"SO/A"]) {
        NSString *region = NSLocalizedString(@"REGION_SO",);
        self.region.text = region;
    }
    if ([regioncode isEqual: @"SU"] || [regioncode isEqual: @"SU/A"]) {
        NSString *region = NSLocalizedString(@"REGION_SU",);
        self.region.text = region;
    }
    if ([regioncode isEqual: @"T"] || [regioncode isEqual: @"T/A"]) {
        NSString *region = NSLocalizedString(@"REGION_T",);
        self.region.text = region;
    }
    if ([regioncode isEqual: @"TA"] || [regioncode isEqual: @"TA/A"]) {
        NSString *region = NSLocalizedString(@"REGION_TA",);
        self.region.text = region;
    }
    if ([regioncode isEqual: @"TH"] || [regioncode isEqual: @"TH/A"]) {
        NSString *region = NSLocalizedString(@"REGION_TH",);
        self.region.text = region;
    }
    if ([regioncode isEqual: @"TU"] || [regioncode isEqual: @"TU/A"]) {
        NSString *region = NSLocalizedString(@"REGION_TU",);
        self.region.text = region;
    }
    if ([regioncode isEqual: @"X"] || [regioncode isEqual: @"X/A"]) {
        NSString *region = NSLocalizedString(@"REGION_X",);
        self.region.text = region;
    }
    if ([regioncode isEqual: @"Y"] || [regioncode isEqual: @"Y/A"]) {
        NSString *region = NSLocalizedString(@"REGION_Y",);
        self.region.text = region;
    }
    if ([regioncode isEqual: @"ZA"] || [regioncode isEqual: @"ZA/A"]) {
        NSString *region = NSLocalizedString(@"REGION_ZA",);
        self.region.text = region;
    }
    if ([regioncode isEqual: @"ZP"] || [regioncode isEqual: @"ZP/A"]) {
        NSString *region = NSLocalizedString(@"REGION_ZP",);
        self.region.text = region;
    }
    
    
#pragma mark AppleTV
    
// Модели Apple TV
    if ([model isEqual: @"MC572"]) {
        NSString *device = @"Apple TV 2G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_8",);
        self.storage.text = storage;
        NSString *code = @"AppleTV2,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MD199"]) {
        NSString *device = @"Apple TV 3G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_8",);
        self.storage.text = storage;
        NSString *code = @"AppleTV3,1 или AppleTV3,2";
        self.code.text = code;
    }
    

#pragma mark iPad
    
// Модели iPad
    
    // iPad 1
    
    if ([model isEqual: @"MB292"]) {
        NSString *device = @"iPad Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPad1,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MB293"]) {
        NSString *device = @"iPad Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPad1,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MB294"]) {
        NSString *device = @"iPad Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPad1,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MC349"]) {
        NSString *device = @"iPad Wi-Fi + 3G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPad1,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MC496"]) {
        NSString *device = @"iPad Wi-Fi + 3G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPad1,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MC497"]) {
        NSString *device = @"iPad Wi-Fi + 3G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPad1,1";
        self.code.text = code;
    }
    
    // iPad 2
    
    if ([model isEqual: @"MC769"]) {
        NSString *device = @"iPad 2 Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPad2,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MC770"]) {
        NSString *device = @"iPad 2 Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPad2,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MC916"]) {
        NSString *device = @"iPad 2 Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPad2,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MC979"]) {
        NSString *device = @"iPad 2 Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPad2,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MC980"]) {
        NSString *device = @"iPad 2 Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPad2,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MC981"]) {
        NSString *device = @"iPad 2 Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPad2,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MC773"]) {
        NSString *device = @"iPad 2 Wi-Fi + 3G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPad2,2";
        self.code.text = code;
    }
    if ([model isEqual: @"MC774"]) {
        NSString *device = @"iPad 2 Wi-Fi + 3G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPad2,2";
        self.code.text = code;
    }
    if ([model isEqual: @"MC775"]) {
        NSString *device = @"iPad 2 Wi-Fi + 3G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPad2,2";
        self.code.text = code;
    }
    if ([model isEqual: @"MC982"]) {
        NSString *device = @"iPad 2 Wi-Fi + 3G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPad2,2";
        self.code.text = code;
    }
    if ([model isEqual: @"MC983"]) {
        NSString *device = @"iPad 2 Wi-Fi + 3G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPad2,2";
        self.code.text = code;
    }
    if ([model isEqual: @"MC984"]) {
        NSString *device = @"iPad 2 Wi-Fi + 3G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPad2,2";
        self.code.text = code;
    }
    if ([model isEqual: @"MC755"]) {
        NSString *device = @"iPad 2 Wi-Fi + 3G (CDMA)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPad2,3";
        self.code.text = code;
    }
    if ([model isEqual: @"MC763"]) {
        NSString *device = @"iPad 2 Wi-Fi + 3G (CDMA)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPad2,3";
        self.code.text = code;
    }
    if ([model isEqual: @"MC764"]) {
        NSString *device = @"iPad 2 Wi-Fi + 3G (CDMA)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPad2,3";
        self.code.text = code;
    }
    if ([model isEqual: @"MC985"]) {
        NSString *device = @"iPad 2 Wi-Fi + 3G (CDMA)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPad2,3";
        self.code.text = code;
    }
    if ([model isEqual: @"MC986"]) {
        NSString *device = @"iPad 2 Wi-Fi + 3G (CDMA)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPad2,3";
        self.code.text = code;
    }
    if ([model isEqual: @"MC987"]) {
        NSString *device = @"iPad 2 Wi-Fi + 3G (CDMA)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPad2,3";
        self.code.text = code;
    }
    if ([model isEqual: @"MC954"] || [model isEqual: @"MC988"]) {
        NSString *device = @"iPad 2 WiFi (Rev A)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPad2,4";
        self.code.text = code;
    }
    if ([model isEqual: @"MC989"]) {
        NSString *device = @"iPad 2 WiFi (Rev A)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPad2,4";
        self.code.text = code;
    }

    // iPad 3
    
    if ([model isEqual: @"MC705"] || [model isEqual: @"MD333"]) {
        NSString *device = @"iPad 3 Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPad3,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MC706"] || [model isEqual: @"MD334"]) {
        NSString *device = @"iPad 3 Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPad3,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MC707"] || [model isEqual: @"MD335"]) {
        NSString *device = @"iPad 3 Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPad3,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MD328"]) {
        NSString *device = @"iPad 3 Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPad3,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MD329"]) {
        NSString *device = @"iPad 3 Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPad3,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MD330"]) {
        NSString *device = @"iPad 3 Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPad3,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MC733"]) {
        NSString *device = @"iPad 3 Wi-Fi + Verizon 4G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPad3,2";
        self.code.text = code;
    }
    if ([model isEqual: @"MC744"]) {
        NSString *device = @"iPad 3 Wi-Fi + Verizon 4G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPad3,2";
        self.code.text = code;
    }
    if ([model isEqual: @"MC756"]) {
        NSString *device = @"iPad 3 Wi-Fi + Verizon 4G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPad3,2";
        self.code.text = code;
    }
    if ([model isEqual: @"MD363"]) {
        NSString *device = @"iPad 3 Wi-Fi + Verizon 4G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPad3,2";
        self.code.text = code;
    }
    if ([model isEqual: @"MD364"]) {
        NSString *device = @"iPad 3 Wi-Fi + Verizon 4G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPad3,2";
        self.code.text = code;
    }
    if ([model isEqual: @"MD365"]) {
        NSString *device = @"iPad 3 Wi-Fi + Verizon 4G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPad3,2";
        self.code.text = code;
    }
    if ([model isEqual: @"MD366"]) {
        NSString *device = @"iPad 3 Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPad3,3";
        self.code.text = code;
    }
    if ([model isEqual: @"MD367"]) {
        NSString *device = @"iPad 3 Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPad3,3";
        self.code.text = code;
    }
    if ([model isEqual: @"MD368"]) {
        NSString *device = @"iPad 3 Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPad3,3";
        self.code.text = code;
    }
    if ([model isEqual: @"MD369"]) {
        NSString *device = @"iPad 3 Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPad3,3";
        self.code.text = code;
    }
    if ([model isEqual: @"MD370"]) {
        NSString *device = @"iPad 3 Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPad3,3";
        self.code.text = code;
    }
    if ([model isEqual: @"MD371"]) {
        NSString *device = @"iPad 3 Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPad3,3";
        self.code.text = code;
    }

    // iPad 4
    
    if ([model isEqual: @"MD510"]) {
        NSString *device = @"iPad 4 Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPad3,4";
        self.code.text = code;
    }
    if ([model isEqual: @"MD511"]) {
        NSString *device = @"iPad 4 Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPad3,4";
        self.code.text = code;
    }
    if ([model isEqual: @"MD512"]) {
        NSString *device = @"iPad 4 Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPad3,4";
        self.code.text = code;
    }
    if ([model isEqual: @"ME392"]) {
        NSString *device = @"iPad 4 Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_128",);
        self.storage.text = storage;
        NSString *code = @"iPad3,4";
        self.code.text = code;
    }
    if ([model isEqual: @"MD513"]) {
        NSString *device = @"iPad 4 Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPad3,4";
        self.code.text = code;
    }
    if ([model isEqual: @"MD514"]) {
        NSString *device = @"iPad 4 Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPad3,4";
        self.code.text = code;
    }
    if ([model isEqual: @"MD515"]) {
        NSString *device = @"iPad 4 Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPad3,4";
        self.code.text = code;
    }
    if ([model isEqual: @"ME393"]) {
        NSString *device = @"iPad 4 Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_128",);
        self.storage.text = storage;
        NSString *code = @"iPad3,4";
        self.code.text = code;
    }
    if ([model isEqual: @"MD516"]) {
        NSString *device = @"iPad 4 Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPad3,5";
        self.code.text = code;
    }
    if ([model isEqual: @"MD517"]) {
        NSString *device = @"iPad 4 Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPad3,5";
        self.code.text = code;
    }
    if ([model isEqual: @"MD518"]) {
        NSString *device = @"iPad 4 Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPad3,5";
        self.code.text = code;
    }
    if ([model isEqual: @"ME400"]) {
        NSString *device = @"iPad 4 Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_128",);
        self.storage.text = storage;
        NSString *code = @"iPad3,5";
        self.code.text = code;
    }
    if ([model isEqual: @"MD519"]) {
        NSString *device = @"iPad 4 Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPad3,5";
        self.code.text = code;
    }
    if ([model isEqual: @"MD520"]) {
        NSString *device = @"iPad 4 Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPad3,5";
        self.code.text = code;
    }
    if ([model isEqual: @"MD521"]) {
        NSString *device = @"iPad 4 Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPad3,5";
        self.code.text = code;
    }
    if ([model isEqual: @"ME401"]) {
        NSString *device = @"iPad 4 Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_128",);
        self.storage.text = storage;
        NSString *code = @"iPad3,5";
        self.code.text = code;
    }
    if ([model isEqual: @"MD522"] || [model isEqual: @"ME195"]) {
        NSString *device = @"iPad 4 Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPad3,6";
        self.code.text = code;
    }
    if ([model isEqual: @"MD523"] || [model isEqual: @"ME196"]) {
        NSString *device = @"iPad 4 Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPad3,6";
        self.code.text = code;
    }
    if ([model isEqual: @"MD524"] || [model isEqual: @"ME197"]) {
        NSString *device = @"iPad 4 Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPad3,6";
        self.code.text = code;
    }
    if ([model isEqual: @"ME406"] || [model isEqual: @"ME410"]) {
        NSString *device = @"iPad 4 Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_128",);
        self.storage.text = storage;
        NSString *code = @"iPad3,6";
        self.code.text = code;
    }
    if ([model isEqual: @"MD525"] || [model isEqual: @"ME198"]) {
        NSString *device = @"iPad 4 Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPad3,6";
        self.code.text = code;
    }
    if ([model isEqual: @"MD526"] || [model isEqual: @"ME199"]) {
        NSString *device = @"iPad 4 Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPad3,6";
        self.code.text = code;
    }
    if ([model isEqual: @"MD527"] || [model isEqual: @"ME200"]) {
        NSString *device = @"iPad 4 Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPad3,6";
        self.code.text = code;
    }
    if ([model isEqual: @"ME407"] || [model isEqual: @"ME411"]) {
        NSString *device = @"iPad 4 Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_128",);
        self.storage.text = storage;
        NSString *code = @"iPad3,6";
        self.code.text = code;
    }
    
    // iPad Air
    
    if ([model isEqual: @"MD788"]) {
        NSString *device = @"iPad Air Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPad4,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MD789"]) {
        NSString *device = @"iPad Air Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPad4,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MD790"]) {
        NSString *device = @"iPad Air Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPad4,1";
        self.code.text = code;
    }
    if ([model isEqual: @"ME906"]) {
        NSString *device = @"iPad Air Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_128",);
        self.storage.text = storage;
        NSString *code = @"iPad4,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MD785"]) {
        NSString *device = @"iPad Air Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPad4,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MD786"]) {
        NSString *device = @"iPad Air Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPad4,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MD787"]) {
        NSString *device = @"iPad Air Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPad4,1";
        self.code.text = code;
    }
    if ([model isEqual: @"ME898"]) {
        NSString *device = @"iPad Air Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_128",);
        self.storage.text = storage;
        NSString *code = @"iPad4,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MD794"] || [model isEqual: @"ME997"] || [model isEqual: @"ME999"] || [model isEqual: @"MF021"] || [model isEqual: @"MF502"]) {
        NSString *device = @"iPad Air Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPad4,2";
        self.code.text = code;
    }
    if ([model isEqual: @"MD795"] || [model isEqual: @"MF025"] || [model isEqual: @"MF527"] || [model isEqual: @"MF529"] || [model isEqual: @"MF532"]) {
        NSString *device = @"iPad Air Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPad4,2";
        self.code.text = code;
    }
    if ([model isEqual: @"MD796"] || [model isEqual: @"MF012"] || [model isEqual: @"MF013"] || [model isEqual: @"MF027"] || [model isEqual: @"MF539"]) {
        NSString *device = @"iPad Air Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPad4,2";
        self.code.text = code;
    }
    if ([model isEqual: @"ME988"] || [model isEqual: @"MF018"] || [model isEqual: @"MF019"] || [model isEqual: @"MF029"] || [model isEqual: @"MF563"]) {
        NSString *device = @"iPad Air Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_128",);
        self.storage.text = storage;
        NSString *code = @"iPad4,2";
        self.code.text = code;
    }
    if ([model isEqual: @"MD791"] || [model isEqual: @"ME991"] || [model isEqual: @"ME993"] || [model isEqual: @"MF020"] || [model isEqual: @"MF496"]) {
        NSString *device = @"iPad Air Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPad4,2";
        self.code.text = code;
    }
    if ([model isEqual: @"MD792"] || [model isEqual: @"MF003"] || [model isEqual: @"MF004"] || [model isEqual: @"MF024"] || [model isEqual: @"MF520"]) {
        NSString *device = @"iPad Air Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPad4,2";
        self.code.text = code;
    }
    if ([model isEqual: @"MD793"] || [model isEqual: @"MF009"] || [model isEqual: @"MF010"] || [model isEqual: @"MF026"] || [model isEqual: @"MF534"]) {
        NSString *device = @"iPad Air Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPad4,2";
        self.code.text = code;
    }
    if ([model isEqual: @"ME987"] || [model isEqual: @"MF015"] || [model isEqual: @"MF016"] || [model isEqual: @"MF016"] || [model isEqual: @"MF558"]) {
        NSString *device = @"iPad Air Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_128",);
        self.storage.text = storage;
        NSString *code = @"iPad4,2";
        self.code.text = code;
    }
    if ([model isEqual: @"MF230"]) {
        NSString *device = @"iPad Air Wi-Fi + Cellular CN)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPad4,3";
        self.code.text = code;
    }
    if ([model isEqual: @"MF233"]) {
        NSString *device = @"iPad Air Wi-Fi + Cellular CN)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPad4,3";
        self.code.text = code;
    }
    if ([model isEqual: @"MF234"]) {
        NSString *device = @"iPad Air Wi-Fi + Cellular CN)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPad4,3";
        self.code.text = code;
    }
    if ([model isEqual: @"MF236"]) {
        NSString *device = @"iPad Air Wi-Fi + Cellular CN)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_128",);
        self.storage.text = storage;
        NSString *code = @"iPad4,3";
        self.code.text = code;
    }
    if ([model isEqual: @"MD797"]) {
        NSString *device = @"iPad Air Wi-Fi + Cellular CN)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPad4,3";
        self.code.text = code;
    }
    if ([model isEqual: @"MD798"]) {
        NSString *device = @"iPad Air Wi-Fi + Cellular CN)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPad4,3";
        self.code.text = code;
    }
    if ([model isEqual: @"MD799"]) {
        NSString *device = @"iPad Air Wi-Fi + Cellular CN)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPad4,3";
        self.code.text = code;
    }
    if ([model isEqual: @"MF235"]) {
        NSString *device = @"iPad Air Wi-Fi + Cellular CN)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_128",);
        self.storage.text = storage;
        NSString *code = @"iPad4,3";
        self.code.text = code;
    }
    
    // iPad Mini + iPad Mini 2
    
    if ([model isEqual: @"MD528"]) {
        NSString *device = @"iPad mini Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPad2,5";
        self.code.text = code;
    }
    if ([model isEqual: @"MD529"]) {
        NSString *device = @"iPad mini Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPad2,5";
        self.code.text = code;
    }
    if ([model isEqual: @"MD530"]) {
        NSString *device = @"iPad mini Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPad2,5";
        self.code.text = code;
    }
    if ([model isEqual: @"MD531"]) {
        NSString *device = @"iPad mini Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPad2,5";
        self.code.text = code;
    }
    if ([model isEqual: @"MD532"]) {
        NSString *device = @"iPad mini Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPad2,5";
        self.code.text = code;
    }
    if ([model isEqual: @"MD533"]) {
        NSString *device = @"iPad mini Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPad2,5";
        self.code.text = code;
    }
    if ([model isEqual: @"MD534"]) {
        NSString *device = @"iPad mini Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPad2,6";
        self.code.text = code;
    }
    if ([model isEqual: @"MD535"]) {
        NSString *device = @"iPad mini Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPad2,6";
        self.code.text = code;
    }
    if ([model isEqual: @"MD536"]) {
        NSString *device = @"iPad mini Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPad2,6";
        self.code.text = code;
    }
    if ([model isEqual: @"MD537"]) {
        NSString *device = @"iPad mini Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPad2,6";
        self.code.text = code;
    }
    if ([model isEqual: @"MD538"]) {
        NSString *device = @"iPad mini Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPad2,6";
        self.code.text = code;
    }
    if ([model isEqual: @"MD539"]) {
        NSString *device = @"iPad mini Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPad2,6";
        self.code.text = code;
    }
    if ([model isEqual: @"MD540"] || [model isEqual: @"ME215"]) {
        NSString *device = @"iPad mini Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPad2,7";
        self.code.text = code;
    }
    if ([model isEqual: @"MD541"] || [model isEqual: @"ME216"]) {
        NSString *device = @"iPad mini Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPad2,7";
        self.code.text = code;
    }
    if ([model isEqual: @"MD542"] || [model isEqual: @"ME217"]) {
        NSString *device = @"iPad mini Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPad2,7";
        self.code.text = code;
    }
    if ([model isEqual: @"MD543"] || [model isEqual: @"ME218"]) {
        NSString *device = @"iPad mini Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPad2,7";
        self.code.text = code;
    }
    if ([model isEqual: @"MD544"] || [model isEqual: @"ME219"]) {
        NSString *device = @"iPad mini Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPad2,7";
        self.code.text = code;
    }
    if ([model isEqual: @"MD545"] || [model isEqual: @"ME220"]) {
        NSString *device = @"iPad mini Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPad2,7";
        self.code.text = code;
    }
    if ([model isEqual: @"ME279"]) {
        NSString *device = @"iPad mini Retina (Wi-Fi)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPad4,4";
        self.code.text = code;
    }
    if ([model isEqual: @"ME280"]) {
        NSString *device = @"iPad mini Retina (Wi-Fi)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPad4,4";
        self.code.text = code;
    }
    if ([model isEqual: @"ME281"]) {
        NSString *device = @"iPad mini Retina (Wi-Fi)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPad4,4";
        self.code.text = code;
    }
    if ([model isEqual: @"ME860"]) {
        NSString *device = @"iPad mini Retina (Wi-Fi)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_128",);
        self.storage.text = storage;
        NSString *code = @"iPad4,4";
        self.code.text = code;
    }
    if ([model isEqual: @"ME276"]) {
        NSString *device = @"iPad mini Retina (Wi-Fi)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPad4,4";
        self.code.text = code;
    }
    if ([model isEqual: @"ME277"]) {
        NSString *device = @"iPad mini Retina (Wi-Fi)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPad4,4";
        self.code.text = code;
    }
    if ([model isEqual: @"ME278"]) {
        NSString *device = @"iPad mini Retina (Wi-Fi)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPad4,4";
        self.code.text = code;
    }
    if ([model isEqual: @"ME856"]) {
        NSString *device = @"iPad mini Retina (Wi-Fi)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_128",);
        self.storage.text = storage;
        NSString *code = @"iPad4,4";
        self.code.text = code;
    }
    if ([model isEqual: @"ME814"] || [model isEqual: @"MF074"] || [model isEqual: @"MF076"] || [model isEqual: @"MF544"] || [model isEqual: @"MF075"]) {
        NSString *device = @"iPad mini Retina (Wi-Fi + 4G LTE)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPad4,5";
        self.code.text = code;
    }
    if ([model isEqual: @"ME824"] || [model isEqual: @"MF083"] || [model isEqual: @"MF085"] || [model isEqual: @"MF569"] || [model isEqual: @"MF084"]) {
        NSString *device = @"iPad mini Retina (Wi-Fi + 4G LTE)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPad4,5";
        self.code.text = code;
    }
    if ([model isEqual: @"ME832"] || [model isEqual: @"MF089"] || [model isEqual: @"MF091"] || [model isEqual: @"MF580"] || [model isEqual: @"MF090"]) {
        NSString *device = @"iPad mini Retina (Wi-Fi + 4G LTE)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPad4,5";
        self.code.text = code;
    }
    if ([model isEqual: @"ME840"] || [model isEqual: @"MF120"] || [model isEqual: @"MF123"] || [model isEqual: @"MF594"] || [model isEqual: @"MF121"]) {
        NSString *device = @"iPad mini Retina (Wi-Fi + 4G LTE)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_128",);
        self.storage.text = storage;
        NSString *code = @"iPad4,5";
        self.code.text = code;
    }
    if ([model isEqual: @"ME800"] || [model isEqual: @"MF066"] || [model isEqual: @"MF070"] || [model isEqual: @"MF519"] || [model isEqual: @"MF069"]) {
        NSString *device = @"iPad mini Retina (Wi-Fi + 4G LTE)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPad4,5";
        self.code.text = code;
    }
    if ([model isEqual: @"ME820"] || [model isEqual: @"MF080"] || [model isEqual: @"MF082"] || [model isEqual: @"MF552"] || [model isEqual: @"MF081"]) {
        NSString *device = @"iPad mini Retina (Wi-Fi + 4G LTE)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPad4,5";
        self.code.text = code;
    }
    if ([model isEqual: @"ME828"] || [model isEqual: @"MF086"] || [model isEqual: @"MF088"] || [model isEqual: @"MF575"] || [model isEqual: @"MF087"]) {
        NSString *device = @"iPad mini Retina (Wi-Fi + 4G LTE)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPad4,5";
        self.code.text = code;
    }
    if ([model isEqual: @"ME836"] || [model isEqual: @"MF116"] || [model isEqual: @"MF118"] || [model isEqual: @"MF585"] || [model isEqual: @"MF117"]) {
        NSString *device = @"iPad mini Retina (Wi-Fi + 4G LTE)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_128",);
        self.storage.text = storage;
        NSString *code = @"iPad4,5";
        self.code.text = code;
    }
    if ([model isEqual: @"MF248"]) {
        NSString *device = @"iPad mini Retina (China)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPad4,6";
        self.code.text = code;
    }
    if ([model isEqual: @"MF252"]) {
        NSString *device = @"iPad mini Retina (China)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPad4,6";
        self.code.text = code;
    }
    if ([model isEqual: @"MF246"]) {
        NSString *device = @"iPad mini Retina (China)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPad4,6";
        self.code.text = code;
    }
    if ([model isEqual: @"MF244"]) {
        NSString *device = @"iPad mini Retina (China)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_128",);
        self.storage.text = storage;
        NSString *code = @"iPad4,6";
        self.code.text = code;
    }
    if ([model isEqual: @"MF247"]) {
        NSString *device = @"iPad mini Retina (China)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPad4,6";
        self.code.text = code;
    }
    if ([model isEqual: @"MF251"]) {
        NSString *device = @"iPad mini Retina (China)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPad4,6";
        self.code.text = code;
    }
    if ([model isEqual: @"MF245"]) {
        NSString *device = @"iPad mini Retina (China)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPad4,6";
        self.code.text = code;
    }
    if ([model isEqual: @"MF243"]) {
        NSString *device = @"iPad mini Retina (China)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_128",);
        self.storage.text = storage;
        NSString *code = @"iPad4,6";
        self.code.text = code;
    }
    
    // iPad Air 2
    
    if ([model isEqual: @"MGLW2"]) {
        NSString *device = @"iPad Air 2 Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_SILVER",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPad5,3";
        self.code.text = code;
    }
    if ([model isEqual: @"MGKM2"]) {
        NSString *device = @"iPad Air 2 Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_SILVER",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPad5,3";
        self.code.text = code;
    }
    if ([model isEqual: @"MGTY2"]) {
        NSString *device = @"iPad Air 2 Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_SILVER",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_128",);
        self.storage.text = storage;
        NSString *code = @"iPad5,3";
        self.code.text = code;
    }
    if ([model isEqual: @"MH0W2"]) {
        NSString *device = @"iPad Air 2 Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_GOLD",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPad5,3";
        self.code.text = code;
    }
    if ([model isEqual: @"MH182"]) {
        NSString *device = @"iPad Air 2 Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_GOLD",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPad5,3";
        self.code.text = code;
    }
    if ([model isEqual: @"MH1J2"]) {
        NSString *device = @"iPad Air 2 Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_GOLD",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_128",);
        self.storage.text = storage;
        NSString *code = @"iPad5,3";
        self.code.text = code;
    }
    if ([model isEqual: @"MGL12"]) {
        NSString *device = @"iPad Air 2 Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_GRAY",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPad5,3";
        self.code.text = code;
    }
    if ([model isEqual: @"MGKL2"]) {
        NSString *device = @"iPad Air 2 Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_GRAY",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPad5,3";
        self.code.text = code;
    }
    if ([model isEqual: @"MGTX2"]) {
        NSString *device = @"iPad Air 2 Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_GRAY",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_128",);
        self.storage.text = storage;
        NSString *code = @"iPad5,3";
        self.code.text = code;
    }
    if ([model isEqual: @"MH2V2"]) {
        NSString *device = @"iPad Air 2 Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_SILVER",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPad5,4";
        self.code.text = code;
    }
    if ([model isEqual: @"MH2N2"]) {
        NSString *device = @"iPad Air 2 Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_SILVER",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPad5,4";
        self.code.text = code;
    }
    if ([model isEqual: @"MH322"]) {
        NSString *device = @"iPad Air 2 Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_SILVER",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_128",);
        self.storage.text = storage;
        NSString *code = @"iPad5,4";
        self.code.text = code;
    }
    if ([model isEqual: @"MH2W2"]) {
        NSString *device = @"iPad Air 2 Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_GOLD",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPad5,4";
        self.code.text = code;
    }
    if ([model isEqual: @"MH2P2"]) {
        NSString *device = @"iPad Air 2 Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_GOLD",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPad5,4";
        self.code.text = code;
    }
    if ([model isEqual: @"MH332"]) {
        NSString *device = @"iPad Air 2 Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_GOLD",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_128",);
        self.storage.text = storage;
        NSString *code = @"iPad5,4";
        self.code.text = code;
    }
    if ([model isEqual: @"MH2U2"]) {
        NSString *device = @"iPad Air 2 Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_GRAY",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPad5,4";
        self.code.text = code;
    }
    if ([model isEqual: @"MH2M2"]) {
        NSString *device = @"iPad Air 2 Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_GRAY",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPad5,4";
        self.code.text = code;
    }
    if ([model isEqual: @"MH312"]) {
        NSString *device = @"iPad Air 2 Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_GRAY",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_128",);
        self.storage.text = storage;
        NSString *code = @"iPad5,4";
        self.code.text = code;
    }
    
    // iPad Mini 3
    
    if ([model isEqual: @"MGHV2"]) {
        NSString *device = @"iPad Mini 3 Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_SILVER",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPad4,7";
        self.code.text = code;
    }
    if ([model isEqual: @"MGGT2"]) {
        NSString *device = @"iPad Mini 3 Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_SILVER",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPad4,7";
        self.code.text = code;
    }
    if ([model isEqual: @"MGP42"]) {
        NSString *device = @"iPad Mini 3 Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_SILVER",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_128",);
        self.storage.text = storage;
        NSString *code = @"iPad4,7";
        self.code.text = code;
    }
    if ([model isEqual: @"MGYE2"]) {
        NSString *device = @"iPad Mini 3 Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_GOLD",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPad4,7";
        self.code.text = code;
    }
    if ([model isEqual: @"MGY92"]) {
        NSString *device = @"iPad Mini 3 Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_GOLD",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPad4,7";
        self.code.text = code;
    }
    if ([model isEqual: @"MGYK2"]) {
        NSString *device = @"iPad Mini 3 Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_GOLD",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_128",);
        self.storage.text = storage;
        NSString *code = @"iPad4,7";
        self.code.text = code;
    }
    if ([model isEqual: @"MGNR2"]) {
        NSString *device = @"iPad Mini 3 Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_GRAY",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPad4,7";
        self.code.text = code;
    }
    if ([model isEqual: @"MGGQ2"]) {
        NSString *device = @"iPad Mini 3 Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_GRAY",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPad4,7";
        self.code.text = code;
    }
    if ([model isEqual: @"MGP32"]) {
        NSString *device = @"iPad Mini 3 Wi-Fi";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_GRAY",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_128",);
        self.storage.text = storage;
        NSString *code = @"iPad4,7";
        self.code.text = code;
    }
    if ([model isEqual: @"MH3F2"]) {
        NSString *device = @"iPad Mini 3 Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_SILVER",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPad4,8";
        self.code.text = code;
    }
    if ([model isEqual: @"MH382"]) {
        NSString *device = @"iPad Mini 3 Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_SILVER",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPad4,8";
        self.code.text = code;
    }
    if ([model isEqual: @"MH3M2"]) {
        NSString *device = @"iPad Mini 3 Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_SILVER",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_128",);
        self.storage.text = storage;
        NSString *code = @"iPad4,8";
        self.code.text = code;
    }
    if ([model isEqual: @"MH3G2"]) {
        NSString *device = @"iPad Mini 3 Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_GOLD",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPad4,8";
        self.code.text = code;
    }
    if ([model isEqual: @"MH392"]) {
        NSString *device = @"iPad Mini 3 Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_GOLD",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPad4,8";
        self.code.text = code;
    }
    if ([model isEqual: @"MH3N2"]) {
        NSString *device = @"iPad Mini 3 Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_GOLD",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_128",);
        self.storage.text = storage;
        NSString *code = @"iPad4,8";
        self.code.text = code;
    }
    if ([model isEqual: @"MH3E2"]) {
        NSString *device = @"iPad Mini 3 Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_GRAY",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPad4,8";
        self.code.text = code;
    }
    if ([model isEqual: @"MH372"]) {
        NSString *device = @"iPad Mini 3 Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_GRAY",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPad4,8";
        self.code.text = code;
    }
    if ([model isEqual: @"MH3L2"]) {
        NSString *device = @"iPad Mini 3 Wi-Fi + Cellular";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_GRAY",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_128",);
        self.storage.text = storage;
        NSString *code = @"iPad4,8";
        self.code.text = code;
    }

    
#pragma mark iPhone
    
// Модели iPhone
    
    // iPhone 2G
    
    if ([model isEqual: @"MA501"]) {
        NSString *device = @"iPhone 2G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_4",);
        self.storage.text = storage;
        NSString *code = @"iPhone1,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MA712"]) {
        NSString *device = @"iPhone 2G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_8",);
        self.storage.text = storage;
        NSString *code = @"iPhone1,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MB384"]) {
        NSString *device = @"iPhone 2G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPhone1,1";
        self.code.text = code;
    }
    
    // iPhone 3G
    
    if ([model isEqual: @"MB046"] || [model isEqual: @"MB489"] || [model isEqual: @"MB639"] || [model isEqual: @"MB702"] || [model isEqual: @"MC176"]) {
        NSString *device = @"iPhone 3G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_8",);
        self.storage.text = storage;
        NSString *code = @"iPhone1,2";
        self.code.text = code;
    }
    if ([model isEqual: @"MB048"] || [model isEqual: @"MB496"] || [model isEqual: @"MB497"] || [model isEqual: @"MB704"]) {
        NSString *device = @"iPhone 3G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPhone1,2";
        self.code.text = code;
    }
    if ([model isEqual: @"MB499"] || [model isEqual: @"MB500"] || [model isEqual: @"MB501"] || [model isEqual: @"MB632"] || [model isEqual: @"MB705"]) {
        NSString *device = @"iPhone 3G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPhone1,2";
        self.code.text = code;
    }
    
    // iPhone 3GS
    
    if ([model isEqual: @"MC555"] || [model isEqual: @"MC640"]) {
        NSString *device = @"iPhone 3GS";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_8",);
        self.storage.text = storage;
        NSString *code = @"iPhone2,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MB715"] || [model isEqual: @"MB735"] || [model isEqual: @"MC135"] || [model isEqual: @"MC131"]) {
        NSString *device = @"iPhone 3GS";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPhone2,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MB717"] || [model isEqual: @"MC133"] || [model isEqual: @"MC137"] || [model isEqual: @"MB737"]) {
        NSString *device = @"iPhone 3GS";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPhone2,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MB716"] || [model isEqual: @"MC132"] || [model isEqual: @"MC136"] || [model isEqual: @"MB736"]) {
        NSString *device = @"iPhone 3GS";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPhone2,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MB718"] || [model isEqual: @"MC134"] || [model isEqual: @"MC138"] || [model isEqual: @"MB738"]) {
        NSString *device = @"iPhone 3GS";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPhone2,1";
        self.code.text = code;
    }
    
    // iPhone 4
    
    if ([model isEqual: @"MD126"] || [model isEqual: @"MD128"]) {
        NSString *device = @"iPhone 4";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_8",);
        self.storage.text = storage;
        NSString *code = @"iPhone3,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MC318"] || [model isEqual: @"MC603"] || [model isEqual: @"MC608"]) {
        NSString *device = @"iPhone 4";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPhone3,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MC319"] || [model isEqual: @"MC603"] || [model isEqual: @"MC610"]) {
        NSString *device = @"iPhone 4";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPhone3,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MD196"] || [model isEqual: @"MD197"] || [model isEqual: @"MD198"]) {
        NSString *device = @"iPhone 4";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_8",);
        self.storage.text = storage;
        NSString *code = @"iPhone3,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MC604"]) {
        NSString *device = @"iPhone 4";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPhone3,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MC606"]) {
        NSString *device = @"iPhone 4";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPhone3,1";
        self.code.text = code;
    }
    if ([model isEqual: @"ME798"]) {
        NSString *device = @"iPhone 4 (Rev A)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_8",);
        self.storage.text = storage;
        NSString *code = @"iPhone3,2";
        self.code.text = code;
    }
    if ([model isEqual: @"ME799"]) {
        NSString *device = @"iPhone 4 (Rev A)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_8",);
        self.storage.text = storage;
        NSString *code = @"iPhone3,2";
        self.code.text = code;
    }
    if ([model isEqual: @"MD146"] || [model isEqual: @"MD439"] || [model isEqual: @"MD873"]) {
        NSString *device = @"iPhone 4 (CDMA)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_8",);
        self.storage.text = storage;
        NSString *code = @"iPhone3,3";
        self.code.text = code;
    }
    if ([model isEqual: @"MC676"]) {
        NSString *device = @"iPhone 4 (CDMA)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPhone3,3";
        self.code.text = code;
    }
    if ([model isEqual: @"MC678"]) {
        NSString *device = @"iPhone 4 (CDMA)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPhone3,3";
        self.code.text = code;
    }
    if ([model isEqual: @"MD200"] || [model isEqual: @"MD874"]) {
        NSString *device = @"iPhone 4 (CDMA)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_8",);
        self.storage.text = storage;
        NSString *code = @"iPhone3,3";
        self.code.text = code;
    }
    if ([model isEqual: @"MC677"]) {
        NSString *device = @"iPhone 4 (CDMA)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPhone3,3";
        self.code.text = code;
    }
    if ([model isEqual: @"MC679"]) {
        NSString *device = @"iPhone 4 (CDMA)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPhone3,3";
        self.code.text = code;
    }
    
    // iPhone 4s
    
    if ([model isEqual: @"ME259"] || [model isEqual: @"MF257"] || [model isEqual: @"MF261"] || [model isEqual: @"MF263"] || [model isEqual: @"MF265"] || [model isEqual: @"MF269"]) {
        NSString *device = @"iPhone 4s";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_8",);
        self.storage.text = storage;
        NSString *code = @"iPhone4,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MC918"] || [model isEqual: @"MC922"] || [model isEqual: @"MD234"] || [model isEqual: @"MD235"] || [model isEqual: @"MD276"] || [model isEqual: @"MD377"] || [model isEqual: @"MD865"] || [model isEqual: @"ME804"] || [model isEqual: @"MD251"]) {
        NSString *device = @"iPhone 4s";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPhone4,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MC919"] || [model isEqual: @"MC923"] || [model isEqual: @"MD241"] || [model isEqual: @"MD278"] || [model isEqual: @"MD379"]) {
        NSString *device = @"iPhone 4s";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPhone4,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MD257"] || [model isEqual: @"MD258"] || [model isEqual: @"MD269"] || [model isEqual: @"MD280"] || [model isEqual: @"MD381"]) {
        NSString *device = @"iPhone 4s";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPhone4,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MF258"] || [model isEqual: @"MF260"] || [model isEqual: @"MF262"] || [model isEqual: @"MF264"] || [model isEqual: @"MF266"] || [model isEqual: @"MF270"]) {
        NSString *device = @"iPhone 4s";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_8",);
        self.storage.text = storage;
        NSString *code = @"iPhone4,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MC920"] || [model isEqual: @"MC924"] || [model isEqual: @"MD237"] || [model isEqual: @"MD239"] || [model isEqual: @"MD277"] || [model isEqual: @"MD2378"] || [model isEqual: @"MD866"] || [model isEqual: @"ME805"]) {
        NSString *device = @"iPhone 4s";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPhone4,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MC921"] || [model isEqual: @"MD244"] || [model isEqual: @"MD279"] || [model isEqual: @"MD380"] || [model isEqual: @"MD246"] || [model isEqual: @"MD245"]) {
        NSString *device = @"iPhone 4s";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPhone4,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MD260"] || [model isEqual: @"MD271"] || [model isEqual: @"MD272"] || [model isEqual: @"MD281"] || [model isEqual: @"MD382"]) {
        NSString *device = @"iPhone 4s";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPhone4,1";
        self.code.text = code;
    }
    
    // iPhone 5
    
    if ([model isEqual: @"MD293"] || [model isEqual: @"MD634"] || [model isEqual: @"MD638"] || [model isEqual: @"ME486"] || [model isEqual: @"NE486"]) {
        NSString *device = @"iPhone 5";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPhone5,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MD295"] || [model isEqual: @"MD636"] || [model isEqual: @"ME488"] || [model isEqual: @"ND295"]) {
        NSString *device = @"iPhone 5";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPhone5,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MD642"] || [model isEqual: @"MD644"] || [model isEqual: @"ME490"]) {
        NSString *device = @"iPhone 5";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPhone5,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MD294"] || [model isEqual: @"MD635"] || [model isEqual: @"ME487"]) {
        NSString *device = @"iPhone 5";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPhone5,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MD296"] || [model isEqual: @"MD637"] || [model isEqual: @"ME489"]) {
        NSString *device = @"iPhone 5";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPhone5,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MD643"] || [model isEqual: @"MD645"] || [model isEqual: @"ME491"]) {
        NSString *device = @"iPhone 5";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPhone5,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MD297"] || [model isEqual: @"MD654"] || [model isEqual: @"MD656"] || [model isEqual: @"ME039"]) {
        NSString *device = @"iPhone 5 (CDMA)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPhone5,2";
        self.code.text = code;
    }
    if ([model isEqual: @"MD299"] || [model isEqual: @"ND299"] || [model isEqual: @"MD658"] || [model isEqual: @"MD660"] || [model isEqual: @"ME041"]) {
        NSString *device = @"iPhone 5 (CDMA)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPhone5,2";
        self.code.text = code;
    }
    if ([model isEqual: @"MD662"] || [model isEqual: @"MD664"] || [model isEqual: @"MD667"] || [model isEqual: @"ME043"]) {
        NSString *device = @"iPhone 5 (CDMA)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPhone5,2";
        self.code.text = code;
    }
    if ([model isEqual: @"MD298"] || [model isEqual: @"MD655"] || [model isEqual: @"MD657"] || [model isEqual: @"ME043"]) {
        NSString *device = @"iPhone 5 (CDMA)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPhone5,2";
        self.code.text = code;
    }
    if ([model isEqual: @"MD300"] || [model isEqual: @"MD659"] || [model isEqual: @"MD661"] || [model isEqual: @"ME042"]) {
        NSString *device = @"iPhone 5 (CDMA)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPhone5,2";
        self.code.text = code;
    }
    if ([model isEqual: @"MD663"] || [model isEqual: @"MD665"] || [model isEqual: @"MD668"] || [model isEqual: @"ME044"]) {
        NSString *device = @"iPhone 5 (CDMA)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPhone5,2";
        self.code.text = code;
    }
    
    // iPhone 5c
    
    if ([model isEqual: @"MG0T2"] || [model isEqual:@"MG1U2"]) {
        NSString *device = @"iPhone 5c";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLUE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_8",);
        self.storage.text = storage;
        NSString *code = @"iPhone5,3";
        self.code.text = code;
    }
    if ([model isEqual: @"ME507"] || [model isEqual: @"ME567"] || [model isEqual: @"ME555"] || [model isEqual: @"MF366"] || [model isEqual: @"ME531"] || [model isEqual: @"ME495"]) {
        NSString *device = @"iPhone 5c";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLUE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPhone5,3";
        self.code.text = code;
    }
    if ([model isEqual: @"MF136"] || [model isEqual: @"MF161"] || [model isEqual: @"MF156"] || [model isEqual: @"MF371"] || [model isEqual: @"MF146"] || [model isEqual: @"MF131"]) {
        NSString *device = @"iPhone 5c";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLUE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPhone5,3";
        self.code.text = code;
    }
    if ([model isEqual: @"MG0V2"] || [model isEqual: @"MG1V2"]) {
        NSString *device = @"iPhone 5c";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_GREEN",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_8",);
        self.storage.text = storage;
        NSString *code = @"iPhone5,3";
        self.code.text = code;
    }
    if ([model isEqual: @"ME508"] || [model isEqual: @"ME568"] || [model isEqual: @"ME556"] || [model isEqual: @"MF367"] || [model isEqual: @"ME532"] || [model isEqual: @"ME496"]) {
        NSString *device = @"iPhone 5c";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_GREEN",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPhone5,3";
        self.code.text = code;
    }
    if ([model isEqual: @"MF137"] || [model isEqual: @"MF162"] || [model isEqual: @"MF157"] || [model isEqual: @"MF372"] || [model isEqual: @"MF147"] || [model isEqual: @"MF132"]) {
        NSString *device = @"iPhone 5c";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_GREEN",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPhone5,3";
        self.code.text = code;
    }
    if ([model isEqual: @"MG0W2"] || [model isEqual: @"MG1W2"]) {
        NSString *device = @"iPhone 5c";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_PINK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_8",);
        self.storage.text = storage;
        NSString *code = @"iPhone5,3";
        self.code.text = code;
    }
    if ([model isEqual: @"ME509"] || [model isEqual: @"ME569"] || [model isEqual: @"ME557"] || [model isEqual: @"MF368"] || [model isEqual: @"ME533"] || [model isEqual: @"ME497"]) {
        NSString *device = @"iPhone 5c";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_PINK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPhone5,3";
        self.code.text = code;
    }
    if ([model isEqual: @"MF138"] || [model isEqual: @"MF163"] || [model isEqual: @"MF158"] || [model isEqual: @"MF373"] || [model isEqual: @"MF148"] || [model isEqual: @"MF133"]) {
        NSString *device = @"iPhone 5c";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_PINK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPhone5,3";
        self.code.text = code;
    }
    if ([model isEqual: @"MG0Q2"] || [model isEqual: @"MG1Q2"]) {
        NSString *device = @"iPhone 5c";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_8",);
        self.storage.text = storage;
        NSString *code = @"iPhone5,3";
        self.code.text = code;
    }
    if ([model isEqual: @"ME505"] || [model isEqual: @"ME565"] || [model isEqual: @"ME553"] || [model isEqual: @"MF364"] || [model isEqual: @"ME529"] || [model isEqual: @"ME493"]) {
        NSString *device = @"iPhone 5c";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPhone5,3";
        self.code.text = code;
    }
    if ([model isEqual: @"MF134"] || [model isEqual: @"MF159"] || [model isEqual: @"MF154"] || [model isEqual: @"MF369"] || [model isEqual: @"MF144"] || [model isEqual: @"MF129"]) {
        NSString *device = @"iPhone 5c";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPhone5,3";
        self.code.text = code;
    }
    if ([model isEqual: @"MG0R2"] || [model isEqual: @"MG1R2"]) {
        NSString *device = @"iPhone 5c";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_YELLOW",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_8",);
        self.storage.text = storage;
        NSString *code = @"iPhone5,3";
        self.code.text = code;
    }
    if ([model isEqual: @"ME506"] || [model isEqual: @"ME566"] || [model isEqual: @"ME554"] || [model isEqual: @"MF365"] || [model isEqual: @"ME530"] || [model isEqual: @"ME494"]) {
        NSString *device = @"iPhone 5c";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_YELLOW",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPhone5,3";
        self.code.text = code;
    }
    if ([model isEqual: @"MF135"] || [model isEqual: @"MF160"] || [model isEqual: @"MF155"] || [model isEqual: @"MF307"] || [model isEqual: @"MF145"] || [model isEqual: @"MF130"]) {
        NSString *device = @"iPhone 5c";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_YELLOW",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPhone5,3";
        self.code.text = code;
    }
    if ([model isEqual: @"MG902"] || [model isEqual: @"MG152"]) {
        NSString *device = @"iPhone 5c";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLUE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_8",);
        self.storage.text = storage;
        NSString *code = @"iPhone5,4";
        self.code.text = code;
    }
    if ([model isEqual: @"ME681"] || [model isEqual: @"MF323"] || [model isEqual: @"ME501"]) {
        NSString *device = @"iPhone 5c";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLUE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPhone5,4";
        self.code.text = code;
    }
    if ([model isEqual: @"MF106"] || [model isEqual: @"MF328"] || [model isEqual: @"MF094"]) {
        NSString *device = @"iPhone 5c";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLUE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPhone5,4";
        self.code.text = code;
    }
    if ([model isEqual: @"MG912"] || [model isEqual: @"MG162"]) {
        NSString *device = @"iPhone 5c";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_GREEN",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_8",);
        self.storage.text = storage;
        NSString *code = @"iPhone5,4";
        self.code.text = code;
    }
    if ([model isEqual: @"ME682"] || [model isEqual: @"MF324"] || [model isEqual: @"ME502"]) {
        NSString *device = @"iPhone 5c";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_GREEN",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPhone5,4";
        self.code.text = code;
    }
    if ([model isEqual: @"MF107"] || [model isEqual: @"MF329"] || [model isEqual: @"MF095"]) {
        NSString *device = @"iPhone 5c";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_GREEN",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPhone5,4";
        self.code.text = code;
    }
    if ([model isEqual: @"MG922"] || [model isEqual: @"MG172"]) {
        NSString *device = @"iPhone 5c";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_PINK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_8",);
        self.storage.text = storage;
        NSString *code = @"iPhone5,4";
        self.code.text = code;
    }
    if ([model isEqual: @"ME683"] || [model isEqual: @"MF325"] || [model isEqual: @"ME503"]) {
        NSString *device = @"iPhone 5c";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_PINK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPhone5,4";
        self.code.text = code;
    }
    if ([model isEqual: @"MF108"] || [model isEqual: @"MF330"] || [model isEqual: @"MF096"]) {
        NSString *device = @"iPhone 5c";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_PINK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPhone5,4";
        self.code.text = code;
    }
    if ([model isEqual: @"MG8X2"] || [model isEqual: @"MG132"]) {
        NSString *device = @"iPhone 5c";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_8",);
        self.storage.text = storage;
        NSString *code = @"iPhone5,4";
        self.code.text = code;
    }
    if ([model isEqual: @"ME679"] || [model isEqual: @"MF321"] || [model isEqual: @"ME499"]) {
        NSString *device = @"iPhone 5c";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPhone5,4";
        self.code.text = code;
    }
    if ([model isEqual: @"MF104"] || [model isEqual: @"MF326"] || [model isEqual: @"MF092"]) {
        NSString *device = @"iPhone 5c";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPhone5,4";
        self.code.text = code;
    }
    if ([model isEqual: @"MG8Y2"] || [model isEqual: @"MG142"]) {
        NSString *device = @"iPhone 5c";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_YELLOW",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_8",);
        self.storage.text = storage;
        NSString *code = @"iPhone5,4";
        self.code.text = code;
    }
    if ([model isEqual: @"ME680"] || [model isEqual: @"MF322"] || [model isEqual: @"ME500"]) {
        NSString *device = @"iPhone 5c";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_YELLOW",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPhone5,4";
        self.code.text = code;
    }
    if ([model isEqual: @"MF105"] || [model isEqual: @"MF327"] || [model isEqual: @"MF093"]) {
        NSString *device = @"iPhone 5c";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_YELLOW",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPhone5,4";
        self.code.text = code;
    }
    
    // iPhone 5s
    
    if ([model isEqual: @"ME307"] || [model isEqual: @"ME325"] || [model isEqual: @"ME343"] || [model isEqual: @"MF383"] || [model isEqual: @"ME352"]) {
        NSString *device = @"iPhone 5s";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_GOLD",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPhone6,1";
        self.code.text = code;
    }
    if ([model isEqual: @"ME310"] || [model isEqual: @"ME328"] || [model isEqual: @"ME346"] || [model isEqual: @"MF386"] || [model isEqual: @"ME355"]) {
        NSString *device = @"iPhone 5s";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_GOLD",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPhone6,1";
        self.code.text = code;
    }
    if ([model isEqual: @"ME313"] || [model isEqual: @"ME331"] || [model isEqual: @"ME349"] || [model isEqual: @"MF389"] || [model isEqual: @"ME358"]) {
        NSString *device = @"iPhone 5s";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_GOLD",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPhone6,1";
        self.code.text = code;
    }
    if ([model isEqual: @"ME306"] || [model isEqual: @"ME324"] || [model isEqual: @"ME342"] || [model isEqual: @"MF382"] || [model isEqual: @"ME351"]) {
        NSString *device = @"iPhone 5s";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPhone6,1";
        self.code.text = code;
    }
    if ([model isEqual: @"ME309"] || [model isEqual: @"ME327"] || [model isEqual: @"ME345"] || [model isEqual: @"MF385"] || [model isEqual: @"ME354"]) {
        NSString *device = @"iPhone 5s";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPhone6,1";
        self.code.text = code;
    }
    if ([model isEqual: @"ME312"] || [model isEqual: @"ME436"] || [model isEqual: @"ME348"] || [model isEqual: @"MF388"] || [model isEqual: @"ME357"] || [model isEqual: @"NE303"]) {
        NSString *device = @"iPhone 5s";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPhone6,1";
        self.code.text = code;
    }
    if ([model isEqual: @"ME296"] || [model isEqual: @"ME305"] || [model isEqual: @"ME323"] || [model isEqual: @"ME341"] || [model isEqual: @"MF381"] || [model isEqual: @"ME350"]) {
        NSString *device = @"iPhone 5s";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPhone6,1";
        self.code.text = code;
    }
    if ([model isEqual: @"ME308"] || [model isEqual: @"ME326"] || [model isEqual: @"ME344"] || [model isEqual: @"MF384"] || [model isEqual: @"ME353"] || [model isEqual: @"ME299"]) {
        NSString *device = @"iPhone 5s";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPhone6,1";
        self.code.text = code;
    }
    if ([model isEqual: @"ME311"] || [model isEqual: @"ME329"] || [model isEqual: @"ME347"] || [model isEqual: @"MF387"] || [model isEqual: @"ME356"] || [model isEqual: @"ME302"]) {
        NSString *device = @"iPhone 5s";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPhone6,1";
        self.code.text = code;
    }
    if ([model isEqual: @"ME434"] || [model isEqual: @"MF354"]  || [model isEqual: @"ME452"] || [model isEqual: @"ME298"]) {
        NSString *device = @"iPhone 5s";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_GOLD",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPhone6,2";
        self.code.text = code;
    }
    if ([model isEqual: @"ME437"] || [model isEqual: @"MF357"]  || [model isEqual: @"ME455"] || [model isEqual: @"ME301"]) {
        NSString *device = @"iPhone 5s";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_GOLD",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPhone6,2";
        self.code.text = code;
    }
    if ([model isEqual: @"ME440"] || [model isEqual: @"MF360"]  || [model isEqual: @"ME458"] || [model isEqual: @"ME304"]) {
        NSString *device = @"iPhone 5s";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_GOLD",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPhone6,2";
        self.code.text = code;
    }
    if ([model isEqual: @"ME433"] || [model isEqual: @"MF353"]  || [model isEqual: @"ME451"] || [model isEqual: @"ME297"]) {
        NSString *device = @"iPhone 5s";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPhone6,2";
        self.code.text = code;
    }
    if ([model isEqual: @"ME436"] || [model isEqual: @"MF356"]  || [model isEqual: @"ME454"] || [model isEqual: @"ME300"]) {
        NSString *device = @"iPhone 5s";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPhone6,2";
        self.code.text = code;
    }
    if ([model isEqual: @"ME439"] || [model isEqual: @"MF359"]  || [model isEqual: @"ME457"] || [model isEqual: @"ME303"]) {
        NSString *device = @"iPhone 5s";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPhone6,2";
        self.code.text = code;
    }
    if ([model isEqual: @"ME432"] || [model isEqual: @"MF352"]  || [model isEqual: @"ME450"]) {
        NSString *device = @"iPhone 5s";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPhone6,2";
        self.code.text = code;
    }
    if ([model isEqual: @"ME435"] || [model isEqual: @"MF355"]  || [model isEqual: @"ME453"]) {
        NSString *device = @"iPhone 5s";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPhone6,2";
        self.code.text = code;
    }
    if ([model isEqual: @"ME438"] || [model isEqual: @"MF358"]  || [model isEqual: @"ME456"]) {
        NSString *device = @"iPhone 5s";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPhone6,2";
        self.code.text = code;
    }
    
    // iPhone 6
    
    if ([model isEqual: @"MG4P2"] || [model isEqual: @"MG552"] || [model isEqual: @"MG482"] || [model isEqual: @"MG5X2"] || [model isEqual: @"MG6E2"]  || [model isEqual: @"MG6A2"] || [model isEqual: @"MG3C2"]) {
        NSString *device = @"iPhone 6";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_SILVER",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPhone7,2";
        self.code.text = code;
    }
    if ([model isEqual: @"MG4X2"] || [model isEqual: @"MG5C2"] || [model isEqual: @"MG4H2"] || [model isEqual: @"MG642"] || [model isEqual: @"MG6H2"] || [model isEqual: @"MG3K2"]) {
        NSString *device = @"iPhone 6";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_SILVER",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPhone7,2";
        self.code.text = code;
    }
    if ([model isEqual: @"MG4U2"] || [model isEqual: @"MG582"] || [model isEqual: @"MG4C2"] || [model isEqual: @"MG612"] || [model isEqual: @"MG6E2"] || [model isEqual: @"MG3F2"]) {
        NSString *device = @"iPhone 6";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_SILVER",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_128",);
        self.storage.text = storage;
        NSString *code = @"iPhone7,2";
        self.code.text = code;
    }
    if ([model isEqual: @"MG4Q2"] || [model isEqual: @"MG562"] || [model isEqual: @"MG492"] || [model isEqual: @"MG5Y2"] || [model isEqual: @"MG6C2"] || [model isEqual: @"MG3D2"]) {
        NSString *device = @"iPhone 6";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_GOLD",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPhone7,2";
        self.code.text = code;
    }
    if ([model isEqual: @"MG502"] || [model isEqual: @"MG5D2"] || [model isEqual: @"MG4J2"] || [model isEqual: @"MG652"]  || [model isEqual: @"MG6J2"] || [model isEqual: @"MG3L2"]) {
        NSString *device = @"iPhone 6";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_GOLD",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPhone7,2";
        self.code.text = code;
    }
    if ([model isEqual: @"MG4V2"] || [model isEqual: @"MG592"] || [model isEqual: @"MG4E2"] || [model isEqual: @"MG622"] || [model isEqual: @"MG6F2"] || [model isEqual: @"MG3G2"]) {
        NSString *device = @"iPhone 6";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_GOLD",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_128",);
        self.storage.text = storage;
        NSString *code = @"iPhone7,2";
        self.code.text = code;
    }
    if ([model isEqual: @"MG4N2"] || [model isEqual: @"MG542"] || [model isEqual: @"MG472"] || [model isEqual: @"MG5W2"] || [model isEqual: @"MG692"] || [model isEqual: @"MG3A2"]) {
        NSString *device = @"iPhone 6";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_GRAY",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPhone7,2";
        self.code.text = code;
    }
    if ([model isEqual: @"MG4W2"] || [model isEqual: @"MG5A2"] || [model isEqual: @"MG4F2"] || [model isEqual: @"MG632"] || [model isEqual: @"MG6G2"] || [model isEqual: @"MG3H2"]) {
        NSString *device = @"iPhone 6";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_GRAY",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPhone7,2";
        self.code.text = code;
    }
    if ([model isEqual: @"MG4R2"] || [model isEqual: @"MG572"] || [model isEqual: @"MG4A2"] || [model isEqual: @"MG602"] || [model isEqual: @"MG6D2"] || [model isEqual: @"MG3E2"]) {
        NSString *device = @"iPhone 6";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_GRAY",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_128",);
        self.storage.text = storage;
        NSString *code = @"iPhone7,2";
        self.code.text = code;
    }

    // iPhone 6 Plus
    
    if ([model isEqual: @"MGAM2"] || [model isEqual: @"MGC02"] || [model isEqual: @"MGCL2"] || [model isEqual: @"MGCW2"] || [model isEqual: @"MGA92"]) {
        NSString *device = @"iPhone 6 Plus";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_SILVER",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPhone7,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MGAV2"] || [model isEqual: @"MGC62"] || [model isEqual: @"MGCT2"] || [model isEqual: @"MGD32"] || [model isEqual: @"MGAJ2"]) {
        NSString *device = @"iPhone 6 Plus";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_SILVER",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPhone7,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MGAQ2"] || [model isEqual: @"MGC32"] || [model isEqual: @"MGCP2"] || [model isEqual: @"MGD02"] || [model isEqual: @"MGAE2"]) {
        NSString *device = @"iPhone 6 Plus";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_SILVER",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_128",);
        self.storage.text = storage;
        NSString *code = @"iPhone7,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MGAN2"] || [model isEqual: @"MGC12"] || [model isEqual: @"MGCM2"] || [model isEqual: @"MGCX2"] || [model isEqual: @"MGAA2"]) {
        NSString *device = @"iPhone 6 Plus";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_GOLD",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPhone7,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MGAW2"] || [model isEqual: @"MGC72"] || [model isEqual: @"MGCU2"] || [model isEqual: @"MGD42"] || [model isEqual: @"MGAK2"]) {
        NSString *device = @"iPhone 6 Plus";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_GOLD",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPhone7,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MGAR2"] || [model isEqual: @"MGC42"] || [model isEqual: @"MGCQ2"] || [model isEqual: @"MGD12"] || [model isEqual: @"MGAF2"]) {
        NSString *device = @"iPhone 6 Plus";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_GOLD",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_128",);
        self.storage.text = storage;
        NSString *code = @"iPhone7,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MGAL2"] || [model isEqual: @"MGAX2"] || [model isEqual: @"MGCK2"] || [model isEqual: @"MGCV2"] || [model isEqual: @"MGA82"]) {
        NSString *device = @"iPhone 6 Plus";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_GRAY",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPhone7,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MGAU2"] || [model isEqual: @"MGC52"] || [model isEqual: @"MGCR2"] || [model isEqual: @"MGD22"] || [model isEqual: @"MGAH2"]) {
        NSString *device = @"iPhone 6 Plus";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_GRAY",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPhone7,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MGAP2"] || [model isEqual: @"MGC22"] || [model isEqual: @"MGCN2"] || [model isEqual: @"MGCY2"] || [model isEqual: @"MGAC2"]) {
        NSString *device = @"iPhone 6 Plus";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_GRAY",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_128",);
        self.storage.text = storage;
        NSString *code = @"iPhone7,1";
        self.code.text = code;
    }

    
#pragma mark iPod
// Модели iPod touch
    
    // iPod touch 1G
    
    if ([model isEqual: @"MA623"] || [model isEqual: @"MA624"] || [model isEqual: @"MA839"]) {
        NSString *device = @"iPod touch 1G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_8",);
        self.storage.text = storage;
        NSString *code = @"iPod1,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MA627"] || [model isEqual: @"MA628"]) {
        NSString *device = @"iPod touch 1G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPod1,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MB376"]) {
        NSString *device = @"iPod touch 1G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPod1,1";
        self.code.text = code;
    }
    
    // iPod touch 2G
    
    if ([model isEqual: @"MB525"] || [model isEqual: @"MB528"] || [model isEqual: @"MB529"] || [model isEqual: @"MC086"]) {
        NSString *device = @"iPod touch 2G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_8",);
        self.storage.text = storage;
        NSString *code = @"iPod2,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MB531"] || [model isEqual: @"MB532"]) {
        NSString *device = @"iPod touch 2G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPod2,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MB533"] || [model isEqual: @"MB534"]) {
        NSString *device = @"iPod touch 2G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPod2,1";
        self.code.text = code;
    }
    
    // iPod touch 3G
    
    if ([model isEqual: @"MC008"]) {
        NSString *device = @"iPod touch 3G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPod3,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MC011"]) {
        NSString *device = @"iPod touch 3G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPod3,1";
        self.code.text = code;
    }
    
    // iPod touch 4G
    
    if ([model isEqual: @"MC540"]) {
        NSString *device = @"iPod touch 4G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_8",);
        self.storage.text = storage;
        NSString *code = @"iPod4,1";
        self.code.text = code;
    }
    if ([model isEqual: @"ME178"]) {
        NSString *device = @"iPod touch 4G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPod4,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MC544"]) {
        NSString *device = @"iPod touch 4G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPod4,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MC547"]) {
        NSString *device = @"iPod touch 4G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPod4,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MD057"]) {
        NSString *device = @"iPod touch 4G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_8",);
        self.storage.text = storage;
        NSString *code = @"iPod4,1";
        self.code.text = code;
    }
    if ([model isEqual: @"ME179"]) {
        NSString *device = @"iPod touch 4G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPod4,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MD058"]) {
        NSString *device = @"iPod touch 4G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPod4,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MD059"]) {
        NSString *device = @"iPod touch 4G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_WHITE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPod4,1";
        self.code.text = code;
    }
    
    // iPod touch 5G
    
    if ([model isEqual: @"MD723"] || [model isEqual: @"ND723"]) {
        NSString *device = @"iPod touch 5G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPod5,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MD724"]) {
        NSString *device = @"iPod touch 5G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLACK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPod5,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MGG32"]) {
        NSString *device = @"iPod touch 5G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLUE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPod5,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MD717"]) {
        NSString *device = @"iPod touch 5G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLUE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPod5,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MD718"]) {
        NSString *device = @"iPod touch 5G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_BLUE",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPod5,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MGFY2"]) {
        NSString *device = @"iPod touch 5G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_PINK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPod5,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MC903"]) {
        NSString *device = @"iPod touch 5G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_PINK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPod5,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MC904"]) {
        NSString *device = @"iPod touch 5G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_PINK",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPod5,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MGG72"]) {
        NSString *device = @"iPod touch 5G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_RED",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPod5,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MD749"]) {
        NSString *device = @"iPod touch 5G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_RED",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPod5,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MD750"]) {
        NSString *device = @"iPod touch 5G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_RED",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPod5,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MGG82"]) {
        NSString *device = @"iPod touch 5G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_GRAY",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPod5,1";
        self.code.text = code;
    }
    if ([model isEqual: @"ME978"]) {
        NSString *device = @"iPod touch 5G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_GRAY",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPod5,1";
        self.code.text = code;
    }
    if ([model isEqual: @"ME979"]) {
        NSString *device = @"iPod touch 5G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_GRAY",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPod5,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MGG12"]) {
        NSString *device = @"iPod touch 5G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_YELLOW",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPod5,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MD714"]) {
        NSString *device = @"iPod touch 5G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_YELLOW",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPod5,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MD715"]) {
        NSString *device = @"iPod touch 5G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_YELLOW",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPod5,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MGG52"]) {
        NSString *device = @"iPod touch 5G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_SILVER",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPod5,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MD720"]) {
        NSString *device = @"iPod touch 5G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_SILVER",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_32",);
        self.storage.text = storage;
        NSString *code = @"iPod5,1";
        self.code.text = code;
    }
    if ([model isEqual: @"MD721"]) {
        NSString *device = @"iPod touch 5G";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_SILVER",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_64",);
        self.storage.text = storage;
        NSString *code = @"iPod5,1";
        self.code.text = code;
    }
    if ([model isEqual: @"ME643"]) {
        NSString *device = @"iPod touch 5G (No iSight)";
        self.device.text = device;
        NSString *color = NSLocalizedString(@"COLOR_SILVER",);
        self.color.text = color;
        NSString *storage = NSLocalizedString(@"STORAGE_16",);
        self.storage.text = storage;
        NSString *code = @"iPod5,1";
        self.code.text = code;
    }
    
// Закрываем действие кнопки
}



// Закрываем клавиатуру по нажатии Done
- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == self.modelid) {
        [theTextField resignFirstResponder];
    }
    if (theTextField == self.regionid) {
        [theTextField resignFirstResponder];
    }
    return YES;
}

@end