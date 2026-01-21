; ModuleID = 'marshal_methods.arm64-v8a.ll'
source_filename = "marshal_methods.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [382 x ptr] zeroinitializer, align 8

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [1146 x i64] [
	i64 u0x001e58127c546039, ; 0: lib_System.Globalization.dll.so => 42
	i64 u0x0024d0f62dee05bd, ; 1: Xamarin.KotlinX.Coroutines.Core.dll => 335
	i64 u0x0071cf2d27b7d61e, ; 2: lib_Xamarin.AndroidX.SwipeRefreshLayout.dll.so => 291
	i64 u0x01109b0e4d99e61f, ; 3: System.ComponentModel.Annotations.dll => 13
	i64 u0x01af0bd6467d518e, ; 4: lib_ZXing.Net.MAUI.dll.so => 341
	i64 u0x02123411c4e01926, ; 5: lib_Xamarin.AndroidX.Navigation.Runtime.dll.so => 279
	i64 u0x022e81ea9c46e03a, ; 6: lib_CommunityToolkit.Maui.Core.dll.so => 181
	i64 u0x0284512fad379f7e, ; 7: System.Runtime.Handles => 107
	i64 u0x0290aeaf49936690, ; 8: UltimateWalletFinal.dll => 0
	i64 u0x02a4c5a44384f885, ; 9: Microsoft.Extensions.Caching.Memory => 191
	i64 u0x02abedc11addc1ed, ; 10: lib_Mono.Android.Runtime.dll.so => 174
	i64 u0x02f55bf70672f5c8, ; 11: lib_System.IO.FileSystem.DriveInfo.dll.so => 48
	i64 u0x032267b2a94db371, ; 12: lib_Xamarin.AndroidX.AppCompat.dll.so => 227
	i64 u0x0352de45f8d00aee, ; 13: UltimateWalletFinal => 0
	i64 u0x03621c804933a890, ; 14: System.Buffers => 7
	i64 u0x0381a2d96cb016fd, ; 15: Xamarin.Google.MLKit.Common.dll => 321
	i64 u0x0399610510a38a38, ; 16: lib_System.Private.DataContractSerialization.dll.so => 88
	i64 u0x043032f1d071fae0, ; 17: ru/Microsoft.Maui.Controls.resources => 367
	i64 u0x044440a55165631e, ; 18: lib-cs-Microsoft.Maui.Controls.resources.dll.so => 345
	i64 u0x046eb1581a80c6b0, ; 19: vi/Microsoft.Maui.Controls.resources => 373
	i64 u0x047408741db2431a, ; 20: Xamarin.AndroidX.DynamicAnimation => 253
	i64 u0x0517ef04e06e9f76, ; 21: System.Net.Primitives => 72
	i64 u0x051a3be159e4ef99, ; 22: Xamarin.GooglePlayServices.Tasks => 327
	i64 u0x0565d18c6da3de38, ; 23: Xamarin.AndroidX.RecyclerView => 283
	i64 u0x0581db89237110e9, ; 24: lib_System.Collections.dll.so => 12
	i64 u0x05989cb940b225a9, ; 25: Microsoft.Maui.dll => 207
	i64 u0x05a1c25e78e22d87, ; 26: lib_System.Runtime.CompilerServices.Unsafe.dll.so => 104
	i64 u0x06076b5d2b581f08, ; 27: zh-HK/Microsoft.Maui.Controls.resources => 374
	i64 u0x06388ffe9f6c161a, ; 28: System.Xml.Linq.dll => 159
	i64 u0x06600c4c124cb358, ; 29: System.Configuration.dll => 19
	i64 u0x067f95c5ddab55b3, ; 30: lib_Xamarin.AndroidX.Fragment.Ktx.dll.so => 258
	i64 u0x0680a433c781bb3d, ; 31: Xamarin.AndroidX.Collection.Jvm => 239
	i64 u0x069fff96ec92a91d, ; 32: System.Xml.XPath.dll => 164
	i64 u0x06b4a7e6acbbf1cb, ; 33: Xamarin.Google.MLKit.BarcodeScanning.dll => 319
	i64 u0x070b0847e18dab68, ; 34: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 255
	i64 u0x0739448d84d3b016, ; 35: lib_Xamarin.AndroidX.VectorDrawable.dll.so => 296
	i64 u0x07469f2eecce9e85, ; 36: mscorlib.dll => 170
	i64 u0x07c57877c7ba78ad, ; 37: ru/Microsoft.Maui.Controls.resources.dll => 367
	i64 u0x07dcdc7460a0c5e4, ; 38: System.Collections.NonGeneric => 10
	i64 u0x08122e52765333c8, ; 39: lib_Microsoft.Extensions.Logging.Debug.dll.so => 201
	i64 u0x088610fc2509f69e, ; 40: lib_Xamarin.AndroidX.VectorDrawable.Animated.dll.so => 297
	i64 u0x08a7c865576bbde7, ; 41: System.Reflection.Primitives => 98
	i64 u0x08c9d051a4a817e5, ; 42: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 251
	i64 u0x08f3c9788ee2153c, ; 43: Xamarin.AndroidX.DrawerLayout => 252
	i64 u0x09138715c92dba90, ; 44: lib_System.ComponentModel.Annotations.dll.so => 13
	i64 u0x0919c28b89381a0b, ; 45: lib_Microsoft.Extensions.Options.dll.so => 202
	i64 u0x092266563089ae3e, ; 46: lib_System.Collections.NonGeneric.dll.so => 10
	i64 u0x098b50f911ccea8d, ; 47: lib_Xamarin.GooglePlayServices.Basement.dll.so => 325
	i64 u0x09d144a7e214d457, ; 48: System.Security.Cryptography => 129
	i64 u0x09da6dfc3439e851, ; 49: lib_Xamarin.Firebase.Components.dll.so => 305
	i64 u0x09e2b9f743db21a8, ; 50: lib_System.Reflection.Metadata.dll.so => 97
	i64 u0x0a805f95d98f597b, ; 51: lib_Microsoft.Extensions.Caching.Abstractions.dll.so => 190
	i64 u0x0a832f2c97e71637, ; 52: Xamarin.AndroidX.Camera.Video => 235
	i64 u0x0abb3e2b271edc45, ; 53: System.Threading.Channels.dll => 143
	i64 u0x0b06b1feab070143, ; 54: System.Formats.Tar => 39
	i64 u0x0b3b632c3bbee20c, ; 55: sk/Microsoft.Maui.Controls.resources => 368
	i64 u0x0b6aff547b84fbe9, ; 56: Xamarin.KotlinX.Serialization.Core.Jvm => 338
	i64 u0x0be2e1f8ce4064ed, ; 57: Xamarin.AndroidX.ViewPager => 299
	i64 u0x0c3ca6cc978e2aae, ; 58: pt-BR/Microsoft.Maui.Controls.resources => 364
	i64 u0x0c3d7adcdb333bf0, ; 59: Xamarin.AndroidX.Camera.Lifecycle => 234
	i64 u0x0c59ad9fbbd43abe, ; 60: Mono.Android => 175
	i64 u0x0c65741e86371ee3, ; 61: lib_Xamarin.Android.Glide.GifDecoder.dll.so => 221
	i64 u0x0c74af560004e816, ; 62: Microsoft.Win32.Registry.dll => 5
	i64 u0x0c7790f60165fc06, ; 63: lib_Microsoft.Maui.Essentials.dll.so => 208
	i64 u0x0c83c82812e96127, ; 64: lib_System.Net.Mail.dll.so => 68
	i64 u0x0cce4bce83380b7f, ; 65: Xamarin.AndroidX.Security.SecurityCrypto => 288
	i64 u0x0d13cd7cce4284e4, ; 66: System.Security.SecureString => 132
	i64 u0x0d63f4f73521c24f, ; 67: lib_Xamarin.AndroidX.SavedState.SavedState.Ktx.dll.so => 287
	i64 u0x0e04e702012f8463, ; 68: Xamarin.AndroidX.Emoji2 => 254
	i64 u0x0e14e73a54dda68e, ; 69: lib_System.Net.NameResolution.dll.so => 69
	i64 u0x0f37dd7a62ae99af, ; 70: lib_Xamarin.AndroidX.Collection.Ktx.dll.so => 240
	i64 u0x0f5e7abaa7cf470a, ; 71: System.Net.HttpListener => 67
	i64 u0x0fc8fe43ca01a5df, ; 72: MySqlConnector.dll => 211
	i64 u0x1001f97bbe242e64, ; 73: System.IO.UnmanagedMemoryStream => 57
	i64 u0x102a31b45304b1da, ; 74: Xamarin.AndroidX.CustomView => 250
	i64 u0x1065c4cb554c3d75, ; 75: System.IO.IsolatedStorage.dll => 52
	i64 u0x10f6cfcbcf801616, ; 76: System.IO.Compression.Brotli => 43
	i64 u0x114443cdcf2091f1, ; 77: System.Security.Cryptography.Primitives => 127
	i64 u0x118d570f508803d1, ; 78: Xamarin.AndroidX.Camera.Camera2.dll => 232
	i64 u0x11a603952763e1d4, ; 79: System.Net.Mail => 68
	i64 u0x11a70d0e1009fb11, ; 80: System.Net.WebSockets.dll => 83
	i64 u0x11f26371eee0d3c1, ; 81: lib_Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll.so => 268
	i64 u0x11fbe62d469cc1c8, ; 82: Microsoft.VisualStudio.DesignTools.TapContract.dll => 379
	i64 u0x12128b3f59302d47, ; 83: lib_System.Xml.Serialization.dll.so => 161
	i64 u0x123639456fb056da, ; 84: System.Reflection.Emit.Lightweight.dll => 94
	i64 u0x124f38a5d8cb5fb8, ; 85: K4os.Compression.LZ4.dll => 184
	i64 u0x12521e9764603eaa, ; 86: lib_System.Resources.Reader.dll.so => 101
	i64 u0x125b7f94acb989db, ; 87: Xamarin.AndroidX.RecyclerView.dll => 283
	i64 u0x12d3b63863d4ab0b, ; 88: lib_System.Threading.Overlapped.dll.so => 144
	i64 u0x134eab1061c395ee, ; 89: System.Transactions => 154
	i64 u0x138567fa954faa55, ; 90: Xamarin.AndroidX.Browser => 231
	i64 u0x13a01de0cbc3f06c, ; 91: lib-fr-Microsoft.Maui.Controls.resources.dll.so => 351
	i64 u0x13beedefb0e28a45, ; 92: lib_System.Xml.XmlDocument.dll.so => 165
	i64 u0x13f1e5e209e91af4, ; 93: lib_Java.Interop.dll.so => 172
	i64 u0x13f1e880c25d96d1, ; 94: he/Microsoft.Maui.Controls.resources => 352
	i64 u0x1403071365bcd83a, ; 95: Xamarin.Firebase.Annotations => 304
	i64 u0x143d8ea60a6a4011, ; 96: Microsoft.Extensions.DependencyInjection.Abstractions => 195
	i64 u0x1497051b917530bd, ; 97: lib_System.Net.WebSockets.dll.so => 83
	i64 u0x14b78ce3adce0011, ; 98: Microsoft.VisualStudio.DesignTools.TapContract => 379
	i64 u0x14d612a531c79c05, ; 99: Xamarin.JSpecify.dll => 330
	i64 u0x14e68447938213b7, ; 100: Xamarin.AndroidX.Collection.Ktx.dll => 240
	i64 u0x152a448bd1e745a7, ; 101: Microsoft.Win32.Primitives => 4
	i64 u0x1557de0138c445f4, ; 102: lib_Microsoft.Win32.Registry.dll.so => 5
	i64 u0x159cc6c81072f00e, ; 103: lib_System.Diagnostics.EventLog.dll.so => 214
	i64 u0x15bdc156ed462f2f, ; 104: lib_System.IO.FileSystem.dll.so => 51
	i64 u0x15e300c2c1668655, ; 105: System.Resources.Writer.dll => 103
	i64 u0x16bf2a22df043a09, ; 106: System.IO.Pipes.dll => 56
	i64 u0x16ea2b318ad2d830, ; 107: System.Security.Cryptography.Algorithms => 122
	i64 u0x16eeae54c7ebcc08, ; 108: System.Reflection.dll => 100
	i64 u0x17125c9a85b4929f, ; 109: lib_netstandard.dll.so => 171
	i64 u0x1716866f7416792e, ; 110: lib_System.Security.AccessControl.dll.so => 120
	i64 u0x174f71c46216e44a, ; 111: Xamarin.KotlinX.Coroutines.Core => 335
	i64 u0x1752c12f1e1fc00c, ; 112: System.Core => 21
	i64 u0x17b56e25558a5d36, ; 113: lib-hu-Microsoft.Maui.Controls.resources.dll.so => 355
	i64 u0x17f9358913beb16a, ; 114: System.Text.Encodings.Web => 139
	i64 u0x1809fb23f29ba44a, ; 115: lib_System.Reflection.TypeExtensions.dll.so => 99
	i64 u0x18402a709e357f3b, ; 116: lib_Xamarin.KotlinX.Serialization.Core.Jvm.dll.so => 338
	i64 u0x18a9befae51bb361, ; 117: System.Net.WebClient => 79
	i64 u0x18f0ce884e87d89a, ; 118: nb/Microsoft.Maui.Controls.resources.dll => 361
	i64 u0x18f6f1112e2b07e0, ; 119: Xamarin.Google.MLKit.Vision.Common.dll => 322
	i64 u0x19777fba3c41b398, ; 120: Xamarin.AndroidX.Startup.StartupRuntime.dll => 290
	i64 u0x19a4c090f14ebb66, ; 121: System.Security.Claims => 121
	i64 u0x1a040febb58bf51e, ; 122: lib_Xamarin.AndroidX.Camera.View.dll.so => 236
	i64 u0x1a91866a319e9259, ; 123: lib_System.Collections.Concurrent.dll.so => 8
	i64 u0x1aac34d1917ba5d3, ; 124: lib_System.dll.so => 168
	i64 u0x1aad60783ffa3e5b, ; 125: lib-th-Microsoft.Maui.Controls.resources.dll.so => 370
	i64 u0x1aea8f1c3b282172, ; 126: lib_System.Net.Ping.dll.so => 71
	i64 u0x1b4b7a1d0d265fa2, ; 127: Xamarin.Android.Glide.DiskLruCache => 220
	i64 u0x1bbdb16cfa73e785, ; 128: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.Android => 269
	i64 u0x1bc766e07b2b4241, ; 129: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 284
	i64 u0x1c2aead3a4a75e77, ; 130: BarcodeScanning.Native.Maui => 178
	i64 u0x1c753b5ff15bce1b, ; 131: Mono.Android.Runtime.dll => 174
	i64 u0x1c7cbc0ecd18cdaf, ; 132: Xamarin.Firebase.Encoders.dll => 306
	i64 u0x1cd47467799d8250, ; 133: System.Threading.Tasks.dll => 148
	i64 u0x1d23eafdc6dc346c, ; 134: System.Globalization.Calendars.dll => 40
	i64 u0x1d4c109ca6e27ed8, ; 135: lib_Microsoft.Maui.Controls.Compatibility.dll.so => 204
	i64 u0x1da4110562816681, ; 136: Xamarin.AndroidX.Security.SecurityCrypto.dll => 288
	i64 u0x1db6820994506bf5, ; 137: System.IO.FileSystem.AccessControl.dll => 47
	i64 u0x1dba6509cc55b56f, ; 138: lib_Google.Protobuf.dll.so => 182
	i64 u0x1dbb0c2c6a999acb, ; 139: System.Diagnostics.StackTrace => 30
	i64 u0x1e3d87657e9659bc, ; 140: Xamarin.AndroidX.Navigation.UI => 281
	i64 u0x1e71143913d56c10, ; 141: lib-ko-Microsoft.Maui.Controls.resources.dll.so => 359
	i64 u0x1e7c31185e2fb266, ; 142: lib_System.Threading.Tasks.Parallel.dll.so => 147
	i64 u0x1ed8fcce5e9b50a0, ; 143: Microsoft.Extensions.Options.dll => 202
	i64 u0x1f055d15d807e1b2, ; 144: System.Xml.XmlSerializer => 166
	i64 u0x1f1ed22c1085f044, ; 145: lib_System.Diagnostics.FileVersionInfo.dll.so => 28
	i64 u0x1f61df9c5b94d2c1, ; 146: lib_System.Numerics.dll.so => 86
	i64 u0x1f750bb5421397de, ; 147: lib_Xamarin.AndroidX.Tracing.Tracing.dll.so => 292
	i64 u0x20237ea48006d7a8, ; 148: lib_System.Net.WebClient.dll.so => 79
	i64 u0x209375905fcc1bad, ; 149: lib_System.IO.Compression.Brotli.dll.so => 43
	i64 u0x20edad43b59fbd8e, ; 150: System.Security.Permissions.dll => 216
	i64 u0x20fab3cf2dfbc8df, ; 151: lib_System.Diagnostics.Process.dll.so => 29
	i64 u0x2110167c128cba15, ; 152: System.Globalization => 42
	i64 u0x21419508838f7547, ; 153: System.Runtime.CompilerServices.VisualC => 105
	i64 u0x2174319c0d835bc9, ; 154: System.Runtime => 119
	i64 u0x2198e5bc8b7153fa, ; 155: Xamarin.AndroidX.Annotation.Experimental.dll => 225
	i64 u0x219ea1b751a4dee4, ; 156: lib_System.IO.Compression.ZipFile.dll.so => 45
	i64 u0x21cc7e445dcd5469, ; 157: System.Reflection.Emit.ILGeneration => 93
	i64 u0x220fd4f2e7c48170, ; 158: th/Microsoft.Maui.Controls.resources => 370
	i64 u0x224538d85ed15a82, ; 159: System.IO.Pipes => 56
	i64 u0x22908438c6bed1af, ; 160: lib_System.Threading.Timer.dll.so => 151
	i64 u0x22fbc14e981e3b45, ; 161: lib_Microsoft.VisualStudio.DesignTools.MobileTapContracts.dll.so => 378
	i64 u0x2347c268e3e4e536, ; 162: Xamarin.GooglePlayServices.Basement.dll => 325
	i64 u0x234b2420fe4b9bdc, ; 163: lib_K4os.Compression.LZ4.dll.so => 184
	i64 u0x237be844f1f812c7, ; 164: System.Threading.Thread.dll => 149
	i64 u0x23807c59646ec4f3, ; 165: lib_Microsoft.EntityFrameworkCore.dll.so => 187
	i64 u0x23852b3bdc9f7096, ; 166: System.Resources.ResourceManager => 102
	i64 u0x23986dd7e5d4fc01, ; 167: System.IO.FileSystem.Primitives.dll => 49
	i64 u0x2407aef2bbe8fadf, ; 168: System.Console => 20
	i64 u0x240abe014b27e7d3, ; 169: Xamarin.AndroidX.Core.dll => 246
	i64 u0x247619fe4413f8bf, ; 170: System.Runtime.Serialization.Primitives.dll => 116
	i64 u0x24de8d301281575e, ; 171: Xamarin.Android.Glide => 218
	i64 u0x252073cc3caa62c2, ; 172: fr/Microsoft.Maui.Controls.resources.dll => 351
	i64 u0x256b8d41255f01b1, ; 173: Xamarin.Google.Crypto.Tink.Android => 316
	i64 u0x25e1850d10cdc8f7, ; 174: lib_Xamarin.AndroidX.Camera.Camera2.dll.so => 232
	i64 u0x2662c629b96b0b30, ; 175: lib_Xamarin.Kotlin.StdLib.dll.so => 331
	i64 u0x268c1439f13bcc29, ; 176: lib_Microsoft.Extensions.Primitives.dll.so => 203
	i64 u0x268f1dca6d06d437, ; 177: Xamarin.AndroidX.Camera.Core => 233
	i64 u0x26a670e154a9c54b, ; 178: System.Reflection.Extensions.dll => 96
	i64 u0x26d077d9678fe34f, ; 179: System.IO.dll => 58
	i64 u0x273f3515de5faf0d, ; 180: id/Microsoft.Maui.Controls.resources.dll => 356
	i64 u0x2742545f9094896d, ; 181: hr/Microsoft.Maui.Controls.resources => 354
	i64 u0x274d85d83ad40513, ; 182: lib_Xamarin.AndroidX.Window.WindowCore.dll.so => 302
	i64 u0x2759af78ab94d39b, ; 183: System.Net.WebSockets => 83
	i64 u0x27b2b16f3e9de038, ; 184: Xamarin.Google.Crypto.Tink.Android.dll => 316
	i64 u0x27b410442fad6cf1, ; 185: Java.Interop.dll => 172
	i64 u0x27b97e0d52c3034a, ; 186: System.Diagnostics.Debug => 26
	i64 u0x27eb21c6eb99d774, ; 187: Xamarin.Kotlin.StdLib.Jdk8.dll => 333
	i64 u0x2801845a2c71fbfb, ; 188: System.Net.Primitives.dll => 72
	i64 u0x286835e259162700, ; 189: lib_Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll.so => 282
	i64 u0x28e52865585a1ebe, ; 190: Microsoft.Extensions.Diagnostics.Abstractions.dll => 196
	i64 u0x2949f3617a02c6b2, ; 191: Xamarin.AndroidX.ExifInterface => 256
	i64 u0x29aeab763a527e52, ; 192: lib_Xamarin.AndroidX.Navigation.Common.Android.dll.so => 277
	i64 u0x29f947844fb7fc11, ; 193: Microsoft.Maui.Controls.HotReload.Forms => 377
	i64 u0x2a128783efe70ba0, ; 194: uk/Microsoft.Maui.Controls.resources.dll => 372
	i64 u0x2a33788f8b8b5430, ; 195: Xamarin.Google.MLKit.BarcodeScanning.Common => 320
	i64 u0x2a3b095612184159, ; 196: lib_System.Net.NetworkInformation.dll.so => 70
	i64 u0x2a6507a5ffabdf28, ; 197: System.Diagnostics.TraceSource.dll => 33
	i64 u0x2ac82b8d1ecafc7c, ; 198: lib_System.Windows.Extensions.dll.so => 217
	i64 u0x2ad156c8e1354139, ; 199: fi/Microsoft.Maui.Controls.resources => 350
	i64 u0x2ad5d6b13b7a3e04, ; 200: System.ComponentModel.DataAnnotations.dll => 14
	i64 u0x2af298f63581d886, ; 201: System.Text.RegularExpressions.dll => 141
	i64 u0x2afc1c4f898552ee, ; 202: lib_System.Formats.Asn1.dll.so => 38
	i64 u0x2b148910ed40fbf9, ; 203: zh-Hant/Microsoft.Maui.Controls.resources.dll => 376
	i64 u0x2b6989d78cba9a15, ; 204: Xamarin.AndroidX.Concurrent.Futures.dll => 241
	i64 u0x2c517f906db0a191, ; 205: Xamarin.Google.Android.DataTransport.TransportBackendCct.dll => 310
	i64 u0x2c8bd14bb93a7d82, ; 206: lib-pl-Microsoft.Maui.Controls.resources.dll.so => 363
	i64 u0x2cbd9262ca785540, ; 207: lib_System.Text.Encoding.CodePages.dll.so => 136
	i64 u0x2cc9e1fed6257257, ; 208: lib_System.Reflection.Emit.Lightweight.dll.so => 94
	i64 u0x2cd723e9fe623c7c, ; 209: lib_System.Private.Xml.Linq.dll.so => 90
	i64 u0x2d169d318a968379, ; 210: System.Threading.dll => 152
	i64 u0x2d20145f27cfc1d2, ; 211: Xamarin.AndroidX.Window.WindowCore.Jvm.dll => 303
	i64 u0x2d47774b7d993f59, ; 212: sv/Microsoft.Maui.Controls.resources.dll => 369
	i64 u0x2d5ffcae1ad0aaca, ; 213: System.Data.dll => 24
	i64 u0x2db915caf23548d2, ; 214: System.Text.Json.dll => 140
	i64 u0x2dcaa0bb15a4117a, ; 215: System.IO.UnmanagedMemoryStream.dll => 57
	i64 u0x2e2ced2c3c6a1edc, ; 216: lib_System.Threading.AccessControl.dll.so => 142
	i64 u0x2e5a40c319acb800, ; 217: System.IO.FileSystem => 51
	i64 u0x2e6f1f226821322a, ; 218: el/Microsoft.Maui.Controls.resources.dll => 348
	i64 u0x2e7ae36a08a1dbb3, ; 219: Xamarin.Firebase.Encoders => 306
	i64 u0x2f02f94df3200fe5, ; 220: System.Diagnostics.Process => 29
	i64 u0x2f2e98e1c89b1aff, ; 221: System.Xml.ReaderWriter => 160
	i64 u0x2f5911d9ba814e4e, ; 222: System.Diagnostics.Tracing => 34
	i64 u0x2f84070a459bc31f, ; 223: lib_System.Xml.dll.so => 167
	i64 u0x2feb4d2fcda05cfd, ; 224: Microsoft.Extensions.Caching.Abstractions.dll => 190
	i64 u0x30829702a4057a12, ; 225: Xamarin.Google.Android.DataTransport.TransportBackendCct => 310
	i64 u0x308fa4be11ae848e, ; 226: lib_Pomelo.EntityFrameworkCore.MySql.dll.so => 212
	i64 u0x309ee9eeec09a71e, ; 227: lib_Xamarin.AndroidX.Fragment.dll.so => 257
	i64 u0x30c6dda129408828, ; 228: System.IO.IsolatedStorage => 52
	i64 u0x31195fef5d8fb552, ; 229: _Microsoft.Android.Resource.Designer.dll => 381
	i64 u0x312c8ed623cbfc8d, ; 230: Xamarin.AndroidX.Window.dll => 301
	i64 u0x31496b779ed0663d, ; 231: lib_System.Reflection.DispatchProxy.dll.so => 92
	i64 u0x3156b7decbc904e6, ; 232: Xamarin.AndroidX.Tracing.Tracing.Ktx.dll => 294
	i64 u0x3200b1eae7efaded, ; 233: lib_Xamarin.Firebase.Encoders.JSON.dll.so => 307
	i64 u0x32243413e774362a, ; 234: Xamarin.AndroidX.CardView.dll => 237
	i64 u0x3235427f8d12dae1, ; 235: lib_System.Drawing.Primitives.dll.so => 35
	i64 u0x329753a17a517811, ; 236: fr/Microsoft.Maui.Controls.resources => 351
	i64 u0x32aa989ff07a84ff, ; 237: lib_System.Xml.ReaderWriter.dll.so => 160
	i64 u0x33829542f112d59b, ; 238: System.Collections.Immutable => 9
	i64 u0x33a31443733849fe, ; 239: lib-es-Microsoft.Maui.Controls.resources.dll.so => 349
	i64 u0x341abc357fbb4ebf, ; 240: lib_System.Net.Sockets.dll.so => 78
	i64 u0x346a212343615ac5, ; 241: lib_System.Linq.AsyncEnumerable.dll.so => 59
	i64 u0x3496c1e2dcaf5ecc, ; 242: lib_System.IO.Pipes.AccessControl.dll.so => 55
	i64 u0x34dfd74fe2afcf37, ; 243: Microsoft.Maui => 207
	i64 u0x34e292762d9615df, ; 244: cs/Microsoft.Maui.Controls.resources.dll => 345
	i64 u0x34f550615634aa64, ; 245: lib_Xamarin.Firebase.Encoders.dll.so => 306
	i64 u0x3508234247f48404, ; 246: Microsoft.Maui.Controls => 205
	i64 u0x353590da528c9d22, ; 247: System.ComponentModel.Annotations => 13
	i64 u0x3549870798b4cd30, ; 248: lib_Xamarin.AndroidX.ViewPager2.dll.so => 300
	i64 u0x355282fc1c909694, ; 249: Microsoft.Extensions.Configuration => 192
	i64 u0x3552fc5d578f0fbf, ; 250: Xamarin.AndroidX.Arch.Core.Common => 229
	i64 u0x355c649948d55d97, ; 251: lib_System.Runtime.Intrinsics.dll.so => 111
	i64 u0x35ea9d1c6834bc8c, ; 252: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 272
	i64 u0x3628ab68db23a01a, ; 253: lib_System.Diagnostics.Tools.dll.so => 32
	i64 u0x364703ab05867b92, ; 254: Xamarin.Firebase.Components => 305
	i64 u0x3673b042508f5b6b, ; 255: lib_System.Runtime.Extensions.dll.so => 106
	i64 u0x36740f1a8ecdc6c4, ; 256: System.Numerics => 86
	i64 u0x36b2b50fdf589ae2, ; 257: System.Reflection.Emit.Lightweight => 94
	i64 u0x36cada77dc79928b, ; 258: System.IO.MemoryMappedFiles => 53
	i64 u0x374ef46b06791af6, ; 259: System.Reflection.Primitives.dll => 98
	i64 u0x376bf93e521a5417, ; 260: lib_Xamarin.Jetbrains.Annotations.dll.so => 329
	i64 u0x37bc29f3183003b6, ; 261: lib_System.IO.dll.so => 58
	i64 u0x380134e03b1e160a, ; 262: System.Collections.Immutable.dll => 9
	i64 u0x38049b5c59b39324, ; 263: System.Runtime.CompilerServices.Unsafe => 104
	i64 u0x385c17636bb6fe6e, ; 264: Xamarin.AndroidX.CustomView.dll => 250
	i64 u0x38869c811d74050e, ; 265: System.Net.NameResolution.dll => 69
	i64 u0x38abeb3e9d5fb0ef, ; 266: lib_UltimateWalletFinal.dll.so => 0
	i64 u0x39251dccb84bdcaa, ; 267: lib_System.Configuration.ConfigurationManager.dll.so => 213
	i64 u0x393c226616977fdb, ; 268: lib_Xamarin.AndroidX.ViewPager.dll.so => 299
	i64 u0x395e37c3334cf82a, ; 269: lib-ca-Microsoft.Maui.Controls.resources.dll.so => 344
	i64 u0x39c3107c28752af1, ; 270: lib_Microsoft.Extensions.FileProviders.Abstractions.dll.so => 197
	i64 u0x3ab5859054645f72, ; 271: System.Security.Cryptography.Primitives.dll => 127
	i64 u0x3ad75090c3fac0e9, ; 272: lib_Xamarin.AndroidX.ResourceInspection.Annotation.dll.so => 284
	i64 u0x3ae44ac43a1fbdbb, ; 273: System.Runtime.Serialization => 118
	i64 u0x3b2c47fe17204e4d, ; 274: MySql.Data => 210
	i64 u0x3b860f9932505633, ; 275: lib_System.Text.Encoding.Extensions.dll.so => 137
	i64 u0x3be99b43dd39dd37, ; 276: Xamarin.AndroidX.SavedState.SavedState.Android => 286
	i64 u0x3c3aafb6b3a00bf6, ; 277: lib_System.Security.Cryptography.X509Certificates.dll.so => 128
	i64 u0x3c4049146b59aa90, ; 278: System.Runtime.InteropServices.JavaScript => 108
	i64 u0x3c7c495f58ac5ee9, ; 279: Xamarin.Kotlin.StdLib => 331
	i64 u0x3c7e5ed3d5db71bb, ; 280: System.Security => 133
	i64 u0x3cd9d281d402eb9b, ; 281: Xamarin.AndroidX.Browser.dll => 231
	i64 u0x3ced6a4f3010aa96, ; 282: ZXing.Net.MAUI.Controls => 342
	i64 u0x3d1c50cc001a991e, ; 283: Xamarin.Google.Guava.ListenableFuture.dll => 318
	i64 u0x3d2b1913edfc08d7, ; 284: lib_System.Threading.ThreadPool.dll.so => 150
	i64 u0x3d46f0b995082740, ; 285: System.Xml.Linq => 159
	i64 u0x3d8a8f400514a790, ; 286: Xamarin.AndroidX.Fragment.Ktx.dll => 258
	i64 u0x3d9c2a242b040a50, ; 287: lib_Xamarin.AndroidX.Core.dll.so => 246
	i64 u0x3daa14724d8f58e8, ; 288: Google.Protobuf.dll => 182
	i64 u0x3dbb6b9f5ab90fa7, ; 289: lib_Xamarin.AndroidX.DynamicAnimation.dll.so => 253
	i64 u0x3e5441657549b213, ; 290: Xamarin.AndroidX.ResourceInspection.Annotation => 284
	i64 u0x3e57d4d195c53c2e, ; 291: System.Reflection.TypeExtensions => 99
	i64 u0x3e616ab4ed1f3f15, ; 292: lib_System.Data.dll.so => 24
	i64 u0x3f1d226e6e06db7e, ; 293: Xamarin.AndroidX.SlidingPaneLayout.dll => 289
	i64 u0x3f510adf788828dd, ; 294: System.Threading.Tasks.Extensions => 146
	i64 u0x3f6f5914291cdcf7, ; 295: Microsoft.Extensions.Hosting.Abstractions => 198
	i64 u0x4019503dd3d938a1, ; 296: MySql.Data.dll => 210
	i64 u0x407a10bb4bf95829, ; 297: lib_Xamarin.AndroidX.Navigation.Common.dll.so => 276
	i64 u0x40c98b6bd77346d4, ; 298: Microsoft.VisualBasic.dll => 3
	i64 u0x415e36f6b13ff6f3, ; 299: System.Configuration.ConfigurationManager.dll => 213
	i64 u0x41833cf766d27d96, ; 300: mscorlib => 170
	i64 u0x41cab042be111c34, ; 301: lib_Xamarin.AndroidX.AppCompat.AppCompatResources.dll.so => 228
	i64 u0x423a9ecc4d905a88, ; 302: lib_System.Resources.ResourceManager.dll.so => 102
	i64 u0x423bf51ae7def810, ; 303: System.Xml.XPath => 164
	i64 u0x42462ff15ddba223, ; 304: System.Resources.Reader.dll => 101
	i64 u0x4291015ff4e5ef71, ; 305: Xamarin.AndroidX.Core.ViewTree.dll => 248
	i64 u0x42a31b86e6ccc3f0, ; 306: System.Diagnostics.Contracts => 25
	i64 u0x430e95b891249788, ; 307: lib_System.Reflection.Emit.dll.so => 95
	i64 u0x43375950ec7c1b6a, ; 308: netstandard.dll => 171
	i64 u0x434c4e1d9284cdae, ; 309: Mono.Android.dll => 175
	i64 u0x43505013578652a0, ; 310: lib_Xamarin.AndroidX.Activity.Ktx.dll.so => 223
	i64 u0x437d06c381ed575a, ; 311: lib_Microsoft.VisualBasic.dll.so => 3
	i64 u0x43950f84de7cc79a, ; 312: pl/Microsoft.Maui.Controls.resources.dll => 363
	i64 u0x43c077442b230f64, ; 313: Xamarin.AndroidX.Tracing.Tracing.Android => 293
	i64 u0x43e8ca5bc927ff37, ; 314: lib_Xamarin.AndroidX.Emoji2.ViewsHelper.dll.so => 255
	i64 u0x448bd33429269b19, ; 315: Microsoft.CSharp => 1
	i64 u0x4499fa3c8e494654, ; 316: lib_System.Runtime.Serialization.Primitives.dll.so => 116
	i64 u0x4515080865a951a5, ; 317: Xamarin.Kotlin.StdLib.dll => 331
	i64 u0x453c1277f85cf368, ; 318: lib_Microsoft.EntityFrameworkCore.Abstractions.dll.so => 188
	i64 u0x4545802489b736b9, ; 319: Xamarin.AndroidX.Fragment.Ktx => 258
	i64 u0x454b4d1e66bb783c, ; 320: Xamarin.AndroidX.Lifecycle.Process => 265
	i64 u0x45c40276a42e283e, ; 321: System.Diagnostics.TraceSource => 33
	i64 u0x45d443f2a29adc37, ; 322: System.AppContext.dll => 6
	i64 u0x46a4213bc97fe5ae, ; 323: lib-ru-Microsoft.Maui.Controls.resources.dll.so => 367
	i64 u0x47358bd471172e1d, ; 324: lib_System.Xml.Linq.dll.so => 159
	i64 u0x47daf4e1afbada10, ; 325: pt/Microsoft.Maui.Controls.resources => 365
	i64 u0x480c0a47dd42dd81, ; 326: lib_System.IO.MemoryMappedFiles.dll.so => 53
	i64 u0x4953c088b9debf0a, ; 327: lib_System.Security.Permissions.dll.so => 216
	i64 u0x49e952f19a4e2022, ; 328: System.ObjectModel => 87
	i64 u0x49f9e6948a8131e4, ; 329: lib_Xamarin.AndroidX.VersionedParcelable.dll.so => 298
	i64 u0x4a5667b2462a664b, ; 330: lib_Xamarin.AndroidX.Navigation.UI.dll.so => 281
	i64 u0x4a7a18981dbd56bc, ; 331: System.IO.Compression.FileSystem.dll => 44
	i64 u0x4aa5c60350917c06, ; 332: lib_Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll.so => 264
	i64 u0x4b07a0ed0ab33ff4, ; 333: System.Runtime.Extensions.dll => 106
	i64 u0x4b576d47ac054f3c, ; 334: System.IO.FileSystem.AccessControl => 47
	i64 u0x4b7b6532ded934b7, ; 335: System.Text.Json => 140
	i64 u0x4c2029a97af23a8d, ; 336: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.Android => 274
	i64 u0x4c7755cf07ad2d5f, ; 337: System.Net.Http.Json.dll => 65
	i64 u0x4ca014ceac582c86, ; 338: Microsoft.EntityFrameworkCore.Relational.dll => 189
	i64 u0x4cad38a03a928144, ; 339: lib_Xamarin.Firebase.Encoders.Proto.dll.so => 308
	i64 u0x4cc5f15266470798, ; 340: lib_Xamarin.AndroidX.Loader.dll.so => 275
	i64 u0x4cf6f67dc77aacd2, ; 341: System.Net.NetworkInformation.dll => 70
	i64 u0x4d3183dd245425d4, ; 342: System.Net.WebSockets.Client.dll => 82
	i64 u0x4d479f968a05e504, ; 343: System.Linq.Expressions.dll => 60
	i64 u0x4d55a010ffc4faff, ; 344: System.Private.Xml => 91
	i64 u0x4d5cbe77561c5b2e, ; 345: System.Web.dll => 157
	i64 u0x4d77512dbd86ee4c, ; 346: lib_Xamarin.AndroidX.Arch.Core.Common.dll.so => 229
	i64 u0x4d7793536e79c309, ; 347: System.ServiceProcess => 135
	i64 u0x4d95fccc1f67c7ca, ; 348: System.Runtime.Loader.dll => 112
	i64 u0x4da4a8f0f6a70fdc, ; 349: Microsoft.Maui.Controls.Compatibility.dll => 204
	i64 u0x4db014bf0ff1c9c1, ; 350: System.Linq.AsyncEnumerable => 59
	i64 u0x4dcf44c3c9b076a2, ; 351: it/Microsoft.Maui.Controls.resources.dll => 357
	i64 u0x4dd9247f1d2c3235, ; 352: Xamarin.AndroidX.Loader.dll => 275
	i64 u0x4e2aeee78e2c4a87, ; 353: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 282
	i64 u0x4e32f00cb0937401, ; 354: Mono.Android.Runtime => 174
	i64 u0x4e5eea4668ac2b18, ; 355: System.Text.Encoding.CodePages => 136
	i64 u0x4e742b34f53425d7, ; 356: Xamarin.Firebase.Encoders.Proto.dll => 308
	i64 u0x4ebd0c4b82c5eefc, ; 357: lib_System.Threading.Channels.dll.so => 143
	i64 u0x4ee8eaa9c9c1151a, ; 358: System.Globalization.Calendars => 40
	i64 u0x4f21ee6ef9eb527e, ; 359: ca/Microsoft.Maui.Controls.resources => 344
	i64 u0x5037f0be3c28c7a3, ; 360: lib_Microsoft.Maui.Controls.dll.so => 205
	i64 u0x504ef7fac46604b6, ; 361: Xamarin.Google.MLKit.BarcodeScanning => 319
	i64 u0x506203448c473a65, ; 362: Xamarin.Google.AutoValue.Annotations => 314
	i64 u0x50c3a29b21050d45, ; 363: System.Linq.Parallel.dll => 61
	i64 u0x5131bbe80989093f, ; 364: Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll => 271
	i64 u0x516324a5050a7e3c, ; 365: System.Net.WebProxy => 81
	i64 u0x516d6f0b21a303de, ; 366: lib_System.Diagnostics.Contracts.dll.so => 25
	i64 u0x51bb8a2afe774e32, ; 367: System.Drawing => 36
	i64 u0x5247c5c32a4140f0, ; 368: System.Resources.Reader => 101
	i64 u0x526bb15e3c386364, ; 369: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 268
	i64 u0x526ce79eb8e90527, ; 370: lib_System.Net.Primitives.dll.so => 72
	i64 u0x52829f00b4467c38, ; 371: lib_System.Data.Common.dll.so => 22
	i64 u0x529ffe06f39ab8db, ; 372: Xamarin.AndroidX.Core => 246
	i64 u0x52ff996554dbf352, ; 373: Microsoft.Maui.Graphics => 209
	i64 u0x535f7e40e8fef8af, ; 374: lib-sk-Microsoft.Maui.Controls.resources.dll.so => 368
	i64 u0x53978aac584c666e, ; 375: lib_System.Security.Cryptography.Cng.dll.so => 123
	i64 u0x53a96d5c86c9e194, ; 376: System.Net.NetworkInformation => 70
	i64 u0x53be1038a61e8d44, ; 377: System.Runtime.InteropServices.RuntimeInformation.dll => 109
	i64 u0x53c3014b9437e684, ; 378: lib-zh-HK-Microsoft.Maui.Controls.resources.dll.so => 374
	i64 u0x5435e6f049e9bc37, ; 379: System.Security.Claims.dll => 121
	i64 u0x54795225dd1587af, ; 380: lib_System.Runtime.dll.so => 119
	i64 u0x547a34f14e5f6210, ; 381: Xamarin.AndroidX.Lifecycle.Common.dll => 260
	i64 u0x54b851bc9b470503, ; 382: Xamarin.AndroidX.Navigation.Common.Android => 277
	i64 u0x556e8b63b660ab8b, ; 383: Xamarin.AndroidX.Lifecycle.Common.Jvm.dll => 261
	i64 u0x5588627c9a108ec9, ; 384: System.Collections.Specialized => 11
	i64 u0x55a898e4f42e3fae, ; 385: Microsoft.VisualBasic.Core.dll => 2
	i64 u0x55fa0c610fe93bb1, ; 386: lib_System.Security.Cryptography.OpenSsl.dll.so => 126
	i64 u0x56442b99bc64bb47, ; 387: System.Runtime.Serialization.Xml.dll => 117
	i64 u0x56a5d2c17db41bcb, ; 388: Xamarin.Google.Android.DataTransport.TransportRuntime => 311
	i64 u0x56a8b26e1aeae27b, ; 389: System.Threading.Tasks.Dataflow => 145
	i64 u0x56f932d61e93c07f, ; 390: System.Globalization.Extensions => 41
	i64 u0x56fd3a42441bbcba, ; 391: lib_Xamarin.Google.MLKit.Vision.Common.dll.so => 322
	i64 u0x571c5cfbec5ae8e2, ; 392: System.Private.Uri => 89
	i64 u0x576499c9f52fea31, ; 393: Xamarin.AndroidX.Annotation => 224
	i64 u0x579a06fed6eec900, ; 394: System.Private.CoreLib.dll => 177
	i64 u0x57adda3c951abb33, ; 395: Microsoft.Extensions.Hosting.Abstractions.dll => 198
	i64 u0x57c542c14049b66d, ; 396: System.Diagnostics.DiagnosticSource => 27
	i64 u0x581a8bd5cfda563e, ; 397: System.Threading.Timer => 151
	i64 u0x58601b2dda4a27b9, ; 398: lib-ja-Microsoft.Maui.Controls.resources.dll.so => 358
	i64 u0x58688d9af496b168, ; 399: Microsoft.Extensions.DependencyInjection.dll => 194
	i64 u0x588c167a79db6bfb, ; 400: lib_Xamarin.Google.ErrorProne.Annotations.dll.so => 317
	i64 u0x5906028ae5151104, ; 401: Xamarin.AndroidX.Activity.Ktx => 223
	i64 u0x595a356d23e8da9a, ; 402: lib_Microsoft.CSharp.dll.so => 1
	i64 u0x59f9e60b9475085f, ; 403: lib_Xamarin.AndroidX.Annotation.Experimental.dll.so => 225
	i64 u0x5a745f5101a75527, ; 404: lib_System.IO.Compression.FileSystem.dll.so => 44
	i64 u0x5a89a886ae30258d, ; 405: lib_Xamarin.AndroidX.CoordinatorLayout.dll.so => 245
	i64 u0x5a8f6699f4a1caa9, ; 406: lib_System.Threading.dll.so => 152
	i64 u0x5ae9cd33b15841bf, ; 407: System.ComponentModel => 18
	i64 u0x5b54391bdc6fcfe6, ; 408: System.Private.DataContractSerialization => 88
	i64 u0x5b5f0e240a06a2a2, ; 409: da/Microsoft.Maui.Controls.resources.dll => 346
	i64 u0x5b608c01082a90a8, ; 410: K4os.Hash.xxHash => 186
	i64 u0x5b755276902c8414, ; 411: Xamarin.GooglePlayServices.Base => 324
	i64 u0x5b8109e8e14c5e3e, ; 412: System.Globalization.Extensions.dll => 41
	i64 u0x5bddd04d72a9e350, ; 413: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 264
	i64 u0x5bdf16b09da116ab, ; 414: Xamarin.AndroidX.Collection => 238
	i64 u0x5bff6a70194300bd, ; 415: lib_Xamarin.Kotlin.StdLib.Jdk8.dll.so => 333
	i64 u0x5c019d5266093159, ; 416: lib_Xamarin.AndroidX.Lifecycle.Runtime.Ktx.Android.dll.so => 269
	i64 u0x5c30a4a35f9cc8c4, ; 417: lib_System.Reflection.Extensions.dll.so => 96
	i64 u0x5c393624b8176517, ; 418: lib_Microsoft.Extensions.Logging.dll.so => 199
	i64 u0x5c53c29f5073b0c9, ; 419: System.Diagnostics.FileVersionInfo => 28
	i64 u0x5c87463c575c7616, ; 420: lib_System.Globalization.Extensions.dll.so => 41
	i64 u0x5d0a4a29b02d9d3c, ; 421: System.Net.WebHeaderCollection.dll => 80
	i64 u0x5d1b514fc45c92d4, ; 422: ZXing.Net.MAUI => 341
	i64 u0x5d40c9b15181641f, ; 423: lib_Xamarin.AndroidX.Emoji2.dll.so => 254
	i64 u0x5d6ca10d35e9485b, ; 424: lib_Xamarin.AndroidX.Concurrent.Futures.dll.so => 241
	i64 u0x5d7ec76c1c703055, ; 425: System.Threading.Tasks.Parallel => 147
	i64 u0x5db0cbbd1028510e, ; 426: lib_System.Runtime.InteropServices.dll.so => 110
	i64 u0x5db30905d3e5013b, ; 427: Xamarin.AndroidX.Collection.Jvm.dll => 239
	i64 u0x5e467bc8f09ad026, ; 428: System.Collections.Specialized.dll => 11
	i64 u0x5e5173b3208d97e7, ; 429: System.Runtime.Handles.dll => 107
	i64 u0x5ea92fdb19ec8c4c, ; 430: System.Text.Encodings.Web.dll => 139
	i64 u0x5eb8046dd40e9ac3, ; 431: System.ComponentModel.Primitives => 16
	i64 u0x5ec272d219c9aba4, ; 432: System.Security.Cryptography.Csp.dll => 124
	i64 u0x5eee1376d94c7f5e, ; 433: System.Net.HttpListener.dll => 67
	i64 u0x5f36ccf5c6a57e24, ; 434: System.Xml.ReaderWriter.dll => 160
	i64 u0x5f4294b9b63cb842, ; 435: System.Data.Common => 22
	i64 u0x5f4fa8b9ffd0e2c5, ; 436: lib_Xamarin.Google.Android.DataTransport.TransportApi.dll.so => 309
	i64 u0x5f7738cdcf2c578b, ; 437: Xamarin.Google.MLKit.Vision.Common => 322
	i64 u0x5f9a2d823f664957, ; 438: lib-el-Microsoft.Maui.Controls.resources.dll.so => 348
	i64 u0x5fa6da9c3cd8142a, ; 439: lib_Xamarin.KotlinX.Serialization.Core.dll.so => 337
	i64 u0x5fac98e0b37a5b9d, ; 440: System.Runtime.CompilerServices.Unsafe.dll => 104
	i64 u0x609f4b7b63d802d4, ; 441: lib_Microsoft.Extensions.DependencyInjection.dll.so => 194
	i64 u0x60cd4e33d7e60134, ; 442: Xamarin.KotlinX.Coroutines.Core.Jvm => 336
	i64 u0x60f62d786afcf130, ; 443: System.Memory => 64
	i64 u0x618073e67851e2a7, ; 444: lib_K4os.Compression.LZ4.Streams.dll.so => 185
	i64 u0x61bb78c89f867353, ; 445: System.IO => 58
	i64 u0x61be8d1299194243, ; 446: Microsoft.Maui.Controls.Xaml => 206
	i64 u0x61d2cba29557038f, ; 447: de/Microsoft.Maui.Controls.resources => 347
	i64 u0x61d88f399afb2f45, ; 448: lib_System.Runtime.Loader.dll.so => 112
	i64 u0x622eef6f9e59068d, ; 449: System.Private.CoreLib => 177
	i64 u0x639fb99a7bef11de, ; 450: Xamarin.AndroidX.Navigation.Runtime.Android.dll => 280
	i64 u0x63cdbd66ac39bb46, ; 451: lib_Microsoft.VisualStudio.DesignTools.XamlTapContract.dll.so => 380
	i64 u0x63d5e3aa4ef9b931, ; 452: Xamarin.KotlinX.Coroutines.Android.dll => 334
	i64 u0x63f1f6883c1e23c2, ; 453: lib_System.Collections.Immutable.dll.so => 9
	i64 u0x6400f68068c1e9f1, ; 454: Xamarin.Google.Android.Material.dll => 312
	i64 u0x640e3b14dbd325c2, ; 455: System.Security.Cryptography.Algorithms.dll => 122
	i64 u0x64587004560099b9, ; 456: System.Reflection => 100
	i64 u0x64a5253533d1c410, ; 457: MySqlConnector => 211
	i64 u0x64b1529a438a3c45, ; 458: lib_System.Runtime.Handles.dll.so => 107
	i64 u0x64b61dd9da8a4d57, ; 459: System.Net.ServerSentEvents.dll => 76
	i64 u0x65187c31e9326ce8, ; 460: lib_MySqlConnector.dll.so => 211
	i64 u0x6565fba2cd8f235b, ; 461: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 272
	i64 u0x658f524e4aba7dad, ; 462: CommunityToolkit.Maui.dll => 180
	i64 u0x65a51fb1cf95ad53, ; 463: ZstdSharp.dll => 339
	i64 u0x65ecac39144dd3cc, ; 464: Microsoft.Maui.Controls.dll => 205
	i64 u0x65ece51227bfa724, ; 465: lib_System.Runtime.Numerics.dll.so => 113
	i64 u0x661722438787b57f, ; 466: Xamarin.AndroidX.Annotation.Jvm.dll => 226
	i64 u0x6679b2337ee6b22a, ; 467: lib_System.IO.FileSystem.Primitives.dll.so => 49
	i64 u0x667c66a03dd97d40, ; 468: System.Linq.AsyncEnumerable.dll => 59
	i64 u0x6692e924eade1b29, ; 469: lib_System.Console.dll.so => 20
	i64 u0x66a4e5c6a3fb0bae, ; 470: lib_Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll.so => 271
	i64 u0x66d13304ce1a3efa, ; 471: Xamarin.AndroidX.CursorAdapter => 249
	i64 u0x674303f65d8fad6f, ; 472: lib_System.Net.Quic.dll.so => 73
	i64 u0x674dcc2b316e6d45, ; 473: lib_Xamarin.Google.MLKit.BarcodeScanning.dll.so => 319
	i64 u0x6756ca4cad62e9d6, ; 474: lib_Xamarin.AndroidX.ConstraintLayout.Core.dll.so => 244
	i64 u0x67bca11acb828d8d, ; 475: lib_Xamarin.Google.Android.DataTransport.TransportBackendCct.dll.so => 310
	i64 u0x67c0802770244408, ; 476: System.Windows.dll => 158
	i64 u0x68100b69286e27cd, ; 477: lib_System.Formats.Tar.dll.so => 39
	i64 u0x68558ec653afa616, ; 478: lib-da-Microsoft.Maui.Controls.resources.dll.so => 346
	i64 u0x6872ec7a2e36b1ac, ; 479: System.Drawing.Primitives.dll => 35
	i64 u0x68fbbbe2eb455198, ; 480: System.Formats.Asn1 => 38
	i64 u0x69063fc0ba8e6bdd, ; 481: he/Microsoft.Maui.Controls.resources.dll => 352
	i64 u0x6a4d7577b2317255, ; 482: System.Runtime.InteropServices.dll => 110
	i64 u0x6ace3b74b15ee4a4, ; 483: nb/Microsoft.Maui.Controls.resources => 361
	i64 u0x6afcedb171067e2b, ; 484: System.Core.dll => 21
	i64 u0x6bef98e124147c24, ; 485: Xamarin.Jetbrains.Annotations => 329
	i64 u0x6ce874bff138ce2b, ; 486: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 270
	i64 u0x6d0a12b2adba20d8, ; 487: System.Security.Cryptography.ProtectedData.dll => 215
	i64 u0x6d12bfaa99c72b1f, ; 488: lib_Microsoft.Maui.Graphics.dll.so => 209
	i64 u0x6d70755158ca866e, ; 489: lib_System.ComponentModel.EventBasedAsync.dll.so => 15
	i64 u0x6d79993361e10ef2, ; 490: Microsoft.Extensions.Primitives => 203
	i64 u0x6d7eeca99577fc8b, ; 491: lib_System.Net.WebProxy.dll.so => 81
	i64 u0x6d8515b19946b6a2, ; 492: System.Net.WebProxy.dll => 81
	i64 u0x6d86d56b84c8eb71, ; 493: lib_Xamarin.AndroidX.CursorAdapter.dll.so => 249
	i64 u0x6d9bea6b3e895cf7, ; 494: Microsoft.Extensions.Primitives.dll => 203
	i64 u0x6e25a02c3833319a, ; 495: lib_Xamarin.AndroidX.Navigation.Fragment.dll.so => 278
	i64 u0x6e79c6bd8627412a, ; 496: Xamarin.AndroidX.SavedState.SavedState.Ktx => 287
	i64 u0x6e838d9a2a6f6c9e, ; 497: lib_System.ValueTuple.dll.so => 155
	i64 u0x6e9965ce1095e60a, ; 498: lib_System.Core.dll.so => 21
	i64 u0x6fd2265da78b93a4, ; 499: lib_Microsoft.Maui.dll.so => 207
	i64 u0x6fdfc7de82c33008, ; 500: cs/Microsoft.Maui.Controls.resources => 345
	i64 u0x6ffc4967cc47ba57, ; 501: System.IO.FileSystem.Watcher.dll => 50
	i64 u0x701cd46a1c25a5fe, ; 502: System.IO.FileSystem.dll => 51
	i64 u0x70e99f48c05cb921, ; 503: tr/Microsoft.Maui.Controls.resources.dll => 371
	i64 u0x70fd3deda22442d2, ; 504: lib-nb-Microsoft.Maui.Controls.resources.dll.so => 361
	i64 u0x71485e7ffdb4b958, ; 505: System.Reflection.Extensions => 96
	i64 u0x7162a2fce67a945f, ; 506: lib_Xamarin.Android.Glide.Annotations.dll.so => 219
	i64 u0x717530326f808838, ; 507: lib_Microsoft.Extensions.Diagnostics.Abstractions.dll.so => 196
	i64 u0x71a495ea3761dde8, ; 508: lib-it-Microsoft.Maui.Controls.resources.dll.so => 357
	i64 u0x71ad672adbe48f35, ; 509: System.ComponentModel.Primitives.dll => 16
	i64 u0x720f102581a4a5c8, ; 510: Xamarin.AndroidX.Core.ViewTree => 248
	i64 u0x725f5a9e82a45c81, ; 511: System.Security.Cryptography.Encoding => 125
	i64 u0x72b1fb4109e08d7b, ; 512: lib-hr-Microsoft.Maui.Controls.resources.dll.so => 354
	i64 u0x72e0300099accce1, ; 513: System.Xml.XPath.XDocument => 163
	i64 u0x730bfb248998f67a, ; 514: System.IO.Compression.ZipFile => 45
	i64 u0x732b2d67b9e5c47b, ; 515: Xamarin.Google.ErrorProne.Annotations.dll => 317
	i64 u0x734b76fdc0dc05bb, ; 516: lib_GoogleGson.dll.so => 183
	i64 u0x73a6be34e822f9d1, ; 517: lib_System.Runtime.Serialization.dll.so => 118
	i64 u0x73e4ce94e2eb6ffc, ; 518: lib_System.Memory.dll.so => 64
	i64 u0x743a1eccf080489a, ; 519: WindowsBase.dll => 169
	i64 u0x755a91767330b3d4, ; 520: lib_Microsoft.Extensions.Configuration.dll.so => 192
	i64 u0x75c326eb821b85c4, ; 521: lib_System.ComponentModel.DataAnnotations.dll.so => 14
	i64 u0x76012e7334db86e5, ; 522: lib_Xamarin.AndroidX.SavedState.dll.so => 285
	i64 u0x76ca07b878f44da0, ; 523: System.Runtime.Numerics.dll => 113
	i64 u0x7736c8a96e51a061, ; 524: lib_Xamarin.AndroidX.Annotation.Jvm.dll.so => 226
	i64 u0x777b4ed432c1e61e, ; 525: K4os.Compression.LZ4.Streams => 185
	i64 u0x778a805e625329ef, ; 526: System.Linq.Parallel => 61
	i64 u0x77bf40592cd67602, ; 527: Xamarin.Google.AutoValue.Annotations.dll => 314
	i64 u0x77d9074d8f33a303, ; 528: lib_System.Net.ServerSentEvents.dll.so => 76
	i64 u0x77f8a4acc2fdc449, ; 529: System.Security.Cryptography.Cng.dll => 123
	i64 u0x780bc73597a503a9, ; 530: lib-ms-Microsoft.Maui.Controls.resources.dll.so => 360
	i64 u0x782c5d8eb99ff201, ; 531: lib_Microsoft.VisualBasic.Core.dll.so => 2
	i64 u0x783606d1e53e7a1a, ; 532: th/Microsoft.Maui.Controls.resources.dll => 370
	i64 u0x7841c47b741b9f64, ; 533: System.Security.Permissions => 216
	i64 u0x78a45e51311409b6, ; 534: Xamarin.AndroidX.Fragment.dll => 257
	i64 u0x78d5c74e565733ea, ; 535: Xamarin.Google.Android.DataTransport.TransportRuntime.dll => 311
	i64 u0x78ed4ab8f9d800a1, ; 536: Xamarin.AndroidX.Lifecycle.ViewModel => 270
	i64 u0x793546dbadd324b1, ; 537: Xamarin.Google.Android.DataTransport.TransportApi => 309
	i64 u0x7a5207a7c82d30b4, ; 538: lib_Xamarin.JSpecify.dll.so => 330
	i64 u0x7a7e7eddf79c5d26, ; 539: lib_Xamarin.AndroidX.Lifecycle.ViewModel.dll.so => 270
	i64 u0x7a9a57d43b0845fa, ; 540: System.AppContext => 6
	i64 u0x7ad0f4f1e5d08183, ; 541: Xamarin.AndroidX.Collection.dll => 238
	i64 u0x7adb8da2ac89b647, ; 542: fi/Microsoft.Maui.Controls.resources.dll => 350
	i64 u0x7b13d9eaa944ade8, ; 543: Xamarin.AndroidX.DynamicAnimation.dll => 253
	i64 u0x7bef86a4335c4870, ; 544: System.ComponentModel.TypeConverter => 17
	i64 u0x7c0820144cd34d6a, ; 545: sk/Microsoft.Maui.Controls.resources.dll => 368
	i64 u0x7c2a0bd1e0f988fc, ; 546: lib-de-Microsoft.Maui.Controls.resources.dll.so => 347
	i64 u0x7c41d387501568ba, ; 547: System.Net.WebClient.dll => 79
	i64 u0x7c482cd79bd24b13, ; 548: lib_Xamarin.AndroidX.ConstraintLayout.dll.so => 243
	i64 u0x7c60acf6404e96b6, ; 549: Xamarin.AndroidX.Navigation.Common.Android.dll => 277
	i64 u0x7c8cb8cf04bee12b, ; 550: lib_Xamarin.Google.AutoValue.Annotations.dll.so => 314
	i64 u0x7cb95ad2a929d044, ; 551: Xamarin.GooglePlayServices.Basement => 325
	i64 u0x7cc637f941f716d0, ; 552: CommunityToolkit.Maui.Core => 181
	i64 u0x7cd2ec8eaf5241cd, ; 553: System.Security.dll => 133
	i64 u0x7cf9ae50dd350622, ; 554: Xamarin.Jetbrains.Annotations.dll => 329
	i64 u0x7cfbc8d16d068e41, ; 555: lib_Xamarin.AndroidX.Tracing.Tracing.Ktx.dll.so => 294
	i64 u0x7d649b75d580bb42, ; 556: ms/Microsoft.Maui.Controls.resources.dll => 360
	i64 u0x7d8ee2bdc8e3aad1, ; 557: System.Numerics.Vectors => 85
	i64 u0x7df5df8db8eaa6ac, ; 558: Microsoft.Extensions.Logging.Debug => 201
	i64 u0x7dfc3d6d9d8d7b70, ; 559: System.Collections => 12
	i64 u0x7e1f8f575a3599cb, ; 560: BouncyCastle.Cryptography.dll => 179
	i64 u0x7e2e564fa2f76c65, ; 561: lib_System.Diagnostics.Tracing.dll.so => 34
	i64 u0x7e302e110e1e1346, ; 562: lib_System.Security.Claims.dll.so => 121
	i64 u0x7e4465b3f78ad8d0, ; 563: Xamarin.KotlinX.Serialization.Core.dll => 337
	i64 u0x7e571cad5915e6c3, ; 564: lib_Xamarin.AndroidX.Lifecycle.Process.dll.so => 265
	i64 u0x7e6ac99e4e8df72f, ; 565: System.IO.Hashing => 176
	i64 u0x7e6b1ca712437d7d, ; 566: Xamarin.AndroidX.Emoji2.ViewsHelper => 255
	i64 u0x7e946809d6008ef2, ; 567: lib_System.ObjectModel.dll.so => 87
	i64 u0x7ea0272c1b4a9635, ; 568: lib_Xamarin.Android.Glide.dll.so => 218
	i64 u0x7eb4f0dc47488736, ; 569: lib_Xamarin.GooglePlayServices.Tasks.dll.so => 327
	i64 u0x7ecc13347c8fd849, ; 570: lib_System.ComponentModel.dll.so => 18
	i64 u0x7f00ddd9b9ca5a13, ; 571: Xamarin.AndroidX.ViewPager.dll => 299
	i64 u0x7f9351cd44b1273f, ; 572: Microsoft.Extensions.Configuration.Abstractions => 193
	i64 u0x7fa781c67c2cab04, ; 573: Xamarin.AndroidX.Concurrent.Futures.Ktx => 242
	i64 u0x7fbd557c99b3ce6f, ; 574: lib_Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so => 263
	i64 u0x800939860306ceb5, ; 575: lib_Xamarin.Google.Android.ODML.Image.dll.so => 313
	i64 u0x8076a9a44a2ca331, ; 576: System.Net.Quic => 73
	i64 u0x80b7e726b0280681, ; 577: Microsoft.VisualStudio.DesignTools.MobileTapContracts => 378
	i64 u0x80da183a87731838, ; 578: System.Reflection.Metadata => 97
	i64 u0x81254f745a80d7f8, ; 579: Xamarin.GooglePlayServices.MLKit.BarcodeScanning => 326
	i64 u0x812c069d5cdecc17, ; 580: System.dll => 168
	i64 u0x81381be520a60adb, ; 581: Xamarin.AndroidX.Interpolator.dll => 259
	i64 u0x81657cec2b31e8aa, ; 582: System.Net => 84
	i64 u0x81ab745f6c0f5ce6, ; 583: zh-Hant/Microsoft.Maui.Controls.resources => 376
	i64 u0x82075fdf49c26af2, ; 584: ZstdSharp => 339
	i64 u0x8277f2be6b5ce05f, ; 585: Xamarin.AndroidX.AppCompat => 227
	i64 u0x828f06563b30bc50, ; 586: lib_Xamarin.AndroidX.CardView.dll.so => 237
	i64 u0x82b399cb01b531c4, ; 587: lib_System.Web.dll.so => 157
	i64 u0x82df8f5532a10c59, ; 588: lib_System.Drawing.dll.so => 36
	i64 u0x82f0b6e911d13535, ; 589: lib_System.Transactions.dll.so => 154
	i64 u0x82f6403342e12049, ; 590: uk/Microsoft.Maui.Controls.resources => 372
	i64 u0x83c14ba66c8e2b8c, ; 591: zh-Hans/Microsoft.Maui.Controls.resources => 375
	i64 u0x844ac8f64fd78edc, ; 592: Xamarin.AndroidX.Camera.View.dll => 236
	i64 u0x846ce984efea52c7, ; 593: System.Threading.Tasks.Parallel.dll => 147
	i64 u0x84a193ebdfbe477d, ; 594: Xamarin.AndroidX.Tracing.Tracing.Ktx => 294
	i64 u0x84ae73148a4557d2, ; 595: lib_System.IO.Pipes.dll.so => 56
	i64 u0x84b01102c12a9232, ; 596: System.Runtime.Serialization.Json.dll => 115
	i64 u0x84cd5cdec0f54bcc, ; 597: lib_Microsoft.EntityFrameworkCore.Relational.dll.so => 189
	i64 u0x850c5ba0b57ce8e7, ; 598: lib_Xamarin.AndroidX.Collection.dll.so => 238
	i64 u0x851d02edd334b044, ; 599: Xamarin.AndroidX.VectorDrawable => 296
	i64 u0x85c919db62150978, ; 600: Xamarin.AndroidX.Transition.dll => 295
	i64 u0x8662aaeb94fef37f, ; 601: lib_System.Dynamic.Runtime.dll.so => 37
	i64 u0x86a909228dc7657b, ; 602: lib-zh-Hant-Microsoft.Maui.Controls.resources.dll.so => 376
	i64 u0x86b3e00c36b84509, ; 603: Microsoft.Extensions.Configuration.dll => 192
	i64 u0x86b62cb077ec4fd7, ; 604: System.Runtime.Serialization.Xml => 117
	i64 u0x8706ffb12bf3f53d, ; 605: Xamarin.AndroidX.Annotation.Experimental => 225
	i64 u0x872a5b14c18d328c, ; 606: System.ComponentModel.DataAnnotations => 14
	i64 u0x872fb9615bc2dff0, ; 607: Xamarin.Android.Glide.Annotations.dll => 219
	i64 u0x87c4b8a492b176ad, ; 608: Microsoft.EntityFrameworkCore.Abstractions => 188
	i64 u0x87c69b87d9283884, ; 609: lib_System.Threading.Thread.dll.so => 149
	i64 u0x87f6569b25707834, ; 610: System.IO.Compression.Brotli.dll => 43
	i64 u0x8842b3a5d2d3fb36, ; 611: Microsoft.Maui.Essentials => 208
	i64 u0x88926583efe7ee86, ; 612: Xamarin.AndroidX.Activity.Ktx.dll => 223
	i64 u0x88b16a1a7051ebe2, ; 613: Xamarin.Firebase.Annotations.dll => 304
	i64 u0x88ba6bc4f7762b03, ; 614: lib_System.Reflection.dll.so => 100
	i64 u0x88bda98e0cffb7a9, ; 615: lib_Xamarin.KotlinX.Coroutines.Core.Jvm.dll.so => 336
	i64 u0x8930322c7bd8f768, ; 616: netstandard => 171
	i64 u0x897a606c9e39c75f, ; 617: lib_System.ComponentModel.Primitives.dll.so => 16
	i64 u0x898a5c6bc9e47ec1, ; 618: lib_Xamarin.AndroidX.SavedState.SavedState.Android.dll.so => 286
	i64 u0x89911a22005b92b7, ; 619: System.IO.FileSystem.DriveInfo.dll => 48
	i64 u0x89c5188089ec2cd5, ; 620: lib_System.Runtime.InteropServices.RuntimeInformation.dll.so => 109
	i64 u0x8a19e3dc71b34b2c, ; 621: System.Reflection.TypeExtensions.dll => 99
	i64 u0x8a399a706fcbce4b, ; 622: Microsoft.Extensions.Caching.Abstractions => 190
	i64 u0x8ad229ea26432ee2, ; 623: Xamarin.AndroidX.Loader => 275
	i64 u0x8b4ff5d0fdd5faa1, ; 624: lib_System.Diagnostics.DiagnosticSource.dll.so => 27
	i64 u0x8b541d476eb3774c, ; 625: System.Security.Principal.Windows => 130
	i64 u0x8b8d01333a96d0b5, ; 626: System.Diagnostics.Process.dll => 29
	i64 u0x8b9278242f21e276, ; 627: Xamarin.Firebase.Encoders.JSON.dll => 307
	i64 u0x8b9ceca7acae3451, ; 628: lib-he-Microsoft.Maui.Controls.resources.dll.so => 352
	i64 u0x8c1bafb2ed25af5b, ; 629: K4os.Compression.LZ4.Streams.dll => 185
	i64 u0x8c575135aa1ccef4, ; 630: Microsoft.Extensions.FileProviders.Abstractions => 197
	i64 u0x8cb8f612b633affb, ; 631: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 287
	i64 u0x8cdfdb4ce85fb925, ; 632: lib_System.Security.Principal.Windows.dll.so => 130
	i64 u0x8cdfe7b8f4caa426, ; 633: System.IO.Compression.FileSystem => 44
	i64 u0x8d0f420977c2c1c7, ; 634: Xamarin.AndroidX.CursorAdapter.dll => 249
	i64 u0x8d52f7ea2796c531, ; 635: Xamarin.AndroidX.Emoji2.dll => 254
	i64 u0x8d7b8ab4b3310ead, ; 636: System.Threading => 152
	i64 u0x8da188285aadfe8e, ; 637: System.Collections.Concurrent => 8
	i64 u0x8e8f269ad1e1ff94, ; 638: lib_Xamarin.AndroidX.Tracing.Tracing.Android.dll.so => 293
	i64 u0x8ed3cdd722b4d782, ; 639: System.Diagnostics.EventLog => 214
	i64 u0x8ed807bfe9858dfc, ; 640: Xamarin.AndroidX.Navigation.Common => 276
	i64 u0x8ee08b8194a30f48, ; 641: lib-hi-Microsoft.Maui.Controls.resources.dll.so => 353
	i64 u0x8ef7601039857a44, ; 642: lib-ro-Microsoft.Maui.Controls.resources.dll.so => 366
	i64 u0x8efbc0801a122264, ; 643: Xamarin.GooglePlayServices.Tasks.dll => 327
	i64 u0x8f281632e6500989, ; 644: Xamarin.Google.Android.ODML.Image => 313
	i64 u0x8f32c6f611f6ffab, ; 645: pt/Microsoft.Maui.Controls.resources.dll => 365
	i64 u0x8f44b45eb046bbd1, ; 646: System.ServiceModel.Web.dll => 134
	i64 u0x8f8829d21c8985a4, ; 647: lib-pt-BR-Microsoft.Maui.Controls.resources.dll.so => 364
	i64 u0x8fbf5b0114c6dcef, ; 648: System.Globalization.dll => 42
	i64 u0x8fcc8c2a81f3d9e7, ; 649: Xamarin.KotlinX.Serialization.Core => 337
	i64 u0x90263f8448b8f572, ; 650: lib_System.Diagnostics.TraceSource.dll.so => 33
	i64 u0x903101b46fb73a04, ; 651: _Microsoft.Android.Resource.Designer => 381
	i64 u0x90393bd4865292f3, ; 652: lib_System.IO.Compression.dll.so => 46
	i64 u0x905e2b8e7ae91ae6, ; 653: System.Threading.Tasks.Extensions.dll => 146
	i64 u0x90634f86c5ebe2b5, ; 654: Xamarin.AndroidX.Lifecycle.ViewModel.Android => 271
	i64 u0x907b636704ad79ef, ; 655: lib_Microsoft.Maui.Controls.Xaml.dll.so => 206
	i64 u0x90e9efbfd68593e0, ; 656: lib_Xamarin.AndroidX.Lifecycle.LiveData.dll.so => 262
	i64 u0x91418dc638b29e68, ; 657: lib_Xamarin.AndroidX.CustomView.dll.so => 250
	i64 u0x9157bd523cd7ed36, ; 658: lib_System.Text.Json.dll.so => 140
	i64 u0x91a74f07b30d37e2, ; 659: System.Linq.dll => 63
	i64 u0x91cb86ea3b17111d, ; 660: System.ServiceModel.Web => 134
	i64 u0x91fa41a87223399f, ; 661: ca/Microsoft.Maui.Controls.resources.dll => 344
	i64 u0x92054e486c0c7ea7, ; 662: System.IO.FileSystem.DriveInfo => 48
	i64 u0x928614058c40c4cd, ; 663: lib_System.Xml.XPath.XDocument.dll.so => 163
	i64 u0x92a698e6d582778f, ; 664: Xamarin.Firebase.Components.dll => 305
	i64 u0x92b138fffca2b01e, ; 665: lib_Xamarin.AndroidX.Arch.Core.Runtime.dll.so => 230
	i64 u0x92dfc2bfc6c6a888, ; 666: Xamarin.AndroidX.Lifecycle.LiveData => 262
	i64 u0x933da2c779423d68, ; 667: Xamarin.Android.Glide.Annotations => 219
	i64 u0x9388aad9b7ae40ce, ; 668: lib_Xamarin.AndroidX.Lifecycle.Common.dll.so => 260
	i64 u0x93cfa73ab28d6e35, ; 669: ms/Microsoft.Maui.Controls.resources => 360
	i64 u0x941c00d21e5c0679, ; 670: lib_Xamarin.AndroidX.Transition.dll.so => 295
	i64 u0x944077d8ca3c6580, ; 671: System.IO.Compression.dll => 46
	i64 u0x948cffedc8ed7960, ; 672: System.Xml => 167
	i64 u0x94bbeab0d4764588, ; 673: System.IO.Hashing.dll => 176
	i64 u0x94c8990839c4bdb1, ; 674: lib_Xamarin.AndroidX.Interpolator.dll.so => 259
	i64 u0x95c6b36f5f5d7039, ; 675: Xamarin.AndroidX.Camera.Camera2 => 232
	i64 u0x95d757769563d0d3, ; 676: Xamarin.AndroidX.Camera.Lifecycle.dll => 234
	i64 u0x967fc325e09bfa8c, ; 677: es/Microsoft.Maui.Controls.resources => 349
	i64 u0x9686161486d34b81, ; 678: lib_Xamarin.AndroidX.ExifInterface.dll.so => 256
	i64 u0x9732d8dbddea3d9a, ; 679: id/Microsoft.Maui.Controls.resources => 356
	i64 u0x978be80e5210d31b, ; 680: Microsoft.Maui.Graphics.dll => 209
	i64 u0x979ab54025cc1c7f, ; 681: lib_Xamarin.GooglePlayServices.Base.dll.so => 324
	i64 u0x97b8c771ea3e4220, ; 682: System.ComponentModel.dll => 18
	i64 u0x97e144c9d3c6976e, ; 683: System.Collections.Concurrent.dll => 8
	i64 u0x97e55f96df4ddd72, ; 684: lib_Xamarin.Firebase.Annotations.dll.so => 304
	i64 u0x984184e3c70d4419, ; 685: GoogleGson => 183
	i64 u0x9843944103683dd3, ; 686: Xamarin.AndroidX.Core.Core.Ktx => 247
	i64 u0x98b05cc81e6f333c, ; 687: Xamarin.AndroidX.SavedState.SavedState.Android.dll => 286
	i64 u0x98d720cc4597562c, ; 688: System.Security.Cryptography.OpenSsl => 126
	i64 u0x99052c1297204af4, ; 689: lib_Xamarin.AndroidX.Camera.Core.dll.so => 233
	i64 u0x991d510397f92d9d, ; 690: System.Linq.Expressions => 60
	i64 u0x993cc632e821c001, ; 691: Microsoft.Maui.Controls.Compatibility => 204
	i64 u0x996ceeb8a3da3d67, ; 692: System.Threading.Overlapped.dll => 144
	i64 u0x99868af5d93ecaeb, ; 693: lib_K4os.Hash.xxHash.dll.so => 186
	i64 u0x99a00ca5270c6878, ; 694: Xamarin.AndroidX.Navigation.Runtime => 279
	i64 u0x99ad47f99ca1ea72, ; 695: Xamarin.Google.MLKit.Vision.Interfaces => 323
	i64 u0x99cdc6d1f2d3a72f, ; 696: ko/Microsoft.Maui.Controls.resources.dll => 359
	i64 u0x9a01b1da98b6ee10, ; 697: Xamarin.AndroidX.Lifecycle.Runtime.dll => 266
	i64 u0x9a5ccc274fd6e6ee, ; 698: Jsr305Binding.dll => 315
	i64 u0x9aa2060c5739135a, ; 699: Xamarin.Google.Android.ODML.Image.dll => 313
	i64 u0x9ae6940b11c02876, ; 700: lib_Xamarin.AndroidX.Window.dll.so => 301
	i64 u0x9b211a749105beac, ; 701: System.Transactions.Local => 153
	i64 u0x9b8734714671022d, ; 702: System.Threading.Tasks.Dataflow.dll => 145
	i64 u0x9bc6aea27fbf034f, ; 703: lib_Xamarin.KotlinX.Coroutines.Core.dll.so => 335
	i64 u0x9c244ac7cda32d26, ; 704: System.Security.Cryptography.X509Certificates.dll => 128
	i64 u0x9c465f280cf43733, ; 705: lib_Xamarin.KotlinX.Coroutines.Android.dll.so => 334
	i64 u0x9c8f6872beab6408, ; 706: System.Xml.XPath.XDocument.dll => 163
	i64 u0x9ce01cf91101ae23, ; 707: System.Xml.XmlDocument => 165
	i64 u0x9d128180c81d7ce6, ; 708: Xamarin.AndroidX.CustomView.PoolingContainer => 251
	i64 u0x9d5dbcf5a48583fe, ; 709: lib_Xamarin.AndroidX.Activity.dll.so => 222
	i64 u0x9d74dee1a7725f34, ; 710: Microsoft.Extensions.Configuration.Abstractions.dll => 193
	i64 u0x9dd0e195825d65c6, ; 711: lib_Xamarin.AndroidX.Navigation.Runtime.Android.dll.so => 280
	i64 u0x9de64d56c52fba95, ; 712: Xamarin.Firebase.Encoders.Proto => 308
	i64 u0x9e4534b6adaf6e84, ; 713: nl/Microsoft.Maui.Controls.resources => 362
	i64 u0x9e4b95dec42769f7, ; 714: System.Diagnostics.Debug.dll => 26
	i64 u0x9eaf1efdf6f7267e, ; 715: Xamarin.AndroidX.Navigation.Common.dll => 276
	i64 u0x9ef542cf1f78c506, ; 716: Xamarin.AndroidX.Lifecycle.LiveData.Core => 263
	i64 u0x9ff334e3cf272fd6, ; 717: lib_Xamarin.AndroidX.Camera.Lifecycle.dll.so => 234
	i64 u0xa00832eb975f56a8, ; 718: lib_System.Net.dll.so => 84
	i64 u0xa0ad78236b7b267f, ; 719: Xamarin.AndroidX.Window => 301
	i64 u0xa0d8259f4cc284ec, ; 720: lib_System.Security.Cryptography.dll.so => 129
	i64 u0xa0e17ca50c77a225, ; 721: lib_Xamarin.Google.Crypto.Tink.Android.dll.so => 316
	i64 u0xa0ff9b3e34d92f11, ; 722: lib_System.Resources.Writer.dll.so => 103
	i64 u0xa12fbfb4da97d9f3, ; 723: System.Threading.Timer.dll => 151
	i64 u0xa1440773ee9d341e, ; 724: Xamarin.Google.Android.Material => 312
	i64 u0xa18c39c44cdc3465, ; 725: Xamarin.AndroidX.Window.WindowCore => 302
	i64 u0xa1b9d7c27f47219f, ; 726: Xamarin.AndroidX.Navigation.UI.dll => 281
	i64 u0xa2572680829d2c7c, ; 727: System.IO.Pipelines.dll => 54
	i64 u0xa26597e57ee9c7f6, ; 728: System.Xml.XmlDocument.dll => 165
	i64 u0xa308401900e5bed3, ; 729: lib_mscorlib.dll.so => 170
	i64 u0xa395572e7da6c99d, ; 730: lib_System.Security.dll.so => 133
	i64 u0xa3e683f24b43af6f, ; 731: System.Dynamic.Runtime.dll => 37
	i64 u0xa4145becdee3dc4f, ; 732: Xamarin.AndroidX.VectorDrawable.Animated => 297
	i64 u0xa46aa1eaa214539b, ; 733: ko/Microsoft.Maui.Controls.resources => 359
	i64 u0xa4edc8f2ceae241a, ; 734: System.Data.Common.dll => 22
	i64 u0xa5494f40f128ce6a, ; 735: System.Runtime.Serialization.Formatters.dll => 114
	i64 u0xa54b74df83dce92b, ; 736: System.Reflection.DispatchProxy => 92
	i64 u0xa5b7152421ed6d98, ; 737: lib_System.IO.FileSystem.Watcher.dll.so => 50
	i64 u0xa5c3844f17b822db, ; 738: lib_System.Linq.Parallel.dll.so => 61
	i64 u0xa5ce5c755bde8cb8, ; 739: lib_System.Security.Cryptography.Csp.dll.so => 124
	i64 u0xa5e599d1e0524750, ; 740: System.Numerics.Vectors.dll => 85
	i64 u0xa5f1ba49b85dd355, ; 741: System.Security.Cryptography.dll => 129
	i64 u0xa61975a5a37873ea, ; 742: lib_System.Xml.XmlSerializer.dll.so => 166
	i64 u0xa64476a892d76457, ; 743: lib_MySql.Data.dll.so => 210
	i64 u0xa6593e21584384d2, ; 744: lib_Jsr305Binding.dll.so => 315
	i64 u0xa66cbee0130865f7, ; 745: lib_WindowsBase.dll.so => 169
	i64 u0xa67dbee13e1df9ca, ; 746: Xamarin.AndroidX.SavedState.dll => 285
	i64 u0xa684b098dd27b296, ; 747: lib_Xamarin.AndroidX.Security.SecurityCrypto.dll.so => 288
	i64 u0xa68a420042bb9b1f, ; 748: Xamarin.AndroidX.DrawerLayout.dll => 252
	i64 u0xa6d26156d1cacc7c, ; 749: Xamarin.Android.Glide.dll => 218
	i64 u0xa75386b5cb9595aa, ; 750: Xamarin.AndroidX.Lifecycle.Runtime.Android => 267
	i64 u0xa763fbb98df8d9fb, ; 751: lib_Microsoft.Win32.Primitives.dll.so => 4
	i64 u0xa78ce3745383236a, ; 752: Xamarin.AndroidX.Lifecycle.Common.Jvm => 261
	i64 u0xa7c31b56b4dc7b33, ; 753: hu/Microsoft.Maui.Controls.resources => 355
	i64 u0xa7eab29ed44b4e7a, ; 754: Mono.Android.Export => 173
	i64 u0xa8195217cbf017b7, ; 755: Microsoft.VisualBasic.Core => 2
	i64 u0xa843f6095f0d247d, ; 756: Xamarin.GooglePlayServices.Base.dll => 324
	i64 u0xa859a95830f367ff, ; 757: lib_Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll.so => 272
	i64 u0xa8b52f21e0dbe690, ; 758: System.Runtime.Serialization.dll => 118
	i64 u0xa8c84ce526c2b4bd, ; 759: Microsoft.VisualStudio.DesignTools.XamlTapContract.dll => 380
	i64 u0xa8ee4ed7de2efaee, ; 760: Xamarin.AndroidX.Annotation.dll => 224
	i64 u0xa95590e7c57438a4, ; 761: System.Configuration => 19
	i64 u0xa964304b5631e28a, ; 762: CommunityToolkit.Maui.Core.dll => 181
	i64 u0xaa2219c8e3449ff5, ; 763: Microsoft.Extensions.Logging.Abstractions => 200
	i64 u0xaa443ac34067eeef, ; 764: System.Private.Xml.dll => 91
	i64 u0xaa52de307ef5d1dd, ; 765: System.Net.Http => 66
	i64 u0xaa8448d5c2540403, ; 766: System.Windows.Extensions => 217
	i64 u0xaa9a7b0214a5cc5c, ; 767: System.Diagnostics.StackTrace.dll => 30
	i64 u0xaaaf86367285a918, ; 768: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 195
	i64 u0xaaf84bb3f052a265, ; 769: el/Microsoft.Maui.Controls.resources => 348
	i64 u0xab9af77b5b67a0b8, ; 770: Xamarin.AndroidX.ConstraintLayout.Core => 244
	i64 u0xab9c1b2687d86b0b, ; 771: lib_System.Linq.Expressions.dll.so => 60
	i64 u0xac2af3fa195a15ce, ; 772: System.Runtime.Numerics => 113
	i64 u0xac5376a2a538dc10, ; 773: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 263
	i64 u0xac5acae88f60357e, ; 774: System.Diagnostics.Tools.dll => 32
	i64 u0xac65e40f62b6b90e, ; 775: Google.Protobuf => 182
	i64 u0xac79c7e46047ad98, ; 776: System.Security.Principal.Windows.dll => 130
	i64 u0xac98d31068e24591, ; 777: System.Xml.XDocument => 162
	i64 u0xacd46e002c3ccb97, ; 778: ro/Microsoft.Maui.Controls.resources => 366
	i64 u0xacdd9e4180d56dda, ; 779: Xamarin.AndroidX.Concurrent.Futures => 241
	i64 u0xacf42eea7ef9cd12, ; 780: System.Threading.Channels => 143
	i64 u0xad89c07347f1bad6, ; 781: nl/Microsoft.Maui.Controls.resources.dll => 362
	i64 u0xadbb53caf78a79d2, ; 782: System.Web.HttpUtility => 156
	i64 u0xadc90ab061a9e6e4, ; 783: System.ComponentModel.TypeConverter.dll => 17
	i64 u0xadca1b9030b9317e, ; 784: Xamarin.AndroidX.Collection.Ktx => 240
	i64 u0xadd8eda2edf396ad, ; 785: Xamarin.Android.Glide.GifDecoder => 221
	i64 u0xadf4cf30debbeb9a, ; 786: System.Net.ServicePoint.dll => 77
	i64 u0xadf511667bef3595, ; 787: System.Net.Security => 75
	i64 u0xae0aaa94fdcfce0f, ; 788: System.ComponentModel.EventBasedAsync.dll => 15
	i64 u0xae282bcd03739de7, ; 789: Java.Interop => 172
	i64 u0xae53579c90db1107, ; 790: System.ObjectModel.dll => 87
	i64 u0xae554e7202e02cec, ; 791: Xamarin.Google.MLKit.Vision.Interfaces.dll => 323
	i64 u0xaeb080014622ef84, ; 792: Xamarin.JavaX.Inject => 328
	i64 u0xaf732d0b2193b8f5, ; 793: System.Security.Cryptography.OpenSsl.dll => 126
	i64 u0xafdb94dbccd9d11c, ; 794: Xamarin.AndroidX.Lifecycle.LiveData.dll => 262
	i64 u0xafe29f45095518e7, ; 795: lib_Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll.so => 273
	i64 u0xb03ae931fb25607e, ; 796: Xamarin.AndroidX.ConstraintLayout => 243
	i64 u0xb05cc42cd94c6d9d, ; 797: lib-sv-Microsoft.Maui.Controls.resources.dll.so => 369
	i64 u0xb0ac21bec8f428c5, ; 798: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.Android.dll => 269
	i64 u0xb0bb43dc52ea59f9, ; 799: System.Diagnostics.Tracing.dll => 34
	i64 u0xb1dd05401aa8ee63, ; 800: System.Security.AccessControl => 120
	i64 u0xb220631954820169, ; 801: System.Text.RegularExpressions => 141
	i64 u0xb2376e1dbf8b4ed7, ; 802: System.Security.Cryptography.Csp => 124
	i64 u0xb2a1959fe95c5402, ; 803: lib_System.Runtime.InteropServices.JavaScript.dll.so => 108
	i64 u0xb2a3f67f3bf29fce, ; 804: da/Microsoft.Maui.Controls.resources => 346
	i64 u0xb3005ac9c8a035c5, ; 805: lib_Xamarin.JavaX.Inject.dll.so => 328
	i64 u0xb3011a0a57f7ffb2, ; 806: Microsoft.VisualStudio.DesignTools.MobileTapContracts.dll => 378
	i64 u0xb3874072ee0ecf8c, ; 807: Xamarin.AndroidX.VectorDrawable.Animated.dll => 297
	i64 u0xb398860d6ed7ba2f, ; 808: System.Security.Cryptography.ProtectedData => 215
	i64 u0xb3f0a0fcda8d3ebc, ; 809: Xamarin.AndroidX.CardView => 237
	i64 u0xb46be1aa6d4fff93, ; 810: hi/Microsoft.Maui.Controls.resources => 353
	i64 u0xb477491be13109d8, ; 811: ar/Microsoft.Maui.Controls.resources => 343
	i64 u0xb4bd7015ecee9d86, ; 812: System.IO.Pipelines => 54
	i64 u0xb4c53d9749c5f226, ; 813: lib_System.IO.FileSystem.AccessControl.dll.so => 47
	i64 u0xb4ff710863453fda, ; 814: System.Diagnostics.FileVersionInfo.dll => 28
	i64 u0xb54092076b15e062, ; 815: System.Threading.AccessControl => 142
	i64 u0xb5c38bf497a4cfe2, ; 816: lib_System.Threading.Tasks.dll.so => 148
	i64 u0xb5c7fcdafbc67ee4, ; 817: Microsoft.Extensions.Logging.Abstractions.dll => 200
	i64 u0xb5e2ea1bb00704d6, ; 818: Xamarin.Kotlin.StdLib.Jdk7.dll => 332
	i64 u0xb5ea31d5244c6626, ; 819: System.Threading.ThreadPool.dll => 150
	i64 u0xb7212c4683a94afe, ; 820: System.Drawing.Primitives => 35
	i64 u0xb7b7753d1f319409, ; 821: sv/Microsoft.Maui.Controls.resources => 369
	i64 u0xb81a2c6e0aee50fe, ; 822: lib_System.Private.CoreLib.dll.so => 177
	i64 u0xb8c60af47c08d4da, ; 823: System.Net.ServicePoint => 77
	i64 u0xb8e68d20aad91196, ; 824: lib_System.Xml.XPath.dll.so => 164
	i64 u0xb9185c33a1643eed, ; 825: Microsoft.CSharp.dll => 1
	i64 u0xb960d6b2200ba320, ; 826: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.Android.dll => 274
	i64 u0xb9b8001adf4ed7cc, ; 827: lib_Xamarin.AndroidX.SlidingPaneLayout.dll.so => 289
	i64 u0xb9f64d3b230def68, ; 828: lib-pt-Microsoft.Maui.Controls.resources.dll.so => 365
	i64 u0xb9fc3c8a556e3691, ; 829: ja/Microsoft.Maui.Controls.resources => 358
	i64 u0xba4670aa94a2b3c6, ; 830: lib_System.Xml.XDocument.dll.so => 162
	i64 u0xba48785529705af9, ; 831: System.Collections.dll => 12
	i64 u0xba965b8c86359996, ; 832: lib_System.Windows.dll.so => 158
	i64 u0xbadbc0a44214b54e, ; 833: K4os.Compression.LZ4 => 184
	i64 u0xbb286883bc35db36, ; 834: System.Transactions.dll => 154
	i64 u0xbb65706fde942ce3, ; 835: System.Net.Sockets => 78
	i64 u0xbb6dc0b35452c1a0, ; 836: ZXing.Net.MAUI.dll => 341
	i64 u0xbba28979413cad9e, ; 837: lib_System.Runtime.CompilerServices.VisualC.dll.so => 105
	i64 u0xbbd180354b67271a, ; 838: System.Runtime.Serialization.Formatters => 114
	i64 u0xbc260cdba33291a3, ; 839: Xamarin.AndroidX.Arch.Core.Common.dll => 229
	i64 u0xbd0e2c0d55246576, ; 840: System.Net.Http.dll => 66
	i64 u0xbd3fbd85b9e1cb29, ; 841: lib_System.Net.HttpListener.dll.so => 67
	i64 u0xbd437a2cdb333d0d, ; 842: Xamarin.AndroidX.ViewPager2 => 300
	i64 u0xbd4f572d2bd0a789, ; 843: System.IO.Compression.ZipFile.dll => 45
	i64 u0xbd5d0b88d3d647a5, ; 844: lib_Xamarin.AndroidX.Browser.dll.so => 231
	i64 u0xbd877b14d0b56392, ; 845: System.Runtime.Intrinsics.dll => 111
	i64 u0xbe08e3083025c53d, ; 846: ZXing.Net.MAUI.Controls.dll => 342
	i64 u0xbe532a80075c3dc8, ; 847: Xamarin.AndroidX.Camera.Core.dll => 233
	i64 u0xbe65a49036345cf4, ; 848: lib_System.Buffers.dll.so => 7
	i64 u0xbeb65e637899073c, ; 849: Xamarin.Google.MLKit.BarcodeScanning.Common.dll => 320
	i64 u0xbee38d4a88835966, ; 850: Xamarin.AndroidX.AppCompat.AppCompatResources => 228
	i64 u0xbef9919db45b4ca7, ; 851: System.IO.Pipes.AccessControl => 55
	i64 u0xbf0fa68611139208, ; 852: lib_Xamarin.AndroidX.Annotation.dll.so => 224
	i64 u0xbfc1e1fb3095f2b3, ; 853: lib_System.Net.Http.Json.dll.so => 65
	i64 u0xc040a4ab55817f58, ; 854: ar/Microsoft.Maui.Controls.resources.dll => 343
	i64 u0xc07cadab29efeba0, ; 855: Xamarin.AndroidX.Core.Core.Ktx.dll => 247
	i64 u0xc0d928351ab5ca77, ; 856: System.Console.dll => 20
	i64 u0xc0f5a221a9383aea, ; 857: System.Runtime.Intrinsics => 111
	i64 u0xc111030af54d7191, ; 858: System.Resources.Writer => 103
	i64 u0xc12b8b3afa48329c, ; 859: lib_System.Linq.dll.so => 63
	i64 u0xc1479db534b80aeb, ; 860: lib_Xamarin.Google.MLKit.Vision.Interfaces.dll.so => 323
	i64 u0xc183ca0b74453aa9, ; 861: lib_System.Threading.Tasks.Dataflow.dll.so => 145
	i64 u0xc1c2cb7af77b8858, ; 862: Microsoft.EntityFrameworkCore => 187
	i64 u0xc1ff9ae3cdb6e1e6, ; 863: Xamarin.AndroidX.Activity.dll => 222
	i64 u0xc2260e1da1054ac1, ; 864: lib_BouncyCastle.Cryptography.dll.so => 179
	i64 u0xc26c064effb1dea9, ; 865: System.Buffers.dll => 7
	i64 u0xc28c50f32f81cc73, ; 866: ja/Microsoft.Maui.Controls.resources.dll => 358
	i64 u0xc2902f6cf5452577, ; 867: lib_Mono.Android.Export.dll.so => 173
	i64 u0xc2a3bca55b573141, ; 868: System.IO.FileSystem.Watcher => 50
	i64 u0xc2bcfec99f69365e, ; 869: Xamarin.AndroidX.ViewPager2.dll => 300
	i64 u0xc2d9bdaafc7fac5a, ; 870: lib_Xamarin.Google.MLKit.Common.dll.so => 321
	i64 u0xc30b52815b58ac2c, ; 871: lib_System.Runtime.Serialization.Xml.dll.so => 117
	i64 u0xc36d7d89c652f455, ; 872: System.Threading.Overlapped => 144
	i64 u0xc396b285e59e5493, ; 873: GoogleGson.dll => 183
	i64 u0xc3c86c1e5e12f03d, ; 874: WindowsBase => 169
	i64 u0xc3f0e03e56ce7b69, ; 875: zxing => 340
	i64 u0xc421b61fd853169d, ; 876: lib_System.Net.WebSockets.Client.dll.so => 82
	i64 u0xc463e077917aa21d, ; 877: System.Runtime.Serialization.Json => 115
	i64 u0xc472ce300460ccb6, ; 878: Microsoft.EntityFrameworkCore.dll => 187
	i64 u0xc4d3858ed4d08512, ; 879: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 273
	i64 u0xc4d69851fe06342f, ; 880: lib_Microsoft.Extensions.Caching.Memory.dll.so => 191
	i64 u0xc50fded0ded1418c, ; 881: lib_System.ComponentModel.TypeConverter.dll.so => 17
	i64 u0xc519125d6bc8fb11, ; 882: lib_System.Net.Requests.dll.so => 74
	i64 u0xc5293b19e4dc230e, ; 883: Xamarin.AndroidX.Navigation.Fragment => 278
	i64 u0xc531d8c734fea641, ; 884: Xamarin.GooglePlayServices.MLKit.BarcodeScanning.dll => 326
	i64 u0xc5325b2fcb37446f, ; 885: lib_System.Private.Xml.dll.so => 91
	i64 u0xc535cb9a21385d9b, ; 886: lib_Xamarin.Android.Glide.DiskLruCache.dll.so => 220
	i64 u0xc5a0f4b95a699af7, ; 887: lib_System.Private.Uri.dll.so => 89
	i64 u0xc5cdcd5b6277579e, ; 888: lib_System.Security.Cryptography.Algorithms.dll.so => 122
	i64 u0xc5ec286825cb0bf4, ; 889: Xamarin.AndroidX.Tracing.Tracing => 292
	i64 u0xc624ac4b92045a44, ; 890: lib_Xamarin.GooglePlayServices.MLKit.BarcodeScanning.dll.so => 326
	i64 u0xc6706bc8aa7fe265, ; 891: Xamarin.AndroidX.Annotation.Jvm => 226
	i64 u0xc6a4665a88c57225, ; 892: lib_ZstdSharp.dll.so => 339
	i64 u0xc74d70d4aa96cef3, ; 893: Xamarin.AndroidX.Navigation.Runtime.Android => 280
	i64 u0xc7c01e7d7c93a110, ; 894: System.Text.Encoding.Extensions.dll => 137
	i64 u0xc7ce851898a4548e, ; 895: lib_System.Web.HttpUtility.dll.so => 156
	i64 u0xc809d4089d2556b2, ; 896: System.Runtime.InteropServices.JavaScript.dll => 108
	i64 u0xc858a28d9ee5a6c5, ; 897: lib_System.Collections.Specialized.dll.so => 11
	i64 u0xc87a188861588632, ; 898: Xamarin.AndroidX.Camera.Video.dll => 235
	i64 u0xc8ac7c6bf1c2ec51, ; 899: System.Reflection.DispatchProxy.dll => 92
	i64 u0xc9c62c8f354ac568, ; 900: lib_System.Diagnostics.TextWriterTraceListener.dll.so => 31
	i64 u0xc9e54b32fc19baf3, ; 901: lib_CommunityToolkit.Maui.dll.so => 180
	i64 u0xca32340d8d54dcd5, ; 902: Microsoft.Extensions.Caching.Memory.dll => 191
	i64 u0xca3a723e7342c5b6, ; 903: lib-tr-Microsoft.Maui.Controls.resources.dll.so => 371
	i64 u0xca5801070d9fccfb, ; 904: System.Text.Encoding => 138
	i64 u0xcab3493c70141c2d, ; 905: pl/Microsoft.Maui.Controls.resources => 363
	i64 u0xcacfddc9f7c6de76, ; 906: ro/Microsoft.Maui.Controls.resources.dll => 366
	i64 u0xcadbc92899a777f0, ; 907: Xamarin.AndroidX.Startup.StartupRuntime => 290
	i64 u0xcb45618372c47127, ; 908: Microsoft.EntityFrameworkCore.Relational => 189
	i64 u0xcba1cb79f45292b5, ; 909: Xamarin.Android.Glide.GifDecoder.dll => 221
	i64 u0xcbb5f80c7293e696, ; 910: lib_System.Globalization.Calendars.dll.so => 40
	i64 u0xcbd4fdd9cef4a294, ; 911: lib__Microsoft.Android.Resource.Designer.dll.so => 381
	i64 u0xcc15da1e07bbd994, ; 912: Xamarin.AndroidX.SlidingPaneLayout => 289
	i64 u0xcc2876b32ef2794c, ; 913: lib_System.Text.RegularExpressions.dll.so => 141
	i64 u0xcc5c3bb714c4561e, ; 914: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 336
	i64 u0xcc76886e09b88260, ; 915: Xamarin.KotlinX.Serialization.Core.Jvm.dll => 338
	i64 u0xcc9fa2923aa1c9ef, ; 916: System.Diagnostics.Contracts.dll => 25
	i64 u0xccae9bb73e2326bd, ; 917: lib_System.IO.Hashing.dll.so => 176
	i64 u0xccf25c4b634ccd3a, ; 918: zh-Hans/Microsoft.Maui.Controls.resources.dll => 375
	i64 u0xcd10a42808629144, ; 919: System.Net.Requests => 74
	i64 u0xcdca1b920e9f53ba, ; 920: Xamarin.AndroidX.Interpolator => 259
	i64 u0xcdd0c48b6937b21c, ; 921: Xamarin.AndroidX.SwipeRefreshLayout => 291
	i64 u0xcde1fa22dc303670, ; 922: Microsoft.VisualStudio.DesignTools.XamlTapContract => 380
	i64 u0xcf1f7a2359f1a539, ; 923: Xamarin.JavaX.Inject.dll => 328
	i64 u0xcf23d8093f3ceadf, ; 924: System.Diagnostics.DiagnosticSource.dll => 27
	i64 u0xcf5ff6b6b2c4c382, ; 925: System.Net.Mail.dll => 68
	i64 u0xcf8fc898f98b0d34, ; 926: System.Private.Xml.Linq => 90
	i64 u0xd04b5f59ed596e31, ; 927: System.Reflection.Metadata.dll => 97
	i64 u0xd063299fcfc0c93f, ; 928: lib_System.Runtime.Serialization.Json.dll.so => 115
	i64 u0xd07eb0f20de63ff6, ; 929: Xamarin.Firebase.Encoders.JSON => 307
	i64 u0xd0de8a113e976700, ; 930: System.Diagnostics.TextWriterTraceListener => 31
	i64 u0xd0fc33d5ae5d4cb8, ; 931: System.Runtime.Extensions => 106
	i64 u0xd1194e1d8a8de83c, ; 932: lib_Xamarin.AndroidX.Lifecycle.Common.Jvm.dll.so => 261
	i64 u0xd12beacdfc14f696, ; 933: System.Dynamic.Runtime => 37
	i64 u0xd16fd7fb9bbcd43e, ; 934: Microsoft.Extensions.Diagnostics.Abstractions => 196
	i64 u0xd198e7ce1b6a8344, ; 935: System.Net.Quic.dll => 73
	i64 u0xd22a0c4630f2fe66, ; 936: lib_System.Security.Cryptography.ProtectedData.dll.so => 215
	i64 u0xd2c0bd0f35e3264d, ; 937: lib_BarcodeScanning.Native.Maui.dll.so => 178
	i64 u0xd3144156a3727ebe, ; 938: Xamarin.Google.Guava.ListenableFuture => 318
	i64 u0xd333d0af9e423810, ; 939: System.Runtime.InteropServices => 110
	i64 u0xd33a415cb4278969, ; 940: System.Security.Cryptography.Encoding.dll => 125
	i64 u0xd3426d966bb704f5, ; 941: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 228
	i64 u0xd3651b6fc3125825, ; 942: System.Private.Uri.dll => 89
	i64 u0xd373685349b1fe8b, ; 943: Microsoft.Extensions.Logging.dll => 199
	i64 u0xd3801faafafb7698, ; 944: System.Private.DataContractSerialization.dll => 88
	i64 u0xd3e4c8d6a2d5d470, ; 945: it/Microsoft.Maui.Controls.resources => 357
	i64 u0xd3edcc1f25459a50, ; 946: System.Reflection.Emit => 95
	i64 u0xd42655883bb8c19f, ; 947: Microsoft.EntityFrameworkCore.Abstractions.dll => 188
	i64 u0xd4645626dffec99d, ; 948: lib_Microsoft.Extensions.DependencyInjection.Abstractions.dll.so => 195
	i64 u0xd4fa0abb79079ea9, ; 949: System.Security.Principal.dll => 131
	i64 u0xd51e08cddf283b3c, ; 950: lib_Xamarin.AndroidX.Concurrent.Futures.Ktx.dll.so => 242
	i64 u0xd5507e11a2b2839f, ; 951: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 273
	i64 u0xd567f168deeeaf3c, ; 952: lib_zxing.dll.so => 340
	i64 u0xd5d04bef8478ea19, ; 953: Xamarin.AndroidX.Tracing.Tracing.dll => 292
	i64 u0xd60815f26a12e140, ; 954: Microsoft.Extensions.Logging.Debug.dll => 201
	i64 u0xd63b432ec9306914, ; 955: zxing.dll => 340
	i64 u0xd65786d27a4ad960, ; 956: lib_Microsoft.Maui.Controls.HotReload.Forms.dll.so => 377
	i64 u0xd6694f8359737e4e, ; 957: Xamarin.AndroidX.SavedState => 285
	i64 u0xd6949e129339eae5, ; 958: lib_Xamarin.AndroidX.Core.Core.Ktx.dll.so => 247
	i64 u0xd6d21782156bc35b, ; 959: Xamarin.AndroidX.SwipeRefreshLayout.dll => 291
	i64 u0xd6de019f6af72435, ; 960: Xamarin.AndroidX.ConstraintLayout.Core.dll => 244
	i64 u0xd70956d1e6deefb9, ; 961: Jsr305Binding => 315
	i64 u0xd72329819cbbbc44, ; 962: lib_Microsoft.Extensions.Configuration.Abstractions.dll.so => 193
	i64 u0xd72c760af136e863, ; 963: System.Xml.XmlSerializer.dll => 166
	i64 u0xd753f071e44c2a03, ; 964: lib_System.Security.SecureString.dll.so => 132
	i64 u0xd7b3764ada9d341d, ; 965: lib_Microsoft.Extensions.Logging.Abstractions.dll.so => 200
	i64 u0xd7f0088bc5ad71f2, ; 966: Xamarin.AndroidX.VersionedParcelable => 298
	i64 u0xd824ef6ab33f8f7a, ; 967: Xamarin.AndroidX.Window.WindowCore.dll => 302
	i64 u0xd8fb25e28ae30a12, ; 968: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 282
	i64 u0xd9d04d95a2671e29, ; 969: lib_ZXing.Net.MAUI.Controls.dll.so => 342
	i64 u0xd9e245a1762ddad5, ; 970: BouncyCastle.Cryptography => 179
	i64 u0xda1dfa4c534a9251, ; 971: Microsoft.Extensions.DependencyInjection => 194
	i64 u0xdad05a11827959a3, ; 972: System.Collections.NonGeneric.dll => 10
	i64 u0xdaefdfe71aa53cf9, ; 973: System.IO.FileSystem.Primitives => 49
	i64 u0xdb5383ab5865c007, ; 974: lib-vi-Microsoft.Maui.Controls.resources.dll.so => 373
	i64 u0xdb58816721c02a59, ; 975: lib_System.Reflection.Emit.ILGeneration.dll.so => 93
	i64 u0xdbeda89f832aa805, ; 976: vi/Microsoft.Maui.Controls.resources.dll => 373
	i64 u0xdbf2a779fbc3ac31, ; 977: System.Transactions.Local.dll => 153
	i64 u0xdbf9607a441b4505, ; 978: System.Linq => 63
	i64 u0xdbfc90157a0de9b0, ; 979: lib_System.Text.Encoding.dll.so => 138
	i64 u0xdc75032002d1a212, ; 980: lib_System.Transactions.Local.dll.so => 153
	i64 u0xdca8be7403f92d4f, ; 981: lib_System.Linq.Queryable.dll.so => 62
	i64 u0xdce2c53525640bf3, ; 982: Microsoft.Extensions.Logging => 199
	i64 u0xdd2b722d78ef5f43, ; 983: System.Runtime.dll => 119
	i64 u0xdd67031857c72f96, ; 984: lib_System.Text.Encodings.Web.dll.so => 139
	i64 u0xdd70765ad6162057, ; 985: Xamarin.JSpecify => 330
	i64 u0xdd92e229ad292030, ; 986: System.Numerics.dll => 86
	i64 u0xdde30e6b77aa6f6c, ; 987: lib-zh-Hans-Microsoft.Maui.Controls.resources.dll.so => 375
	i64 u0xde110ae80fa7c2e2, ; 988: System.Xml.XDocument.dll => 162
	i64 u0xde4726fcdf63a198, ; 989: Xamarin.AndroidX.Transition => 295
	i64 u0xde572c2b2fb32f93, ; 990: lib_System.Threading.Tasks.Extensions.dll.so => 146
	i64 u0xde8769ebda7d8647, ; 991: hr/Microsoft.Maui.Controls.resources.dll => 354
	i64 u0xdee075f3477ef6be, ; 992: Xamarin.AndroidX.ExifInterface.dll => 256
	i64 u0xdf298affd615b1d1, ; 993: lib_Xamarin.Google.MLKit.BarcodeScanning.Common.dll.so => 320
	i64 u0xdf35b6d818902893, ; 994: K4os.Hash.xxHash.dll => 186
	i64 u0xdf4b773de8fb1540, ; 995: System.Net.dll => 84
	i64 u0xdf9c7682560a9629, ; 996: System.Net.ServerSentEvents => 76
	i64 u0xdfa254ebb4346068, ; 997: System.Net.Ping => 71
	i64 u0xe0142572c095a480, ; 998: Xamarin.AndroidX.AppCompat.dll => 227
	i64 u0xe021eaa401792a05, ; 999: System.Text.Encoding.dll => 138
	i64 u0xe02f89350ec78051, ; 1000: Xamarin.AndroidX.CoordinatorLayout.dll => 245
	i64 u0xe0496b9d65ef5474, ; 1001: Xamarin.Android.Glide.DiskLruCache.dll => 220
	i64 u0xe10b760bb1462e7a, ; 1002: lib_System.Security.Cryptography.Primitives.dll.so => 127
	i64 u0xe12e27dc45f5d147, ; 1003: Pomelo.EntityFrameworkCore.MySql => 212
	i64 u0xe1566bbdb759c5af, ; 1004: Microsoft.Maui.Controls.HotReload.Forms.dll => 377
	i64 u0xe192a588d4410686, ; 1005: lib_System.IO.Pipelines.dll.so => 54
	i64 u0xe1a08bd3fa539e0d, ; 1006: System.Runtime.Loader => 112
	i64 u0xe1a77eb8831f7741, ; 1007: System.Security.SecureString.dll => 132
	i64 u0xe1b52f9f816c70ef, ; 1008: System.Private.Xml.Linq.dll => 90
	i64 u0xe1e199c8ab02e356, ; 1009: System.Data.DataSetExtensions.dll => 23
	i64 u0xe1ecfdb7fff86067, ; 1010: System.Net.Security.dll => 75
	i64 u0xe2252a80fe853de4, ; 1011: lib_System.Security.Principal.dll.so => 131
	i64 u0xe22fa4c9c645db62, ; 1012: System.Diagnostics.TextWriterTraceListener.dll => 31
	i64 u0xe24095a7afddaab3, ; 1013: lib_Microsoft.Extensions.Hosting.Abstractions.dll.so => 198
	i64 u0xe2420585aeceb728, ; 1014: System.Net.Requests.dll => 74
	i64 u0xe26692647e6bcb62, ; 1015: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 268
	i64 u0xe29b73bc11392966, ; 1016: lib-id-Microsoft.Maui.Controls.resources.dll.so => 356
	i64 u0xe2ad448dee50fbdf, ; 1017: System.Xml.Serialization => 161
	i64 u0xe2d920f978f5d85c, ; 1018: System.Data.DataSetExtensions => 23
	i64 u0xe2e426c7714fa0bc, ; 1019: Microsoft.Win32.Primitives.dll => 4
	i64 u0xe332bacb3eb4a806, ; 1020: Mono.Android.Export.dll => 173
	i64 u0xe3811d68d4fe8463, ; 1021: pt-BR/Microsoft.Maui.Controls.resources.dll => 364
	i64 u0xe3b7cbae5ad66c75, ; 1022: lib_System.Security.Cryptography.Encoding.dll.so => 125
	i64 u0xe4292b48f3224d5b, ; 1023: lib_Xamarin.AndroidX.Core.ViewTree.dll.so => 248
	i64 u0xe494f7ced4ecd10a, ; 1024: hu/Microsoft.Maui.Controls.resources.dll => 355
	i64 u0xe4a9b1e40d1e8917, ; 1025: lib-fi-Microsoft.Maui.Controls.resources.dll.so => 350
	i64 u0xe4f74a0b5bf9703f, ; 1026: System.Runtime.Serialization.Primitives => 116
	i64 u0xe5434e8a119ceb69, ; 1027: lib_Mono.Android.dll.so => 175
	i64 u0xe55703b9ce5c038a, ; 1028: System.Diagnostics.Tools => 32
	i64 u0xe57013c8afc270b5, ; 1029: Microsoft.VisualBasic => 3
	i64 u0xe57d22ca4aeb4900, ; 1030: System.Configuration.ConfigurationManager => 213
	i64 u0xe62913cc36bc07ec, ; 1031: System.Xml.dll => 167
	i64 u0xe690fffe6af5f4d7, ; 1032: Pomelo.EntityFrameworkCore.MySql.dll => 212
	i64 u0xe7bea09c4900a191, ; 1033: Xamarin.AndroidX.VectorDrawable.dll => 296
	i64 u0xe7e03cc18dcdeb49, ; 1034: lib_System.Diagnostics.StackTrace.dll.so => 30
	i64 u0xe7e147ff99a7a380, ; 1035: lib_System.Configuration.dll.so => 19
	i64 u0xe83ddbccfc6aff3f, ; 1036: Xamarin.Kotlin.StdLib.Jdk7 => 332
	i64 u0xe86b0df4ba9e5db8, ; 1037: lib_Xamarin.AndroidX.Lifecycle.Runtime.Android.dll.so => 267
	i64 u0xe896622fe0902957, ; 1038: System.Reflection.Emit.dll => 95
	i64 u0xe89a2a9ef110899b, ; 1039: System.Drawing.dll => 36
	i64 u0xe8c5f8c100b5934b, ; 1040: Microsoft.Win32.Registry => 5
	i64 u0xe960a4c983e03bf6, ; 1041: Xamarin.Google.MLKit.Common => 321
	i64 u0xe968ab252d3dda82, ; 1042: lib_Xamarin.Google.Android.DataTransport.TransportRuntime.dll.so => 311
	i64 u0xe98163eb702ae5c5, ; 1043: Xamarin.AndroidX.Arch.Core.Runtime => 230
	i64 u0xe994f23ba4c143e5, ; 1044: Xamarin.KotlinX.Coroutines.Android => 334
	i64 u0xe9b9c8c0458fd92a, ; 1045: System.Windows => 158
	i64 u0xe9d166d87a7f2bdb, ; 1046: lib_Xamarin.AndroidX.Startup.StartupRuntime.dll.so => 290
	i64 u0xea5a4efc2ad81d1b, ; 1047: Xamarin.Google.ErrorProne.Annotations => 317
	i64 u0xeb2313fe9d65b785, ; 1048: Xamarin.AndroidX.ConstraintLayout.dll => 243
	i64 u0xebc05bf326a78ad3, ; 1049: System.Windows.Extensions.dll => 217
	i64 u0xed19c616b3fcb7eb, ; 1050: Xamarin.AndroidX.VersionedParcelable.dll => 298
	i64 u0xed60c6fa891c051a, ; 1051: lib_Microsoft.VisualStudio.DesignTools.TapContract.dll.so => 379
	i64 u0xed6ef763c6fb395f, ; 1052: System.Diagnostics.EventLog.dll => 214
	i64 u0xedc4817167106c23, ; 1053: System.Net.Sockets.dll => 78
	i64 u0xedc632067fb20ff3, ; 1054: System.Memory.dll => 64
	i64 u0xedc8e4ca71a02a8b, ; 1055: Xamarin.AndroidX.Navigation.Runtime.dll => 279
	i64 u0xee81f5b3f1c4f83b, ; 1056: System.Threading.ThreadPool => 150
	i64 u0xeeb7ebb80150501b, ; 1057: lib_Xamarin.AndroidX.Collection.Jvm.dll.so => 239
	i64 u0xeefc635595ef57f0, ; 1058: System.Security.Cryptography.Cng => 123
	i64 u0xef03b1b5a04e9709, ; 1059: System.Text.Encoding.CodePages.dll => 136
	i64 u0xef5bcbe61622ee5f, ; 1060: Xamarin.AndroidX.Tracing.Tracing.Android.dll => 293
	i64 u0xef602c523fe2e87a, ; 1061: lib_Xamarin.Google.Guava.ListenableFuture.dll.so => 318
	i64 u0xef72742e1bcca27a, ; 1062: Microsoft.Maui.Essentials.dll => 208
	i64 u0xefd1e0c4e5c9b371, ; 1063: System.Resources.ResourceManager.dll => 102
	i64 u0xefe8f8d5ed3c72ea, ; 1064: System.Formats.Tar.dll => 39
	i64 u0xefec0b7fdc57ec42, ; 1065: Xamarin.AndroidX.Activity => 222
	i64 u0xeff59cbde4363ec3, ; 1066: System.Threading.AccessControl.dll => 142
	i64 u0xf00c29406ea45e19, ; 1067: es/Microsoft.Maui.Controls.resources.dll => 349
	i64 u0xf09e47b6ae914f6e, ; 1068: System.Net.NameResolution => 69
	i64 u0xf0ac2b489fed2e35, ; 1069: lib_System.Diagnostics.Debug.dll.so => 26
	i64 u0xf0bb49dadd3a1fe1, ; 1070: lib_System.Net.ServicePoint.dll.so => 77
	i64 u0xf0c16dff90fbf5d6, ; 1071: Xamarin.AndroidX.Window.WindowCore.Jvm => 303
	i64 u0xf0de2537ee19c6ca, ; 1072: lib_System.Net.WebHeaderCollection.dll.so => 80
	i64 u0xf1138779fa181c68, ; 1073: lib_Xamarin.AndroidX.Lifecycle.Runtime.dll.so => 266
	i64 u0xf11b621fc87b983f, ; 1074: Microsoft.Maui.Controls.Xaml.dll => 206
	i64 u0xf161f4f3c3b7e62c, ; 1075: System.Data => 24
	i64 u0xf16eb650d5a464bc, ; 1076: System.ValueTuple => 155
	i64 u0xf1c4b4005493d871, ; 1077: System.Formats.Asn1.dll => 38
	i64 u0xf2039b1a33e63e8e, ; 1078: Xamarin.Google.Android.DataTransport.TransportApi.dll => 309
	i64 u0xf22514cfad2d598b, ; 1079: lib_Xamarin.AndroidX.Lifecycle.ViewModelSavedState.Android.dll.so => 274
	i64 u0xf238bd79489d3a96, ; 1080: lib-nl-Microsoft.Maui.Controls.resources.dll.so => 362
	i64 u0xf2a69492c6bd46b0, ; 1081: lib_Xamarin.Kotlin.StdLib.Jdk7.dll.so => 332
	i64 u0xf2feea356ba760af, ; 1082: Xamarin.AndroidX.Arch.Core.Runtime.dll => 230
	i64 u0xf300e085f8acd238, ; 1083: lib_System.ServiceProcess.dll.so => 135
	i64 u0xf32a2fa88738a54c, ; 1084: lib_Xamarin.AndroidX.Camera.Video.dll.so => 235
	i64 u0xf34e52b26e7e059d, ; 1085: System.Runtime.CompilerServices.VisualC.dll => 105
	i64 u0xf37221fda4ef8830, ; 1086: lib_Xamarin.Google.Android.Material.dll.so => 312
	i64 u0xf3ad9b8fb3eefd12, ; 1087: lib_System.IO.UnmanagedMemoryStream.dll.so => 57
	i64 u0xf3ddfe05336abf29, ; 1088: System => 168
	i64 u0xf408654b2a135055, ; 1089: System.Reflection.Emit.ILGeneration.dll => 93
	i64 u0xf4103170a1de5bd0, ; 1090: System.Linq.Queryable.dll => 62
	i64 u0xf42d20c23173d77c, ; 1091: lib_System.ServiceModel.Web.dll.so => 134
	i64 u0xf4c1dd70a5496a17, ; 1092: System.IO.Compression => 46
	i64 u0xf4ecf4b9afc64781, ; 1093: System.ServiceProcess.dll => 135
	i64 u0xf4eeeaa566e9b970, ; 1094: lib_Xamarin.AndroidX.CustomView.PoolingContainer.dll.so => 251
	i64 u0xf518f63ead11fcd1, ; 1095: System.Threading.Tasks => 148
	i64 u0xf5fc7602fe27b333, ; 1096: System.Net.WebHeaderCollection => 80
	i64 u0xf6077741019d7428, ; 1097: Xamarin.AndroidX.CoordinatorLayout => 245
	i64 u0xf6742cbf457c450b, ; 1098: Xamarin.AndroidX.Lifecycle.Runtime.Android.dll => 267
	i64 u0xf6e8de2aebcbb422, ; 1099: lib_Xamarin.AndroidX.Window.WindowCore.Jvm.dll.so => 303
	i64 u0xf70c0a7bf8ccf5af, ; 1100: System.Web => 157
	i64 u0xf77b20923f07c667, ; 1101: de/Microsoft.Maui.Controls.resources.dll => 347
	i64 u0xf7e2cac4c45067b3, ; 1102: lib_System.Numerics.Vectors.dll.so => 85
	i64 u0xf7e74930e0e3d214, ; 1103: zh-HK/Microsoft.Maui.Controls.resources.dll => 374
	i64 u0xf84773b5c81e3cef, ; 1104: lib-uk-Microsoft.Maui.Controls.resources.dll.so => 372
	i64 u0xf8aac5ea82de1348, ; 1105: System.Linq.Queryable => 62
	i64 u0xf8abd63acd77d37b, ; 1106: Xamarin.AndroidX.Camera.View => 236
	i64 u0xf8b77539b362d3ba, ; 1107: lib_System.Reflection.Primitives.dll.so => 98
	i64 u0xf8e045dc345b2ea3, ; 1108: lib_Xamarin.AndroidX.RecyclerView.dll.so => 283
	i64 u0xf915dc29808193a1, ; 1109: System.Web.HttpUtility.dll => 156
	i64 u0xf96c777a2a0686f4, ; 1110: hi/Microsoft.Maui.Controls.resources.dll => 353
	i64 u0xf9be54c8bcf8ff3b, ; 1111: System.Security.AccessControl.dll => 120
	i64 u0xf9eec5bb3a6aedc6, ; 1112: Microsoft.Extensions.Options => 202
	i64 u0xfa0e82300e67f913, ; 1113: lib_System.AppContext.dll.so => 6
	i64 u0xfa2fdb27e8a2c8e8, ; 1114: System.ComponentModel.EventBasedAsync => 15
	i64 u0xfa3f278f288b0e84, ; 1115: lib_System.Net.Security.dll.so => 75
	i64 u0xfa504dfa0f097d72, ; 1116: Microsoft.Extensions.FileProviders.Abstractions.dll => 197
	i64 u0xfa5ed7226d978949, ; 1117: lib-ar-Microsoft.Maui.Controls.resources.dll.so => 343
	i64 u0xfa645d91e9fc4cba, ; 1118: System.Threading.Thread => 149
	i64 u0xfab337a1ee4b5b7c, ; 1119: Xamarin.AndroidX.Concurrent.Futures.Ktx.dll => 242
	i64 u0xfad4d2c770e827f9, ; 1120: lib_System.IO.IsolatedStorage.dll.so => 52
	i64 u0xfb06dd2338e6f7c4, ; 1121: System.Net.Ping.dll => 71
	i64 u0xfb087abe5365e3b7, ; 1122: lib_System.Data.DataSetExtensions.dll.so => 23
	i64 u0xfb4ac90114061e0d, ; 1123: BarcodeScanning.Native.Maui.dll => 178
	i64 u0xfb846e949baff5ea, ; 1124: System.Xml.Serialization.dll => 161
	i64 u0xfbad3e4ce4b98145, ; 1125: System.Security.Cryptography.X509Certificates => 128
	i64 u0xfbf0a31c9fc34bc4, ; 1126: lib_System.Net.Http.dll.so => 66
	i64 u0xfc6b7527cc280b3f, ; 1127: lib_System.Runtime.Serialization.Formatters.dll.so => 114
	i64 u0xfc719aec26adf9d9, ; 1128: Xamarin.AndroidX.Navigation.Fragment.dll => 278
	i64 u0xfc82690c2fe2735c, ; 1129: Xamarin.AndroidX.Lifecycle.Process.dll => 265
	i64 u0xfc93fc307d279893, ; 1130: System.IO.Pipes.AccessControl.dll => 55
	i64 u0xfcd302092ada6328, ; 1131: System.IO.MemoryMappedFiles.dll => 53
	i64 u0xfd22f00870e40ae0, ; 1132: lib_Xamarin.AndroidX.DrawerLayout.dll.so => 252
	i64 u0xfd49b3c1a76e2748, ; 1133: System.Runtime.InteropServices.RuntimeInformation => 109
	i64 u0xfd536c702f64dc47, ; 1134: System.Text.Encoding.Extensions => 137
	i64 u0xfd583f7657b6a1cb, ; 1135: Xamarin.AndroidX.Fragment => 257
	i64 u0xfd8dd91a2c26bd5d, ; 1136: Xamarin.AndroidX.Lifecycle.Runtime => 266
	i64 u0xfda36abccf05cf5c, ; 1137: System.Net.WebSockets.Client => 82
	i64 u0xfdbe4710aa9beeff, ; 1138: CommunityToolkit.Maui => 180
	i64 u0xfddbe9695626a7f5, ; 1139: Xamarin.AndroidX.Lifecycle.Common => 260
	i64 u0xfeae9952cf03b8cb, ; 1140: tr/Microsoft.Maui.Controls.resources => 371
	i64 u0xfebe1950717515f9, ; 1141: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 264
	i64 u0xff270a55858bac8d, ; 1142: System.Security.Principal => 131
	i64 u0xff9b54613e0d2cc8, ; 1143: System.Net.Http.Json => 65
	i64 u0xffb5607c2db1b7e8, ; 1144: Xamarin.Kotlin.StdLib.Jdk8 => 333
	i64 u0xffdb7a971be4ec73 ; 1145: System.ValueTuple.dll => 155
], align 8

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [1146 x i32] [
	i32 42, i32 335, i32 291, i32 13, i32 341, i32 279, i32 181, i32 107,
	i32 0, i32 191, i32 174, i32 48, i32 227, i32 0, i32 7, i32 321,
	i32 88, i32 367, i32 345, i32 373, i32 253, i32 72, i32 327, i32 283,
	i32 12, i32 207, i32 104, i32 374, i32 159, i32 19, i32 258, i32 239,
	i32 164, i32 319, i32 255, i32 296, i32 170, i32 367, i32 10, i32 201,
	i32 297, i32 98, i32 251, i32 252, i32 13, i32 202, i32 10, i32 325,
	i32 129, i32 305, i32 97, i32 190, i32 235, i32 143, i32 39, i32 368,
	i32 338, i32 299, i32 364, i32 234, i32 175, i32 221, i32 5, i32 208,
	i32 68, i32 288, i32 132, i32 287, i32 254, i32 69, i32 240, i32 67,
	i32 211, i32 57, i32 250, i32 52, i32 43, i32 127, i32 232, i32 68,
	i32 83, i32 268, i32 379, i32 161, i32 94, i32 184, i32 101, i32 283,
	i32 144, i32 154, i32 231, i32 351, i32 165, i32 172, i32 352, i32 304,
	i32 195, i32 83, i32 379, i32 330, i32 240, i32 4, i32 5, i32 214,
	i32 51, i32 103, i32 56, i32 122, i32 100, i32 171, i32 120, i32 335,
	i32 21, i32 355, i32 139, i32 99, i32 338, i32 79, i32 361, i32 322,
	i32 290, i32 121, i32 236, i32 8, i32 168, i32 370, i32 71, i32 220,
	i32 269, i32 284, i32 178, i32 174, i32 306, i32 148, i32 40, i32 204,
	i32 288, i32 47, i32 182, i32 30, i32 281, i32 359, i32 147, i32 202,
	i32 166, i32 28, i32 86, i32 292, i32 79, i32 43, i32 216, i32 29,
	i32 42, i32 105, i32 119, i32 225, i32 45, i32 93, i32 370, i32 56,
	i32 151, i32 378, i32 325, i32 184, i32 149, i32 187, i32 102, i32 49,
	i32 20, i32 246, i32 116, i32 218, i32 351, i32 316, i32 232, i32 331,
	i32 203, i32 233, i32 96, i32 58, i32 356, i32 354, i32 302, i32 83,
	i32 316, i32 172, i32 26, i32 333, i32 72, i32 282, i32 196, i32 256,
	i32 277, i32 377, i32 372, i32 320, i32 70, i32 33, i32 217, i32 350,
	i32 14, i32 141, i32 38, i32 376, i32 241, i32 310, i32 363, i32 136,
	i32 94, i32 90, i32 152, i32 303, i32 369, i32 24, i32 140, i32 57,
	i32 142, i32 51, i32 348, i32 306, i32 29, i32 160, i32 34, i32 167,
	i32 190, i32 310, i32 212, i32 257, i32 52, i32 381, i32 301, i32 92,
	i32 294, i32 307, i32 237, i32 35, i32 351, i32 160, i32 9, i32 349,
	i32 78, i32 59, i32 55, i32 207, i32 345, i32 306, i32 205, i32 13,
	i32 300, i32 192, i32 229, i32 111, i32 272, i32 32, i32 305, i32 106,
	i32 86, i32 94, i32 53, i32 98, i32 329, i32 58, i32 9, i32 104,
	i32 250, i32 69, i32 0, i32 213, i32 299, i32 344, i32 197, i32 127,
	i32 284, i32 118, i32 210, i32 137, i32 286, i32 128, i32 108, i32 331,
	i32 133, i32 231, i32 342, i32 318, i32 150, i32 159, i32 258, i32 246,
	i32 182, i32 253, i32 284, i32 99, i32 24, i32 289, i32 146, i32 198,
	i32 210, i32 276, i32 3, i32 213, i32 170, i32 228, i32 102, i32 164,
	i32 101, i32 248, i32 25, i32 95, i32 171, i32 175, i32 223, i32 3,
	i32 363, i32 293, i32 255, i32 1, i32 116, i32 331, i32 188, i32 258,
	i32 265, i32 33, i32 6, i32 367, i32 159, i32 365, i32 53, i32 216,
	i32 87, i32 298, i32 281, i32 44, i32 264, i32 106, i32 47, i32 140,
	i32 274, i32 65, i32 189, i32 308, i32 275, i32 70, i32 82, i32 60,
	i32 91, i32 157, i32 229, i32 135, i32 112, i32 204, i32 59, i32 357,
	i32 275, i32 282, i32 174, i32 136, i32 308, i32 143, i32 40, i32 344,
	i32 205, i32 319, i32 314, i32 61, i32 271, i32 81, i32 25, i32 36,
	i32 101, i32 268, i32 72, i32 22, i32 246, i32 209, i32 368, i32 123,
	i32 70, i32 109, i32 374, i32 121, i32 119, i32 260, i32 277, i32 261,
	i32 11, i32 2, i32 126, i32 117, i32 311, i32 145, i32 41, i32 322,
	i32 89, i32 224, i32 177, i32 198, i32 27, i32 151, i32 358, i32 194,
	i32 317, i32 223, i32 1, i32 225, i32 44, i32 245, i32 152, i32 18,
	i32 88, i32 346, i32 186, i32 324, i32 41, i32 264, i32 238, i32 333,
	i32 269, i32 96, i32 199, i32 28, i32 41, i32 80, i32 341, i32 254,
	i32 241, i32 147, i32 110, i32 239, i32 11, i32 107, i32 139, i32 16,
	i32 124, i32 67, i32 160, i32 22, i32 309, i32 322, i32 348, i32 337,
	i32 104, i32 194, i32 336, i32 64, i32 185, i32 58, i32 206, i32 347,
	i32 112, i32 177, i32 280, i32 380, i32 334, i32 9, i32 312, i32 122,
	i32 100, i32 211, i32 107, i32 76, i32 211, i32 272, i32 180, i32 339,
	i32 205, i32 113, i32 226, i32 49, i32 59, i32 20, i32 271, i32 249,
	i32 73, i32 319, i32 244, i32 310, i32 158, i32 39, i32 346, i32 35,
	i32 38, i32 352, i32 110, i32 361, i32 21, i32 329, i32 270, i32 215,
	i32 209, i32 15, i32 203, i32 81, i32 81, i32 249, i32 203, i32 278,
	i32 287, i32 155, i32 21, i32 207, i32 345, i32 50, i32 51, i32 371,
	i32 361, i32 96, i32 219, i32 196, i32 357, i32 16, i32 248, i32 125,
	i32 354, i32 163, i32 45, i32 317, i32 183, i32 118, i32 64, i32 169,
	i32 192, i32 14, i32 285, i32 113, i32 226, i32 185, i32 61, i32 314,
	i32 76, i32 123, i32 360, i32 2, i32 370, i32 216, i32 257, i32 311,
	i32 270, i32 309, i32 330, i32 270, i32 6, i32 238, i32 350, i32 253,
	i32 17, i32 368, i32 347, i32 79, i32 243, i32 277, i32 314, i32 325,
	i32 181, i32 133, i32 329, i32 294, i32 360, i32 85, i32 201, i32 12,
	i32 179, i32 34, i32 121, i32 337, i32 265, i32 176, i32 255, i32 87,
	i32 218, i32 327, i32 18, i32 299, i32 193, i32 242, i32 263, i32 313,
	i32 73, i32 378, i32 97, i32 326, i32 168, i32 259, i32 84, i32 376,
	i32 339, i32 227, i32 237, i32 157, i32 36, i32 154, i32 372, i32 375,
	i32 236, i32 147, i32 294, i32 56, i32 115, i32 189, i32 238, i32 296,
	i32 295, i32 37, i32 376, i32 192, i32 117, i32 225, i32 14, i32 219,
	i32 188, i32 149, i32 43, i32 208, i32 223, i32 304, i32 100, i32 336,
	i32 171, i32 16, i32 286, i32 48, i32 109, i32 99, i32 190, i32 275,
	i32 27, i32 130, i32 29, i32 307, i32 352, i32 185, i32 197, i32 287,
	i32 130, i32 44, i32 249, i32 254, i32 152, i32 8, i32 293, i32 214,
	i32 276, i32 353, i32 366, i32 327, i32 313, i32 365, i32 134, i32 364,
	i32 42, i32 337, i32 33, i32 381, i32 46, i32 146, i32 271, i32 206,
	i32 262, i32 250, i32 140, i32 63, i32 134, i32 344, i32 48, i32 163,
	i32 305, i32 230, i32 262, i32 219, i32 260, i32 360, i32 295, i32 46,
	i32 167, i32 176, i32 259, i32 232, i32 234, i32 349, i32 256, i32 356,
	i32 209, i32 324, i32 18, i32 8, i32 304, i32 183, i32 247, i32 286,
	i32 126, i32 233, i32 60, i32 204, i32 144, i32 186, i32 279, i32 323,
	i32 359, i32 266, i32 315, i32 313, i32 301, i32 153, i32 145, i32 335,
	i32 128, i32 334, i32 163, i32 165, i32 251, i32 222, i32 193, i32 280,
	i32 308, i32 362, i32 26, i32 276, i32 263, i32 234, i32 84, i32 301,
	i32 129, i32 316, i32 103, i32 151, i32 312, i32 302, i32 281, i32 54,
	i32 165, i32 170, i32 133, i32 37, i32 297, i32 359, i32 22, i32 114,
	i32 92, i32 50, i32 61, i32 124, i32 85, i32 129, i32 166, i32 210,
	i32 315, i32 169, i32 285, i32 288, i32 252, i32 218, i32 267, i32 4,
	i32 261, i32 355, i32 173, i32 2, i32 324, i32 272, i32 118, i32 380,
	i32 224, i32 19, i32 181, i32 200, i32 91, i32 66, i32 217, i32 30,
	i32 195, i32 348, i32 244, i32 60, i32 113, i32 263, i32 32, i32 182,
	i32 130, i32 162, i32 366, i32 241, i32 143, i32 362, i32 156, i32 17,
	i32 240, i32 221, i32 77, i32 75, i32 15, i32 172, i32 87, i32 323,
	i32 328, i32 126, i32 262, i32 273, i32 243, i32 369, i32 269, i32 34,
	i32 120, i32 141, i32 124, i32 108, i32 346, i32 328, i32 378, i32 297,
	i32 215, i32 237, i32 353, i32 343, i32 54, i32 47, i32 28, i32 142,
	i32 148, i32 200, i32 332, i32 150, i32 35, i32 369, i32 177, i32 77,
	i32 164, i32 1, i32 274, i32 289, i32 365, i32 358, i32 162, i32 12,
	i32 158, i32 184, i32 154, i32 78, i32 341, i32 105, i32 114, i32 229,
	i32 66, i32 67, i32 300, i32 45, i32 231, i32 111, i32 342, i32 233,
	i32 7, i32 320, i32 228, i32 55, i32 224, i32 65, i32 343, i32 247,
	i32 20, i32 111, i32 103, i32 63, i32 323, i32 145, i32 187, i32 222,
	i32 179, i32 7, i32 358, i32 173, i32 50, i32 300, i32 321, i32 117,
	i32 144, i32 183, i32 169, i32 340, i32 82, i32 115, i32 187, i32 273,
	i32 191, i32 17, i32 74, i32 278, i32 326, i32 91, i32 220, i32 89,
	i32 122, i32 292, i32 326, i32 226, i32 339, i32 280, i32 137, i32 156,
	i32 108, i32 11, i32 235, i32 92, i32 31, i32 180, i32 191, i32 371,
	i32 138, i32 363, i32 366, i32 290, i32 189, i32 221, i32 40, i32 381,
	i32 289, i32 141, i32 336, i32 338, i32 25, i32 176, i32 375, i32 74,
	i32 259, i32 291, i32 380, i32 328, i32 27, i32 68, i32 90, i32 97,
	i32 115, i32 307, i32 31, i32 106, i32 261, i32 37, i32 196, i32 73,
	i32 215, i32 178, i32 318, i32 110, i32 125, i32 228, i32 89, i32 199,
	i32 88, i32 357, i32 95, i32 188, i32 195, i32 131, i32 242, i32 273,
	i32 340, i32 292, i32 201, i32 340, i32 377, i32 285, i32 247, i32 291,
	i32 244, i32 315, i32 193, i32 166, i32 132, i32 200, i32 298, i32 302,
	i32 282, i32 342, i32 179, i32 194, i32 10, i32 49, i32 373, i32 93,
	i32 373, i32 153, i32 63, i32 138, i32 153, i32 62, i32 199, i32 119,
	i32 139, i32 330, i32 86, i32 375, i32 162, i32 295, i32 146, i32 354,
	i32 256, i32 320, i32 186, i32 84, i32 76, i32 71, i32 227, i32 138,
	i32 245, i32 220, i32 127, i32 212, i32 377, i32 54, i32 112, i32 132,
	i32 90, i32 23, i32 75, i32 131, i32 31, i32 198, i32 74, i32 268,
	i32 356, i32 161, i32 23, i32 4, i32 173, i32 364, i32 125, i32 248,
	i32 355, i32 350, i32 116, i32 175, i32 32, i32 3, i32 213, i32 167,
	i32 212, i32 296, i32 30, i32 19, i32 332, i32 267, i32 95, i32 36,
	i32 5, i32 321, i32 311, i32 230, i32 334, i32 158, i32 290, i32 317,
	i32 243, i32 217, i32 298, i32 379, i32 214, i32 78, i32 64, i32 279,
	i32 150, i32 239, i32 123, i32 136, i32 293, i32 318, i32 208, i32 102,
	i32 39, i32 222, i32 142, i32 349, i32 69, i32 26, i32 77, i32 303,
	i32 80, i32 266, i32 206, i32 24, i32 155, i32 38, i32 309, i32 274,
	i32 362, i32 332, i32 230, i32 135, i32 235, i32 105, i32 312, i32 57,
	i32 168, i32 93, i32 62, i32 134, i32 46, i32 135, i32 251, i32 148,
	i32 80, i32 245, i32 267, i32 303, i32 157, i32 347, i32 85, i32 374,
	i32 372, i32 62, i32 236, i32 98, i32 283, i32 156, i32 353, i32 120,
	i32 202, i32 6, i32 15, i32 75, i32 197, i32 343, i32 149, i32 242,
	i32 52, i32 71, i32 23, i32 178, i32 161, i32 128, i32 66, i32 114,
	i32 278, i32 265, i32 55, i32 53, i32 252, i32 109, i32 137, i32 257,
	i32 266, i32 82, i32 180, i32 260, i32 371, i32 264, i32 131, i32 65,
	i32 333, i32 155
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 u0x0000000000000000, ; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

; Functions

; Function attributes: memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.mm.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.mm.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" }

; Metadata
!llvm.module.flags = !{!0, !1, !7, !8, !9, !10}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!".NET for Android remotes/origin/release/10.0.1xx @ 01024bb616e7b80417a2c6d320885bfdb956f20a"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"branch-target-enforcement", i32 0}
!8 = !{i32 1, !"sign-return-address", i32 0}
!9 = !{i32 1, !"sign-return-address-all", i32 0}
!10 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
