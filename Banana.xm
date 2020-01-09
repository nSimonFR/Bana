@interface SBMediaController : NSObject
-(BOOL)isPlaying;
@end

@interface AVOutputDevice : NSObject
-(void)setCurrentBluetoothListeningMode:(NSString *)arg1;
@end

@interface MPAVRoute : NSObject
-(id)logicalLeaderOutputDevice;
@end

@interface MPAVRoutingController : NSObject
@property(readonly, nonatomic) MPAVRoute *pickedRoute;
@end

%hook SBMediaController
-(void)_mediaRemoteNowPlayingApplicationIsPlayingDidChange:(id)arg1 {
  %orig(arg1);
  [[[[[self valueForKey:@"_routingController"] pickedRoute] logicalLeaderOutputDevice] valueForKey:@"_avOutputDevice"] setCurrentBluetoothListeningMode:[self isPlaying] ? @"AVOutputDeviceBluetoothListeningModeActiveNoiseCancellation" : @"AVOutputDeviceBluetoothListeningModeAudioTransparency"];
}
%end
