; ModuleID = 'compressed_assemblies.arm64-v8a.ll'
source_filename = "compressed_assemblies.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android21"

%struct.CompressedAssemblyDescriptor = type {
	i32, ; uint32_t uncompressed_file_size
	i1, ; bool loaded
	i32 ; uint32_t buffer_offset
}

@compressed_assembly_count = dso_local local_unnamed_addr constant i32 187, align 4

@compressed_assembly_descriptors = dso_local local_unnamed_addr global [187 x %struct.CompressedAssemblyDescriptor] [
	%struct.CompressedAssemblyDescriptor {
		i32 15624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 0; uint32_t buffer_offset
	}, ; 0: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15672, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 15624; uint32_t buffer_offset
	}, ; 1: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15632, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 31296; uint32_t buffer_offset
	}, ; 2: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15672, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 46928; uint32_t buffer_offset
	}, ; 3: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 62600; uint32_t buffer_offset
	}, ; 4: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 78224; uint32_t buffer_offset
	}, ; 5: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 93848; uint32_t buffer_offset
	}, ; 6: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15632, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 109472; uint32_t buffer_offset
	}, ; 7: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 125104; uint32_t buffer_offset
	}, ; 8: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 140728; uint32_t buffer_offset
	}, ; 9: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 156352; uint32_t buffer_offset
	}, ; 10: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15672, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 171976; uint32_t buffer_offset
	}, ; 11: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15632, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 187648; uint32_t buffer_offset
	}, ; 12: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15672, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 203280; uint32_t buffer_offset
	}, ; 13: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 218952; uint32_t buffer_offset
	}, ; 14: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 234576; uint32_t buffer_offset
	}, ; 15: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 250200; uint32_t buffer_offset
	}, ; 16: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15672, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 265824; uint32_t buffer_offset
	}, ; 17: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 281496; uint32_t buffer_offset
	}, ; 18: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 297120; uint32_t buffer_offset
	}, ; 19: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 312744; uint32_t buffer_offset
	}, ; 20: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15632, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 328368; uint32_t buffer_offset
	}, ; 21: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 344000; uint32_t buffer_offset
	}, ; 22: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 359624; uint32_t buffer_offset
	}, ; 23: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 375248; uint32_t buffer_offset
	}, ; 24: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 390872; uint32_t buffer_offset
	}, ; 25: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 406496; uint32_t buffer_offset
	}, ; 26: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15672, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 422120; uint32_t buffer_offset
	}, ; 27: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 437792; uint32_t buffer_offset
	}, ; 28: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15664, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 453416; uint32_t buffer_offset
	}, ; 29: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 469080; uint32_t buffer_offset
	}, ; 30: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 484704; uint32_t buffer_offset
	}, ; 31: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 500328; uint32_t buffer_offset
	}, ; 32: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 515952; uint32_t buffer_offset
	}, ; 33: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 6144, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 531576; uint32_t buffer_offset
	}, ; 34: _Microsoft.Android.Resource.Designer
	%struct.CompressedAssemblyDescriptor {
		i32 4924576, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 537720; uint32_t buffer_offset
	}, ; 35: BouncyCastle.Cryptography
	%struct.CompressedAssemblyDescriptor {
		i32 272528, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 5462296; uint32_t buffer_offset
	}, ; 36: CommunityToolkit.Maui
	%struct.CompressedAssemblyDescriptor {
		i32 116376, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 5734824; uint32_t buffer_offset
	}, ; 37: CommunityToolkit.Maui.Core
	%struct.CompressedAssemblyDescriptor {
		i32 320000, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 5851200; uint32_t buffer_offset
	}, ; 38: Google.Protobuf
	%struct.CompressedAssemblyDescriptor {
		i32 70656, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 6171200; uint32_t buffer_offset
	}, ; 39: K4os.Compression.LZ4
	%struct.CompressedAssemblyDescriptor {
		i32 84992, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 6241856; uint32_t buffer_offset
	}, ; 40: K4os.Compression.LZ4.Streams
	%struct.CompressedAssemblyDescriptor {
		i32 13312, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 6326848; uint32_t buffer_offset
	}, ; 41: K4os.Hash.xxHash
	%struct.CompressedAssemblyDescriptor {
		i32 2683432, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 6340160; uint32_t buffer_offset
	}, ; 42: Microsoft.EntityFrameworkCore
	%struct.CompressedAssemblyDescriptor {
		i32 14848, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 9023592; uint32_t buffer_offset
	}, ; 43: Microsoft.EntityFrameworkCore.Abstractions
	%struct.CompressedAssemblyDescriptor {
		i32 2137136, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 9038440; uint32_t buffer_offset
	}, ; 44: Microsoft.EntityFrameworkCore.Relational
	%struct.CompressedAssemblyDescriptor {
		i32 11264, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 11175576; uint32_t buffer_offset
	}, ; 45: Microsoft.Extensions.Caching.Abstractions
	%struct.CompressedAssemblyDescriptor {
		i32 26112, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 11186840; uint32_t buffer_offset
	}, ; 46: Microsoft.Extensions.Caching.Memory
	%struct.CompressedAssemblyDescriptor {
		i32 15872, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 11212952; uint32_t buffer_offset
	}, ; 47: Microsoft.Extensions.Configuration
	%struct.CompressedAssemblyDescriptor {
		i32 6656, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 11228824; uint32_t buffer_offset
	}, ; 48: Microsoft.Extensions.Configuration.Abstractions
	%struct.CompressedAssemblyDescriptor {
		i32 47104, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 11235480; uint32_t buffer_offset
	}, ; 49: Microsoft.Extensions.DependencyInjection
	%struct.CompressedAssemblyDescriptor {
		i32 33280, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 11282584; uint32_t buffer_offset
	}, ; 50: Microsoft.Extensions.DependencyInjection.Abstractions
	%struct.CompressedAssemblyDescriptor {
		i32 8192, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 11315864; uint32_t buffer_offset
	}, ; 51: Microsoft.Extensions.Diagnostics.Abstractions
	%struct.CompressedAssemblyDescriptor {
		i32 7168, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 11324056; uint32_t buffer_offset
	}, ; 52: Microsoft.Extensions.FileProviders.Abstractions
	%struct.CompressedAssemblyDescriptor {
		i32 6144, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 11331224; uint32_t buffer_offset
	}, ; 53: Microsoft.Extensions.Hosting.Abstractions
	%struct.CompressedAssemblyDescriptor {
		i32 19968, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 11337368; uint32_t buffer_offset
	}, ; 54: Microsoft.Extensions.Logging
	%struct.CompressedAssemblyDescriptor {
		i32 38400, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 11357336; uint32_t buffer_offset
	}, ; 55: Microsoft.Extensions.Logging.Abstractions
	%struct.CompressedAssemblyDescriptor {
		i32 16896, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 11395736; uint32_t buffer_offset
	}, ; 56: Microsoft.Extensions.Options
	%struct.CompressedAssemblyDescriptor {
		i32 9216, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 11412632; uint32_t buffer_offset
	}, ; 57: Microsoft.Extensions.Primitives
	%struct.CompressedAssemblyDescriptor {
		i32 58368, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 11421848; uint32_t buffer_offset
	}, ; 58: Microsoft.Maui.Controls.Compatibility
	%struct.CompressedAssemblyDescriptor {
		i32 1929992, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 11480216; uint32_t buffer_offset
	}, ; 59: Microsoft.Maui.Controls
	%struct.CompressedAssemblyDescriptor {
		i32 135432, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 13410208; uint32_t buffer_offset
	}, ; 60: Microsoft.Maui.Controls.Xaml
	%struct.CompressedAssemblyDescriptor {
		i32 862720, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 13545640; uint32_t buffer_offset
	}, ; 61: Microsoft.Maui
	%struct.CompressedAssemblyDescriptor {
		i32 90624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 14408360; uint32_t buffer_offset
	}, ; 62: Microsoft.Maui.Essentials
	%struct.CompressedAssemblyDescriptor {
		i32 208648, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 14498984; uint32_t buffer_offset
	}, ; 63: Microsoft.Maui.Graphics
	%struct.CompressedAssemblyDescriptor {
		i32 1202824, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 14707632; uint32_t buffer_offset
	}, ; 64: MySql.Data
	%struct.CompressedAssemblyDescriptor {
		i32 654848, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 15910456; uint32_t buffer_offset
	}, ; 65: MySqlConnector
	%struct.CompressedAssemblyDescriptor {
		i32 526848, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 16565304; uint32_t buffer_offset
	}, ; 66: Pomelo.EntityFrameworkCore.MySql
	%struct.CompressedAssemblyDescriptor {
		i32 442632, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 17092152; uint32_t buffer_offset
	}, ; 67: System.Configuration.ConfigurationManager
	%struct.CompressedAssemblyDescriptor {
		i32 5632, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 17534784; uint32_t buffer_offset
	}, ; 68: System.Diagnostics.EventLog
	%struct.CompressedAssemblyDescriptor {
		i32 10752, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 17540416; uint32_t buffer_offset
	}, ; 69: System.Security.Cryptography.ProtectedData
	%struct.CompressedAssemblyDescriptor {
		i32 6656, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 17551168; uint32_t buffer_offset
	}, ; 70: System.Security.Permissions
	%struct.CompressedAssemblyDescriptor {
		i32 73728, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 17557824; uint32_t buffer_offset
	}, ; 71: Xamarin.AndroidX.Activity
	%struct.CompressedAssemblyDescriptor {
		i32 583680, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 17631552; uint32_t buffer_offset
	}, ; 72: Xamarin.AndroidX.AppCompat
	%struct.CompressedAssemblyDescriptor {
		i32 17920, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 18215232; uint32_t buffer_offset
	}, ; 73: Xamarin.AndroidX.AppCompat.AppCompatResources
	%struct.CompressedAssemblyDescriptor {
		i32 788992, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 18233152; uint32_t buffer_offset
	}, ; 74: Xamarin.AndroidX.Camera.Core
	%struct.CompressedAssemblyDescriptor {
		i32 13312, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 19022144; uint32_t buffer_offset
	}, ; 75: Xamarin.AndroidX.Camera.Lifecycle
	%struct.CompressedAssemblyDescriptor {
		i32 31232, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 19035456; uint32_t buffer_offset
	}, ; 76: Xamarin.AndroidX.Camera.Video
	%struct.CompressedAssemblyDescriptor {
		i32 88576, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 19066688; uint32_t buffer_offset
	}, ; 77: Xamarin.AndroidX.Camera.View
	%struct.CompressedAssemblyDescriptor {
		i32 18944, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 19155264; uint32_t buffer_offset
	}, ; 78: Xamarin.AndroidX.CardView
	%struct.CompressedAssemblyDescriptor {
		i32 22528, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 19174208; uint32_t buffer_offset
	}, ; 79: Xamarin.AndroidX.Collection.Jvm
	%struct.CompressedAssemblyDescriptor {
		i32 78336, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 19196736; uint32_t buffer_offset
	}, ; 80: Xamarin.AndroidX.CoordinatorLayout
	%struct.CompressedAssemblyDescriptor {
		i32 614912, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 19275072; uint32_t buffer_offset
	}, ; 81: Xamarin.AndroidX.Core
	%struct.CompressedAssemblyDescriptor {
		i32 26624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 19889984; uint32_t buffer_offset
	}, ; 82: Xamarin.AndroidX.CursorAdapter
	%struct.CompressedAssemblyDescriptor {
		i32 9728, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 19916608; uint32_t buffer_offset
	}, ; 83: Xamarin.AndroidX.CustomView
	%struct.CompressedAssemblyDescriptor {
		i32 47104, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 19926336; uint32_t buffer_offset
	}, ; 84: Xamarin.AndroidX.DrawerLayout
	%struct.CompressedAssemblyDescriptor {
		i32 236032, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 19973440; uint32_t buffer_offset
	}, ; 85: Xamarin.AndroidX.Fragment
	%struct.CompressedAssemblyDescriptor {
		i32 23552, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 20209472; uint32_t buffer_offset
	}, ; 86: Xamarin.AndroidX.Lifecycle.Common.Jvm
	%struct.CompressedAssemblyDescriptor {
		i32 18944, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 20233024; uint32_t buffer_offset
	}, ; 87: Xamarin.AndroidX.Lifecycle.LiveData.Core
	%struct.CompressedAssemblyDescriptor {
		i32 32768, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 20251968; uint32_t buffer_offset
	}, ; 88: Xamarin.AndroidX.Lifecycle.ViewModel.Android
	%struct.CompressedAssemblyDescriptor {
		i32 13824, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 20284736; uint32_t buffer_offset
	}, ; 89: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.Android
	%struct.CompressedAssemblyDescriptor {
		i32 39424, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 20298560; uint32_t buffer_offset
	}, ; 90: Xamarin.AndroidX.Loader
	%struct.CompressedAssemblyDescriptor {
		i32 92672, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 20337984; uint32_t buffer_offset
	}, ; 91: Xamarin.AndroidX.Navigation.Common.Android
	%struct.CompressedAssemblyDescriptor {
		i32 19456, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 20430656; uint32_t buffer_offset
	}, ; 92: Xamarin.AndroidX.Navigation.Fragment
	%struct.CompressedAssemblyDescriptor {
		i32 65536, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 20450112; uint32_t buffer_offset
	}, ; 93: Xamarin.AndroidX.Navigation.Runtime.Android
	%struct.CompressedAssemblyDescriptor {
		i32 27136, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 20515648; uint32_t buffer_offset
	}, ; 94: Xamarin.AndroidX.Navigation.UI
	%struct.CompressedAssemblyDescriptor {
		i32 457728, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 20542784; uint32_t buffer_offset
	}, ; 95: Xamarin.AndroidX.RecyclerView
	%struct.CompressedAssemblyDescriptor {
		i32 12288, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 21000512; uint32_t buffer_offset
	}, ; 96: Xamarin.AndroidX.SavedState.SavedState.Android
	%struct.CompressedAssemblyDescriptor {
		i32 41984, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 21012800; uint32_t buffer_offset
	}, ; 97: Xamarin.AndroidX.SwipeRefreshLayout
	%struct.CompressedAssemblyDescriptor {
		i32 62976, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 21054784; uint32_t buffer_offset
	}, ; 98: Xamarin.AndroidX.ViewPager
	%struct.CompressedAssemblyDescriptor {
		i32 40448, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 21117760; uint32_t buffer_offset
	}, ; 99: Xamarin.AndroidX.ViewPager2
	%struct.CompressedAssemblyDescriptor {
		i32 732160, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 21158208; uint32_t buffer_offset
	}, ; 100: Xamarin.Google.Android.Material
	%struct.CompressedAssemblyDescriptor {
		i32 15360, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 21890368; uint32_t buffer_offset
	}, ; 101: Xamarin.Google.Guava.ListenableFuture
	%struct.CompressedAssemblyDescriptor {
		i32 90624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 21905728; uint32_t buffer_offset
	}, ; 102: Xamarin.Kotlin.StdLib
	%struct.CompressedAssemblyDescriptor {
		i32 28672, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 21996352; uint32_t buffer_offset
	}, ; 103: Xamarin.KotlinX.Coroutines.Core.Jvm
	%struct.CompressedAssemblyDescriptor {
		i32 91648, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 22025024; uint32_t buffer_offset
	}, ; 104: Xamarin.KotlinX.Serialization.Core.Jvm
	%struct.CompressedAssemblyDescriptor {
		i32 396288, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 22116672; uint32_t buffer_offset
	}, ; 105: ZstdSharp
	%struct.CompressedAssemblyDescriptor {
		i32 516096, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 22512960; uint32_t buffer_offset
	}, ; 106: zxing
	%struct.CompressedAssemblyDescriptor {
		i32 41984, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 23029056; uint32_t buffer_offset
	}, ; 107: ZXing.Net.MAUI
	%struct.CompressedAssemblyDescriptor {
		i32 16384, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 23071040; uint32_t buffer_offset
	}, ; 108: ZXing.Net.MAUI.Controls
	%struct.CompressedAssemblyDescriptor {
		i32 267264, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 23087424; uint32_t buffer_offset
	}, ; 109: UltimateWalletFinal
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 23354688; uint32_t buffer_offset
	}, ; 110: Microsoft.Win32.Primitives
	%struct.CompressedAssemblyDescriptor {
		i32 34816, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 23359808; uint32_t buffer_offset
	}, ; 111: System.Collections.Concurrent
	%struct.CompressedAssemblyDescriptor {
		i32 90624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 23394624; uint32_t buffer_offset
	}, ; 112: System.Collections.Immutable
	%struct.CompressedAssemblyDescriptor {
		i32 19968, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 23485248; uint32_t buffer_offset
	}, ; 113: System.Collections.NonGeneric
	%struct.CompressedAssemblyDescriptor {
		i32 24576, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 23505216; uint32_t buffer_offset
	}, ; 114: System.Collections.Specialized
	%struct.CompressedAssemblyDescriptor {
		i32 71168, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 23529792; uint32_t buffer_offset
	}, ; 115: System.Collections
	%struct.CompressedAssemblyDescriptor {
		i32 6656, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 23600960; uint32_t buffer_offset
	}, ; 116: System.ComponentModel.Annotations
	%struct.CompressedAssemblyDescriptor {
		i32 9216, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 23607616; uint32_t buffer_offset
	}, ; 117: System.ComponentModel.EventBasedAsync
	%struct.CompressedAssemblyDescriptor {
		i32 18944, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 23616832; uint32_t buffer_offset
	}, ; 118: System.ComponentModel.Primitives
	%struct.CompressedAssemblyDescriptor {
		i32 143872, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 23635776; uint32_t buffer_offset
	}, ; 119: System.ComponentModel.TypeConverter
	%struct.CompressedAssemblyDescriptor {
		i32 5632, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 23779648; uint32_t buffer_offset
	}, ; 120: System.ComponentModel
	%struct.CompressedAssemblyDescriptor {
		i32 12288, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 23785280; uint32_t buffer_offset
	}, ; 121: System.Console
	%struct.CompressedAssemblyDescriptor {
		i32 668160, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 23797568; uint32_t buffer_offset
	}, ; 122: System.Data.Common
	%struct.CompressedAssemblyDescriptor {
		i32 58368, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 24465728; uint32_t buffer_offset
	}, ; 123: System.Diagnostics.DiagnosticSource
	%struct.CompressedAssemblyDescriptor {
		i32 34304, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 24524096; uint32_t buffer_offset
	}, ; 124: System.Diagnostics.Process
	%struct.CompressedAssemblyDescriptor {
		i32 5632, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 24558400; uint32_t buffer_offset
	}, ; 125: System.Diagnostics.TextWriterTraceListener
	%struct.CompressedAssemblyDescriptor {
		i32 28160, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 24564032; uint32_t buffer_offset
	}, ; 126: System.Diagnostics.TraceSource
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 24592192; uint32_t buffer_offset
	}, ; 127: System.Diagnostics.Tracing
	%struct.CompressedAssemblyDescriptor {
		i32 36864, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 24597312; uint32_t buffer_offset
	}, ; 128: System.Drawing.Primitives
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 24634176; uint32_t buffer_offset
	}, ; 129: System.Drawing
	%struct.CompressedAssemblyDescriptor {
		i32 62464, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 24639296; uint32_t buffer_offset
	}, ; 130: System.Formats.Asn1
	%struct.CompressedAssemblyDescriptor {
		i32 22016, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 24701760; uint32_t buffer_offset
	}, ; 131: System.IO.Compression.Brotli
	%struct.CompressedAssemblyDescriptor {
		i32 33792, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 24723776; uint32_t buffer_offset
	}, ; 132: System.IO.Compression
	%struct.CompressedAssemblyDescriptor {
		i32 26112, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 24757568; uint32_t buffer_offset
	}, ; 133: System.IO.MemoryMappedFiles
	%struct.CompressedAssemblyDescriptor {
		i32 7680, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 24783680; uint32_t buffer_offset
	}, ; 134: System.IO.Pipelines
	%struct.CompressedAssemblyDescriptor {
		i32 27136, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 24791360; uint32_t buffer_offset
	}, ; 135: System.IO.Pipes
	%struct.CompressedAssemblyDescriptor {
		i32 447488, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 24818496; uint32_t buffer_offset
	}, ; 136: System.Linq.Expressions
	%struct.CompressedAssemblyDescriptor {
		i32 55808, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 25265984; uint32_t buffer_offset
	}, ; 137: System.Linq.Queryable
	%struct.CompressedAssemblyDescriptor {
		i32 161792, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 25321792; uint32_t buffer_offset
	}, ; 138: System.Linq
	%struct.CompressedAssemblyDescriptor {
		i32 16896, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 25483584; uint32_t buffer_offset
	}, ; 139: System.Memory
	%struct.CompressedAssemblyDescriptor {
		i32 384512, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 25500480; uint32_t buffer_offset
	}, ; 140: System.Net.Http
	%struct.CompressedAssemblyDescriptor {
		i32 13824, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 25884992; uint32_t buffer_offset
	}, ; 141: System.Net.Mail
	%struct.CompressedAssemblyDescriptor {
		i32 28672, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 25898816; uint32_t buffer_offset
	}, ; 142: System.Net.NameResolution
	%struct.CompressedAssemblyDescriptor {
		i32 28160, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 25927488; uint32_t buffer_offset
	}, ; 143: System.Net.NetworkInformation
	%struct.CompressedAssemblyDescriptor {
		i32 70144, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 25955648; uint32_t buffer_offset
	}, ; 144: System.Net.Primitives
	%struct.CompressedAssemblyDescriptor {
		i32 90112, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 26025792; uint32_t buffer_offset
	}, ; 145: System.Net.Requests
	%struct.CompressedAssemblyDescriptor {
		i32 173568, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 26115904; uint32_t buffer_offset
	}, ; 146: System.Net.Security
	%struct.CompressedAssemblyDescriptor {
		i32 117760, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 26289472; uint32_t buffer_offset
	}, ; 147: System.Net.Sockets
	%struct.CompressedAssemblyDescriptor {
		i32 12288, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 26407232; uint32_t buffer_offset
	}, ; 148: System.Net.WebClient
	%struct.CompressedAssemblyDescriptor {
		i32 10240, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 26419520; uint32_t buffer_offset
	}, ; 149: System.Net.WebHeaderCollection
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 26429760; uint32_t buffer_offset
	}, ; 150: System.Numerics.Vectors
	%struct.CompressedAssemblyDescriptor {
		i32 18432, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 26434880; uint32_t buffer_offset
	}, ; 151: System.ObjectModel
	%struct.CompressedAssemblyDescriptor {
		i32 76800, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 26453312; uint32_t buffer_offset
	}, ; 152: System.Private.Uri
	%struct.CompressedAssemblyDescriptor {
		i32 1351680, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 26530112; uint32_t buffer_offset
	}, ; 153: System.Private.Xml
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 27881792; uint32_t buffer_offset
	}, ; 154: System.Runtime.CompilerServices.Unsafe
	%struct.CompressedAssemblyDescriptor {
		i32 9216, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 27886912; uint32_t buffer_offset
	}, ; 155: System.Runtime.InteropServices
	%struct.CompressedAssemblyDescriptor {
		i32 5632, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 27896128; uint32_t buffer_offset
	}, ; 156: System.Runtime.Intrinsics
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 27901760; uint32_t buffer_offset
	}, ; 157: System.Runtime.Loader
	%struct.CompressedAssemblyDescriptor {
		i32 96768, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 27906880; uint32_t buffer_offset
	}, ; 158: System.Runtime.Numerics
	%struct.CompressedAssemblyDescriptor {
		i32 7168, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 28003648; uint32_t buffer_offset
	}, ; 159: System.Runtime.Serialization.Formatters
	%struct.CompressedAssemblyDescriptor {
		i32 18944, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 28010816; uint32_t buffer_offset
	}, ; 160: System.Runtime
	%struct.CompressedAssemblyDescriptor {
		i32 11264, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 28029760; uint32_t buffer_offset
	}, ; 161: System.Security.Claims
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 28041024; uint32_t buffer_offset
	}, ; 162: System.Security.Cryptography.Algorithms
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 28046144; uint32_t buffer_offset
	}, ; 163: System.Security.Cryptography.Csp
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 28051264; uint32_t buffer_offset
	}, ; 164: System.Security.Cryptography.Encoding
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 28056384; uint32_t buffer_offset
	}, ; 165: System.Security.Cryptography.Primitives
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 28061504; uint32_t buffer_offset
	}, ; 166: System.Security.Cryptography.X509Certificates
	%struct.CompressedAssemblyDescriptor {
		i32 309248, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 28066624; uint32_t buffer_offset
	}, ; 167: System.Security.Cryptography
	%struct.CompressedAssemblyDescriptor {
		i32 6144, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 28375872; uint32_t buffer_offset
	}, ; 168: System.Security.Principal.Windows
	%struct.CompressedAssemblyDescriptor {
		i32 699904, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 28382016; uint32_t buffer_offset
	}, ; 169: System.Text.Encoding.CodePages
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 29081920; uint32_t buffer_offset
	}, ; 170: System.Text.Encoding.Extensions
	%struct.CompressedAssemblyDescriptor {
		i32 29696, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 29087040; uint32_t buffer_offset
	}, ; 171: System.Text.Encodings.Web
	%struct.CompressedAssemblyDescriptor {
		i32 380416, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 29116736; uint32_t buffer_offset
	}, ; 172: System.Text.Json
	%struct.CompressedAssemblyDescriptor {
		i32 342016, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 29497152; uint32_t buffer_offset
	}, ; 173: System.Text.RegularExpressions
	%struct.CompressedAssemblyDescriptor {
		i32 24064, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 29839168; uint32_t buffer_offset
	}, ; 174: System.Threading.Channels
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 29863232; uint32_t buffer_offset
	}, ; 175: System.Threading.Thread
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 29868352; uint32_t buffer_offset
	}, ; 176: System.Threading.ThreadPool
	%struct.CompressedAssemblyDescriptor {
		i32 11264, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 29873472; uint32_t buffer_offset
	}, ; 177: System.Threading
	%struct.CompressedAssemblyDescriptor {
		i32 70144, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 29884736; uint32_t buffer_offset
	}, ; 178: System.Transactions.Local
	%struct.CompressedAssemblyDescriptor {
		i32 7168, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 29954880; uint32_t buffer_offset
	}, ; 179: System.Web.HttpUtility
	%struct.CompressedAssemblyDescriptor {
		i32 5632, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 29962048; uint32_t buffer_offset
	}, ; 180: System.Xml.ReaderWriter
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 29967680; uint32_t buffer_offset
	}, ; 181: System.Xml.XmlSerializer
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 29972800; uint32_t buffer_offset
	}, ; 182: System
	%struct.CompressedAssemblyDescriptor {
		i32 2494976, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 29977920; uint32_t buffer_offset
	}, ; 183: System.Private.CoreLib
	%struct.CompressedAssemblyDescriptor {
		i32 171008, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 32472896; uint32_t buffer_offset
	}, ; 184: Java.Interop
	%struct.CompressedAssemblyDescriptor {
		i32 21536, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 32643904; uint32_t buffer_offset
	}, ; 185: Mono.Android.Runtime
	%struct.CompressedAssemblyDescriptor {
		i32 2189824, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 32665440; uint32_t buffer_offset
	} ; 186: Mono.Android
], align 4

@uncompressed_assemblies_data_size = dso_local local_unnamed_addr constant i32 34855264, align 4

@uncompressed_assemblies_data_buffer = dso_local local_unnamed_addr global [34855264 x i8] zeroinitializer, align 1

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
