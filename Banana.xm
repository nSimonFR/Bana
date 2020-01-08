@interface SBMediaController : NSObject
-(BOOL)isPlaying;
@end

@interface BluetoothManager : NSObject
+(id)sharedInstance;
-(id)connectedDevices;
@end

@interface BluetoothDevice
-(BOOL)magicPaired;
-(BOOL)setListeningMode:(unsigned)arg1 ;
@end

%hook SBMediaController
-(void)_mediaRemoteNowPlayingApplicationIsPlayingDidChange:(id)arg1 {
  %orig(arg1);
  BluetoothManager *manager = [NSClassFromString(@"BluetoothManager") sharedInstance];
  for(BluetoothDevice *device in manager.connectedDevices){
    if([device magicPaired]){
      [device setListeningMode:[self isPlaying] ? 2 : 3];
    }
  }
}
%end
